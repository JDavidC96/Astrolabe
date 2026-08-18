import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/lock_providers.dart';

class SecuritySettingsScreen extends ConsumerWidget {
  const SecuritySettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lock = ref.watch(lockControllerProvider);
    final controller = ref.read(lockControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('Seguridad')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          SwitchListTile(
            title: const Text('Pedir PIN al abrir'),
            subtitle: Text(
              lock.enabled
                  ? 'La app se bloquea al salir a segundo plano.'
                  : 'Cualquiera que tome el dispositivo puede leer tus universos.',
            ),
            value: lock.enabled,
            onChanged: (enabled) async {
              if (enabled) {
                final pin = await _askForPin(context, title: 'Elige un PIN');
                if (pin != null) await controller.setPin(pin);
              } else {
                // Require the current PIN before turning protection off.
                final pin =
                    await _askForPin(context, title: 'Confirma tu PIN actual');
                if (pin == null) return;
                final ok = await ref
                    .read(appLockServiceProvider)
                    .verifyPin(pin);
                if (!context.mounted) return;
                if (ok) {
                  await controller.disableLock();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('PIN incorrecto.')),
                  );
                }
              }
            },
          ),
          if (lock.enabled) ...[
            ListTile(
              leading: const Icon(Icons.password),
              title: const Text('Cambiar PIN'),
              onTap: () async {
                final current =
                    await _askForPin(context, title: 'PIN actual');
                if (current == null) return;
                final ok =
                    await ref.read(appLockServiceProvider).verifyPin(current);
                if (!context.mounted) return;
                if (!ok) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('PIN incorrecto.')),
                  );
                  return;
                }
                final next = await _askForPin(context, title: 'Nuevo PIN');
                if (next != null) await controller.setPin(next);
              },
            ),
            SwitchListTile(
              secondary: const Icon(Icons.fingerprint),
              title: const Text('Desbloquear con huella o rostro'),
              subtitle: Text(
                lock.biometricAvailable
                    ? 'Atajo al PIN, que sigue funcionando siempre.'
                    : 'Este dispositivo no tiene biometría configurada.',
              ),
              value: lock.biometricEnabled && lock.biometricAvailable,
              onChanged: lock.biometricAvailable
                  ? (value) => controller.setBiometricEnabled(value)
                  : null,
            ),
            ListTile(
              leading: const Icon(Icons.lock_outline),
              title: const Text('Bloquear ahora'),
              onTap: controller.lockNow,
            ),
          ],
          const Divider(height: 32),
          Card(
            color: Theme.of(context).colorScheme.secondaryContainer,
            child: const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'El PIN protege el acceso a la app en este dispositivo. No '
                'cifra el archivo de datos: alguien con acceso al sistema de '
                'archivos del teléfono aún podría leerlo. Si olvidas el PIN '
                'tendrás que reinstalar la app, así que guarda un respaldo.',
              ),
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
      setState(() => _error = 'Usa al menos 4 dígitos.');
      return;
    }
    Navigator.of(context).pop(pin);
  }

  @override
  Widget build(BuildContext context) {
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
          child: const Text('Cancelar'),
        ),
        FilledButton(onPressed: _submit, child: const Text('Aceptar')),
      ],
    );
  }
}
