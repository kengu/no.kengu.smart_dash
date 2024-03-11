import 'package:flutter/material.dart';

class BadgeStreamWidget extends StatelessWidget {
  const BadgeStreamWidget({
    super.key,
    required this.child,
    required this.stream,
    this.initialData,
  });

  final Widget child;
  final int? initialData;
  final Stream<int> stream;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
        stream: stream,
        initialData: initialData,
        builder: (context, snapshot) {
          final value = snapshot.data ?? 0;
          if (value == 0) return child;
          return Badge(
            label: Text(value.toString()),
            child: child,
          );
        });
  }
}
