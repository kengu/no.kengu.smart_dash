import 'package:flutter/material.dart';

class SmartDashToolbar extends StatelessWidget {
  const SmartDashToolbar({
    super.key,
    required this.leading,
    this.title,
    this.actions = const [],
  });

  final String? title;
  final Widget leading;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    var hasTitle = title?.isNotEmpty == true;
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        leading,
        if (hasTitle)
          SizedBox(
            height: 42,
            child: Center(
              child: Text(
                title!,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ),
        Row(
          children: [
            ...actions,
            if (actions.isEmpty) const SizedBox(width: 24),
          ],
        )
      ],
    );
  }
}
