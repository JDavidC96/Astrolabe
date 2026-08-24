import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../l10n/app_localizations.dart';

/// Bre-B key ("llave") for receiving transfers from any Colombian bank.
///
/// Shown as copyable text rather than only as a QR: on a phone the reader
/// is already holding the device that would have to scan it, so copying the
/// key and pasting it into their banking app is the path that actually
/// works one-handed.
const breBKey = '@NEQUIJOS6715';
const breBOwner = 'Jose Castro';

/// Optional, never nagged about. Opens a small sheet rather than a browser
/// so nothing leaves the app unless the reader chooses to pay.
Future<void> showSupportSheet(BuildContext context) {
  return showModalBottomSheet<void>(
    context: context,
    showDragHandle: true,
    isScrollControlled: true,
    builder: (context) => const _SupportSheet(),
  );
}

class _SupportSheet extends StatelessWidget {
  const _SupportSheet();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l = L.of(context);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.coffee_outlined),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(l.supportTitle, style: theme.textTheme.titleLarge),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(l.supportBody, style: theme.textTheme.bodyMedium),
            const SizedBox(height: 20),
            Card(
              color: theme.colorScheme.secondaryContainer,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(l.supportKeyLabel, style: theme.textTheme.labelMedium),
                    const SizedBox(height: 4),
                    SelectableText(
                      breBKey,
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(breBOwner, style: theme.textTheme.bodySmall),
                    const SizedBox(height: 12),
                    FilledButton.icon(
                      onPressed: () async {
                        await Clipboard.setData(
                          const ClipboardData(text: breBKey),
                        );
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(l.supportCopied)),
                          );
                        }
                      },
                      icon: const Icon(Icons.copy),
                      label: Text(l.supportCopyKey),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(l.supportHow, style: theme.textTheme.bodySmall),
            const SizedBox(height: 16),
            Center(
              child: TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text(l.commonClose),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
