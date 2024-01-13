import 'package:flutter/material.dart';

typedef IndexedValueChanged<T> = void Function(int index, bool value);

class MultiSelectorList<T> extends StatelessWidget {
  const MultiSelectorList({
    super.key,
    required this.entries,
    required this.selected,
    required this.onChanged,
    required this.titleBuilder,
    this.child,
  });

  final Widget? child;
  final List<T> entries;
  final List<bool> selected;
  final ValueWidgetBuilder<T> titleBuilder;
  final IndexedValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: entries
          .map(
            (data) => CheckboxListTile(
              onChanged: (value) => onChanged(
                entries.indexOf(data),
                value!,
              ),
              value: selected.isEmpty ? false : selected[entries.indexOf(data)],
              title: titleBuilder(context, data, child),
              contentPadding: const EdgeInsets.all(12.0),
            ),
          )
          .toList(),
    );
  }
}
