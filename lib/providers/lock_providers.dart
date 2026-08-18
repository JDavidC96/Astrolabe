import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/app_lock_service.dart';

final appLockServiceProvider = Provider<AppLockService>((ref) {
  return AppLockService();
});

class LockState {
  const LockState({
    required this.checked,
    required this.enabled,
    required this.unlocked,
    required this.biometricEnabled,
    required this.biometricAvailable,
  });

  /// False until the stored settings have been read once, so the UI can
  /// avoid flashing the app before the lock screen appears.
  final bool checked;
  final bool enabled;
  final bool unlocked;
  final bool biometricEnabled;
  final bool biometricAvailable;

  bool get shouldShowLock => checked && enabled && !unlocked;

  LockState copyWith({
    bool? checked,
    bool? enabled,
    bool? unlocked,
    bool? biometricEnabled,
    bool? biometricAvailable,
  }) {
    return LockState(
      checked: checked ?? this.checked,
      enabled: enabled ?? this.enabled,
      unlocked: unlocked ?? this.unlocked,
      biometricEnabled: biometricEnabled ?? this.biometricEnabled,
      biometricAvailable: biometricAvailable ?? this.biometricAvailable,
    );
  }

  static const initial = LockState(
    checked: false,
    enabled: false,
    unlocked: false,
    biometricEnabled: false,
    biometricAvailable: false,
  );
}

class LockController extends StateNotifier<LockState> with WidgetsBindingObserver {
  LockController(this._service) : super(LockState.initial) {
    WidgetsBinding.instance.addObserver(this);
    refresh();
  }

  final AppLockService _service;

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // Re-lock when the app leaves the foreground, so an unlocked session
    // doesn't survive being backgrounded. `this.state` is the lock state;
    // the parameter shadows it with the lifecycle value.
    if (state == AppLifecycleState.paused && this.state.enabled) {
      this.state = this.state.copyWith(unlocked: false);
    }
  }

  Future<void> refresh() async {
    final enabled = await _service.isLockEnabled();
    final biometricEnabled = await _service.isBiometricEnabled();
    final biometricAvailable = await _service.canUseBiometrics();
    state = LockState(
      checked: true,
      enabled: enabled,
      // With no PIN configured there is nothing to unlock.
      unlocked: !enabled,
      biometricEnabled: biometricEnabled,
      biometricAvailable: biometricAvailable,
    );
  }

  Future<bool> unlockWithPin(String pin) async {
    final ok = await _service.verifyPin(pin);
    if (ok) state = state.copyWith(unlocked: true);
    return ok;
  }

  Future<bool> unlockWithBiometrics() async {
    final ok = await _service.authenticateWithBiometrics();
    if (ok) state = state.copyWith(unlocked: true);
    return ok;
  }

  Future<void> setPin(String pin) async {
    await _service.setPin(pin);
    state = state.copyWith(enabled: true, unlocked: true);
  }

  Future<void> disableLock() async {
    await _service.disableLock();
    state = state.copyWith(
      enabled: false,
      unlocked: true,
      biometricEnabled: false,
    );
  }

  Future<void> setBiometricEnabled(bool enabled) async {
    await _service.setBiometricEnabled(enabled);
    state = state.copyWith(biometricEnabled: enabled);
  }

  void lockNow() {
    if (state.enabled) state = state.copyWith(unlocked: false);
  }
}

final lockControllerProvider =
    StateNotifierProvider<LockController, LockState>((ref) {
  return LockController(ref.watch(appLockServiceProvider));
});
