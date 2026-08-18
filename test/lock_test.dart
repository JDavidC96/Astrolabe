import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:worldbuilder/services/app_lock_service.dart';

/// In-memory stand-in for the platform keystore.
class _FakeSecureStorage implements FlutterSecureStorage {
  final Map<String, String> values = {};

  @override
  Future<String?> read({
    required String key,
    AppleOptions? iOptions,
    AndroidOptions? aOptions,
    LinuxOptions? lOptions,
    WebOptions? webOptions,
    AppleOptions? mOptions,
    WindowsOptions? wOptions,
  }) async =>
      values[key];

  @override
  Future<void> write({
    required String key,
    required String? value,
    AppleOptions? iOptions,
    AndroidOptions? aOptions,
    LinuxOptions? lOptions,
    WebOptions? webOptions,
    AppleOptions? mOptions,
    WindowsOptions? wOptions,
  }) async {
    if (value == null) {
      values.remove(key);
    } else {
      values[key] = value;
    }
  }

  @override
  Future<void> delete({
    required String key,
    AppleOptions? iOptions,
    AndroidOptions? aOptions,
    LinuxOptions? lOptions,
    WebOptions? webOptions,
    AppleOptions? mOptions,
    WindowsOptions? wOptions,
  }) async {
    values.remove(key);
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

void main() {
  late _FakeSecureStorage storage;
  late AppLockService service;

  setUp(() {
    storage = _FakeSecureStorage();
    service = AppLockService(storage: storage);
  });

  test('no lock is configured by default', () async {
    expect(await service.isLockEnabled(), isFalse);
    // With nothing set, verification must fail rather than wave anyone through.
    expect(await service.verifyPin('1234'), isFalse);
  });

  test('a stored PIN verifies and a wrong one does not', () async {
    await service.setPin('1234');
    expect(await service.isLockEnabled(), isTrue);
    expect(await service.verifyPin('1234'), isTrue);
    expect(await service.verifyPin('4321'), isFalse);
    expect(await service.verifyPin(''), isFalse);
  });

  test('the PIN itself is never written to storage', () async {
    await service.setPin('987654');
    expect(
      storage.values.values.any((v) => v.contains('987654')),
      isFalse,
      reason: 'only a salted hash should be persisted',
    );
  });

  test('the same PIN hashes differently for different users', () async {
    await service.setPin('1234');
    final firstHash = storage.values['pin_hash'];

    final otherStorage = _FakeSecureStorage();
    await AppLockService(storage: otherStorage).setPin('1234');

    // A per-install salt means identical PINs don't share a hash.
    expect(firstHash, isNot(otherStorage.values['pin_hash']));
  });

  test('changing the PIN invalidates the old one', () async {
    await service.setPin('1111');
    await service.setPin('2222');
    expect(await service.verifyPin('1111'), isFalse);
    expect(await service.verifyPin('2222'), isTrue);
  });

  test('disabling the lock clears everything', () async {
    await service.setPin('1234');
    await service.setBiometricEnabled(true);
    await service.disableLock();

    expect(await service.isLockEnabled(), isFalse);
    expect(await service.isBiometricEnabled(), isFalse);
    expect(await service.verifyPin('1234'), isFalse);
    expect(storage.values, isEmpty);
  });
}
