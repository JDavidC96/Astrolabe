import 'package:flutter/material.dart';

/// One selectable row, kept deliberately plain so any entity can be offered
/// through the same picker.
class PickOption {
  const PickOption({required this.id, required this.label, this.sublabel});

  final String id;
  final String label;
  final String? sublabel;

  bool matches(String query) {
    if (query.isEmpty) return true;
    final q = query.toLowerCase();
    return label.toLowerCase().contains(q) ||
        (sublabel?.toLowerCase().contains(q) ?? false);
  }
}

/// Below this many options a search box is more clutter than help.
const _searchThreshold = 8;

/// Multi-select list with a search box that appears only once the list is
/// long enough to need one.
///
/// Filtering is purely visual: hiding a row never changes what is selected,
/// so searching can't quietly drop choices the user already made. The count
/// of hidden selections is shown for the same reason.
class SearchableCheckboxList extends StatefulWidget {
  const SearchableCheckboxList({
    super.key,
    required this.options,
    required this.selected,
    required this.onChanged,
    this.emptyMessage = 'No hay nada que elegir todavía.',
    this.searchHint = 'Buscar...',
  });

  final List<PickOption> options;
  final Set<String> selected;
  final void Function(String id, bool isSelected) onChanged;
  final String emptyMessage;
  final String searchHint;

  @override
  State<SearchableCheckboxList> createState() => _SearchableCheckboxListState();
}

class _SearchableCheckboxListState extends State<SearchableCheckboxList> {
  final _controller = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.options.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Text(widget.emptyMessage),
      );
    }

    final visible =
        widget.options.where((o) => o.matches(_query)).toList(growable: false);
    final hiddenSelected = widget.options
        .where((o) => widget.selected.contains(o.id) && !o.matches(_query))
        .length;
    final showSearch = widget.options.length >= _searchThreshold;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showSearch)
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: widget.searchHint,
                prefixIcon: const Icon(Icons.search),
                isDense: true,
                suffixIcon: _query.isEmpty
                    ? null
                    : IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _controller.clear();
                          setState(() => _query = '');
                        },
                      ),
              ),
              onChanged: (value) => setState(() => _query = value),
            ),
          ),
        if (showSearch)
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Text(
              hiddenSelected == 0
                  ? '${widget.selected.length} seleccionado(s)'
                  : '${widget.selected.length} seleccionado(s) · '
                      '$hiddenSelected fuera del filtro',
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ),
        if (visible.isEmpty)
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Text('Nada coincide con la búsqueda.'),
          )
        else
          for (final option in visible)
            CheckboxListTile(
              dense: true,
              contentPadding: EdgeInsets.zero,
              title: Text(option.label),
              subtitle: option.sublabel == null ? null : Text(option.sublabel!),
              value: widget.selected.contains(option.id),
              onChanged: (checked) =>
                  widget.onChanged(option.id, checked ?? false),
            ),
      ],
    );
  }
}

/// Single-choice dialog with the same search behaviour, for the places that
/// pick one entity and close.
class SearchablePickDialog extends StatefulWidget {
  const SearchablePickDialog({
    super.key,
    required this.title,
    required this.options,
    this.searchHint = 'Buscar...',
  });

  final String title;
  final List<PickOption> options;
  final String searchHint;

  @override
  State<SearchablePickDialog> createState() => _SearchablePickDialogState();
}

class _SearchablePickDialogState extends State<SearchablePickDialog> {
  final _controller = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final visible =
        widget.options.where((o) => o.matches(_query)).toList(growable: false);
    final showSearch = widget.options.length >= _searchThreshold;

    return AlertDialog(
      title: Text(widget.title),
      content: SizedBox(
        width: 420,
        height: 420,
        child: Column(
          children: [
            if (showSearch)
              TextField(
                controller: _controller,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: widget.searchHint,
                  prefixIcon: const Icon(Icons.search),
                  isDense: true,
                ),
                onChanged: (value) => setState(() => _query = value),
              ),
            const SizedBox(height: 8),
            Expanded(
              child: visible.isEmpty
                  ? const Center(child: Text('Nada coincide con la búsqueda.'))
                  : ListView.builder(
                      itemCount: visible.length,
                      itemBuilder: (context, index) {
                        final option = visible[index];
                        return ListTile(
                          dense: true,
                          title: Text(option.label),
                          subtitle: option.sublabel == null
                              ? null
                              : Text(option.sublabel!),
                          onTap: () => Navigator.of(context).pop(option.id),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancelar'),
        ),
      ],
    );
  }
}
