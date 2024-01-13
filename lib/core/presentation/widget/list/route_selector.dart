import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

typedef RoutePathBuilder<T> = String Function(T data);

class RouteSelectorList<T> extends StatelessWidget {
  const RouteSelectorList({
    super.key,
    required this.entries,
    required this.pathBuilder,
    required this.titleBuilder,
    this.iconBuilder,
    this.child,
  });

  final Widget? child;
  final Iterable<T> entries;
  final RoutePathBuilder<T> pathBuilder;
  final ValueWidgetBuilder<T> titleBuilder;
  final ValueWidgetBuilder<T>? iconBuilder;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: entries
          .map((data) => ListTile(
              minLeadingWidth: 56,
              title: titleBuilder(context, data, null),
              contentPadding: const EdgeInsets.all(12.0),
              leading: iconBuilder == null
                  ? null
                  : iconBuilder!(context, data, null),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () => context.go(pathBuilder(data))))
          .toList(),
    );
  }
}
