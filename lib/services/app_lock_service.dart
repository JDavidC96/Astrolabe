import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:local_auth/local_auth.dart';

/// Guards the app behind a PIN, with optional biometric unlock.
///
/// The PIN itself is never stored — only a salted SHA-256 hash, so reading
/// the device's secure storage does not reveal it.
class AppLockService {
  AppLockService({
    FlutterSecureStorage? storage,
    LocalAuthentication? localAuth,
  })  : _storage = storage ?? const FlutterSecureStorage(),
        _localAuth = localAuth ?? LocalAuthentication();

  final FlutterSecureStorage _storage;
  final LocalAuthentication _localAuth;

  static const _hashKey = 'pin_hash';
  static const _saltKey = 'pin_salt';
  static const _biometricKey = 'biometric_enabled';

  static String hashPin(String pin, String salt) {
    return sha256.convert(utf8.encode('$salt:$pin')).toString();
  }

  static String _newSalt() {
    final random = Random.secure();
    final bytes = List<int>.generate(16, (_) => random.nextInt(256));
    return base64Url.encode(bytes);
  }

  /// Reads a key, treating an unreachable keychain as "nothing stored".
  ///
  /// Secure storage throws rather than returning null when the platform
  /// keychain is unavailable — on macOS, for instance, when the app is built
  /// without the keychain entitlement. Callers here only ever ask whether a
  /// lock exists, so degrading to "no lock" keeps the app usable instead of
  /// failing to start.
  Future<String?> _readOrNull(String key) async {
    try {
      return await _storage.read(key: key);
    } catch (_) {
      return null;
    }
  }

  Future<bool> isLockEnabled() async {
    return await _readOrNull(_hashKey) != null;
  }

  Future<void> setPin(String pin) async {
    final salt = _newSalt();
    await _storage.write(key: _saltKey, value: salt);
    await _storage.write(key: _hashKey, value: hashPin(pin, salt));
  }

  /// Constant-ish comparison against the stored hash. Returns false when no
  /// PIN is set, so callers can't accidentally unlock an unconfigured app.
  Future<bool> verifyPin(String pin) async {
    final salt = await _readOrNull(_saltKey);
    final hash = await _readOrNull(_hashKey);
    if (salt == null || hash == null) return false;
    return hashPin(pin, salt) == hash;
  }

  Future<void> disableLock() async {
    await _storage.delete(key: _hashKey);
    await _storage.delete(key: _saltKey);
    await _storage.delete(key: _biometricKey);
  }

  Future<bool> isBiometricEnabled() async {
    return await _readOrNull(_biometricKey) == 'true';
  }

  Future<void> setBiometricEnabled(bool enabled) async {
    await _storage.write(key: _biometricKey, value: enabled ? 'true' : 'false');
  }

  /// Whether this device can actually do biometrics right now.
  Future<bool> canUseBiometrics() async {
    try {
      final supported = await _localAuth.isDeviceSupported();
      if (!supported) return false;
      final available = await _localAuth.canCheckBiometrics;
      if (!available) return false;
      final enrolled = await _localAuth.getAvailableBiometrics();
      return enrolled.isNotEmpty;
    } catch (_) {
      // Desktop and unsupported platforms throw rather than returning false.
      return false;
    }
  }

  /// [reason] is shown by the system prompt, so it arrives already
  /// translated from the screen that asked.
  Future<bool> authenticateWithBiometrics({required String reason}) async {
    try {
      return await _localAuth.authenticate(
        localizedReason: reason,
        biometricOnly: true,
        persistAcrossBackgrounding: true,
      );
    } catch (_) {
      return false;
    }
  }
}
