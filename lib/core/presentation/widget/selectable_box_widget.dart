import 'package:flutter/material.dart';

class SelectableBoxWidget extends StatelessWidget {
  const SelectableBoxWidget({
    super.key,
    required this.child,
    required this.index,
    required this.onSelected,
    this.isSelected = false,
  });

  final int index;
  final Widget child;
  final bool isSelected;

  final void Function(int index) onSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onSelected(index);
      },
      child: isSelected
          ? ConstrainedBox(
              constraints: BoxConstraints.tight(
                const Size.square(50),
              ),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.lightGreen,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                child: child,
              ),
            )
          : ConstrainedBox(
              constraints: BoxConstraints.tight(
                const Size.square(50),
              ),
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: child,
              ),
            ),
    );
  }
}
