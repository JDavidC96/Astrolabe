import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../l10n/app_localizations.dart';
import '../../providers/lock_providers.dart';

class SecuritySettingsScreen extends ConsumerWidget {
  const SecuritySettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = L.of(context);
    final lock = ref.watch(lockControllerProvider);
    final controller = ref.read(lockControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: Text(l.securityTitle)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          SwitchListTile(
            title: Text(l.lockAskOnOpen),
            subtitle: Text(
              lock.enabled ? l.lockBackgroundNote : l.lockUnprotected,
            ),
            value: lock.enabled,
            onChanged: (enabled) async {
              if (enabled) {
                final pin = await _askForPin(context, title: l.lockChoosePin);
                if (pin != null) await controller.setPin(pin);
              } else {
                // Require the current PIN before turning protection off.
                final pin =
                    await _askForPin(context, title: l.lockConfirmCurrent);
                if (pin == null) return;
                final ok = await ref
                    .read(appLockServiceProvider)
                    .verifyPin(pin);
                if (!context.mounted) return;
                if (ok) {
                  await controller.disableLock();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(l.lockWrongPin)),
                  );
                }
              }
            },
          ),
          if (lock.enabled) ...[
            ListTile(
              leading: const Icon(Icons.password),
              title: Text(l.lockChangePin),
              onTap: () async {
                final current =
                    await _askForPin(context, title: l.lockCurrentPin);
                if (current == null) return;
                final ok =
                    await ref.read(appLockServiceProvider).verifyPin(current);
                if (!context.mounted) return;
                if (!ok) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(l.lockWrongPin)),
                  );
                  return;
                }
                final next = await _askForPin(context, title: l.lockNewPin);
                if (next != null) await controller.setPin(next);
              },
            ),
            SwitchListTile(
              secondary: const Icon(Icons.fingerprint),
              title: Text(l.lockUnlockBiometric),
              subtitle: Text(
                lock.biometricAvailable
                    ? l.lockBiometricsNote
                    : l.lockNoBiometrics,
              ),
              value: lock.biometricEnabled && lock.biometricAvailable,
              onChanged: lock.biometricAvailable
                  ? (value) => controller.setBiometricEnabled(value)
                  : null,
            ),
            ListTile(
              leading: const Icon(Icons.lock_outline),
              title: Text(l.lockNow),
              onTap: controller.lockNow,
            ),
          ],
          const Divider(height: 32),
          Card(
            color: Theme.of(context).colorScheme.secondaryContainer,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(l.lockExplainer),
            ),
          ),
        ],
      ),
    );
  }

  /// Asks for a PIN twice when setting a new one, once when confirming.
  Future<String?> _askForPin(BuildContext context, {required String title}) {
    return showDialog<String>(
      context: context,
      builder: (context) => _PinDialog(title: title),
    );
  }
}

class _PinDialog extends StatefulWidget {
  const _PinDialog({required this.title});

  final String title;

  @override
  State<_PinDialog> createState() => _PinDialogState();
}

class _PinDialogState extends State<_PinDialog> {
  final _controller = TextEditingController();
  String? _error;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submit() {
    final pin = _controller.text.trim();
    if (pin.length < 4) {
      setState(() => _error = L.of(context).lockMinDigits);
      return;
    }
    Navigator.of(context).pop(pin);
  }

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);

    return AlertDialog(
      title: Text(widget.title),
      content: TextField(
        controller: _controller,
        autofocus: true,
        obscureText: true,
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        decoration: InputDecoration(labelText: 'PIN', errorText: _error),
        onSubmitted: (_) => _submit(),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(l.commonCancel),
        ),
        FilledButton(onPressed: _submit, child: Text(l.lockOk)),
      ],
    );
  }
}
