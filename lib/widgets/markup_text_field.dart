import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../l10n/app_localizations.dart';
import '../services/styled_text.dart';
import 'styled_text_controller.dart';

/// A long-text field with bold and italic buttons that behave the way they
/// do in a word processor: turn one on and what you type comes out styled,
/// or select words and press to style those. No markers ever show.
///
/// Ctrl/Cmd+B and Ctrl/Cmd+I do the same, and on a phone the two styles also
/// join the system's own selection menu, which would otherwise cover the
/// buttons.
class MarkupTextField extends StatelessWidget {
  const MarkupTextField({
    super.key,
    required this.controller,
    required this.label,
    this.maxLines = 10,
    this.minLines = 3,
  });

  final StyledTextController controller;
  final String label;
  final int maxLines;
  final int minLines;

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);

    return ListenableBuilder(
      listenable: controller,
      builder: (context, _) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StyleButtons(controller: controller),
          CallbackShortcuts(
            bindings: styleShortcuts(controller),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                labelText: label,
                border: const OutlineInputBorder(),
              ),
              minLines: minLines,
              maxLines: maxLines,
              contextMenuBuilder: (context, editableState) =>
                  styleSelectionMenu(controller, editableState, l),
            ),
          ),
        ],
      ),
    );
  }
}

/// Five buttons have to fit a phone-width dialog, so they sit tighter than
/// the Material default.
final _compact = IconButton.styleFrom(
  visualDensity: VisualDensity.compact,
  padding: const EdgeInsets.all(6),
  minimumSize: const Size(36, 36),
  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
);

/// The formatting buttons on their own, for editors that already have a
/// toolbar of their own to sit in.
class StyleButtons extends StatelessWidget {
  const StyleButtons({super.key, required this.controller});

  final StyledTextController controller;

  @override
  Widget build(BuildContext context) {
    final l = L.of(context);

    return ListenableBuilder(
      listenable: controller,
      builder: (context, _) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _button(Icons.format_bold, l.markupBold, styleBold),
          _button(Icons.format_italic, l.markupItalic, styleItalic),
          _button(Icons.title, l.editorSubheading, styleHeading),
          _button(Icons.format_quote, l.markupQuote, styleQuote),
          // Not a style to switch on but a mark to drop in, so it stands
          // apart from the others.
          ExcludeFocus(
            child: IconButton(
              icon: const Icon(Icons.horizontal_rule),
              tooltip: l.editorSceneBreak,
              style: _compact,
              onPressed: controller.insertSceneBreak,
            ),
          ),
        ],
      ),
    );
  }

  Widget _button(IconData icon, String tooltip, int bit) {
    // Taking focus would drop the selection the button is meant to act on.
    return ExcludeFocus(
      child: IconButton(
        icon: Icon(icon),
        tooltip: tooltip,
        style: _compact,
        isSelected: controller.isOn(bit),
        onPressed: () => controller.toggle(bit),
      ),
    );
  }
}

Map<ShortcutActivator, VoidCallback> styleShortcuts(
  StyledTextController controller,
) {
  return {
    const SingleActivator(LogicalKeyboardKey.keyB, control: true): () =>
        controller.toggle(styleBold),
    const SingleActivator(LogicalKeyboardKey.keyB, meta: true): () =>
        controller.toggle(styleBold),
    const SingleActivator(LogicalKeyboardKey.keyI, control: true): () =>
        controller.toggle(styleItalic),
    const SingleActivator(LogicalKeyboardKey.keyI, meta: true): () =>
        controller.toggle(styleItalic),
  };
}

/// The platform's selection menu with the two styles added in front of Cut,
/// Copy and Paste.
Widget styleSelectionMenu(
  StyledTextController controller,
  EditableTextState editableState,
  L l,
) {
  void run(int bit) {
    editableState.hideToolbar();
    controller.toggle(bit);
  }

  return AdaptiveTextSelectionToolbar.buttonItems(
    anchors: editableState.contextMenuAnchors,
    buttonItems: [
      ContextMenuButtonItem(label: l.markupBold, onPressed: () => run(styleBold)),
      ContextMenuButtonItem(
        label: l.markupItalic,
        onPressed: () => run(styleItalic),
      ),
      ...editableState.contextMenuButtonItems,
    ],
  );
}
