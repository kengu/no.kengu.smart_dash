import 'package:flutter/material.dart';

import 'selectable_box_widget.dart';

class SelectableRowWidget extends StatelessWidget {
  const SelectableRowWidget({
    super.key,
    required this.length,
    required this.builder,
    required this.onSelected,
    this.selected = 0,
  });

  final int length;
  final int selected;
  final IndexedWidgetBuilder builder;

  final void Function(int index) onSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        length,
        (index) => SelectableBoxWidget(
          index: index,
          onSelected: onSelected,
          isSelected: selected == index,
          child: builder(context, index),
        ),
      ),
    );
  }
}
