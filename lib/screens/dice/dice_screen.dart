import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/core_providers.dart';
import '../../providers/data_providers.dart';
import '../../services/dice_roller.dart';

class DiceScreen extends ConsumerStatefulWidget {
  const DiceScreen({super.key, required this.projectId});

  final String projectId;

  @override
  ConsumerState<DiceScreen> createState() => _DiceScreenState();
}

class _DiceScreenState extends ConsumerState<DiceScreen> {
  final _controller = TextEditingController(text: 'd20');
  /// 1 = advantage, -1 = disadvantage, 0 = straight roll.
  int _advantage = 0;
  DiceResult? _last;
  String? _error;

  static const _quickRolls = ['d20', 'd12', 'd10', 'd8', 'd6', 'd4', 'd100'];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _roll([String? expression]) async {
    final input = expression ?? _controller.text;
    try {
      final result =
          ref.read(diceRollerProvider).roll(input, advantage: _advantage);
      setState(() {
        _last = result;
        _error = null;
      });
      await ref.read(diceDaoProvider).recordRoll(
            projectId: widget.projectId,
            expression: result.expression,
            total: result.total,
            detail: _advantage == 0
                ? result.detail
                : '${result.detail} (${_advantage > 0 ? L.of(context).diceAdvantageWord : L.of(context).diceDisadvantageWord})',
          );
    } on DiceFormatException catch (e) {
      setState(() {
        _error = _errorText(L.of(context), e);
        _last = null;
      });
    }
  }

  /// Turns a roller error into a sentence in the reader's language.
  String _errorText(L l, DiceFormatException e) {
    switch (e.error) {
      case DiceError.empty:
        return l.diceErrEmpty;
      case DiceError.unparsable:
        return l.diceErrUnparsable(e.text ?? '');
      case DiceError.tooManyDice:
        return l.diceErrTooManyDice(e.limit ?? 0);
      case DiceError.sideRange:
        return l.diceErrSideRange(e.limit ?? 0);
      case DiceError.unknownTerm:
        return l.diceErrUnknownTerm(e.text ?? '');
    }
  }

  @override
  Widget build(BuildContext context) {
    final historyAsync = ref.watch(diceRollsStreamProvider(widget.projectId));
    final theme = Theme.of(context);
    final l = L.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l.diceTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_sweep_outlined),
            tooltip: l.diceClearHistory,
            onPressed: () =>
                ref.read(diceDaoProvider).clearHistory(widget.projectId),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          labelText: l.diceRollLabel,
                          hintText: l.diceRollHint,
                          border: const OutlineInputBorder(),
                        ),
                        onSubmitted: (_) => _roll(),
                      ),
                    ),
                    const SizedBox(width: 8),
                    FilledButton(
                      onPressed: () => _roll(),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Text(l.diceRollButton),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                SegmentedButton<int>(
                  segments: [
                    ButtonSegment(value: -1, label: Text(l.diceDisadvantage)),
                    ButtonSegment(value: 0, label: Text(l.diceNormal)),
                    ButtonSegment(value: 1, label: Text(l.diceAdvantage)),
                  ],
                  selected: {_advantage},
                  onSelectionChanged: (s) => setState(() => _advantage = s.first),
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  children: [
                    for (final quick in _quickRolls)
                      ActionChip(
                        label: Text(quick),
                        onPressed: () {
                          _controller.text = quick;
                          _roll(quick);
                        },
                      ),
                  ],
                ),
              ],
            ),
          ),
          if (_error != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(_error!, style: TextStyle(color: theme.colorScheme.error)),
            ),
          if (_last != null)
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              color: theme.colorScheme.primaryContainer,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text('${_last!.total}',
                        style: theme.textTheme.displayMedium),
                    Text(_last!.detail, style: theme.textTheme.bodyMedium),
                  ],
                ),
              ),
            ),
          const SizedBox(height: 8),
          Expanded(
            child: historyAsync.when(
              data: (rolls) {
                if (rolls.isEmpty) {
                  return Center(child: Text(l.diceNoRolls));
                }
                return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: rolls.length,
                  itemBuilder: (context, index) {
                    final roll = rolls[index];
                    return ListTile(
                      dense: true,
                      leading: CircleAvatar(child: Text('${roll.total}')),
                      title: Text(roll.expression),
                      subtitle: Text(roll.detail),
                    );
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, st) => Center(child: Text('Error: $e')),
            ),
          ),
        ],
      ),
    );
  }
}
