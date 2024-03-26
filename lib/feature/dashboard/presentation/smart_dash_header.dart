import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_dash/core/presentation/scaffold/fullscreen_state.dart';
import 'package:smart_dash/core/presentation/widget/responsive_widget.dart';

class SmartDashHeader extends ConsumerWidget {
  const SmartDashHeader({
    super.key,
    required this.title,
    this.withFullscreenAction = true,
  });

  final String title;

  final bool withFullscreenAction;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFullscreen = FullscreenState.read(ref);
    return Padding(
      padding: EdgeInsets.only(
        left: ResponsiveWidget.isAnyMobile(context) ? 48.0 : 0.0,
        bottom: 24,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const Spacer(flex: 1),
          if (withFullscreenAction)
            if (ResponsiveWidget.isMobile(context))
              PopupMenuButton<String>(
                onSelected: (value) {
                  context.go(value);
                },
                itemBuilder: (context) {
                  return [
                    if (withFullscreenAction)
                      PopupMenuItem(
                          child: isFullscreen
                              ? const Icon(Icons.fullscreen_exit)
                              : const Icon(Icons.fullscreen),
                          onTap: () => FullscreenState.notifier(ref).toggle())
                  ];
                },
              )
            else
              IconButton(
                icon: isFullscreen
                    ? const Icon(Icons.fullscreen_exit)
                    : const Icon(Icons.fullscreen),
                onPressed: () => FullscreenState.notifier(ref).toggle(),
              )
        ],
      ),
    );
  }
}
