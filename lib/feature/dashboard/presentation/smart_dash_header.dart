import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:smart_dash/core/presentation/scaffold/fullscreen_state.dart';
import 'package:smart_dash/core/presentation/widget/responsive_widget.dart';
import 'package:smart_dash/feature/system/application/connectivity_service.dart';
import 'package:smart_dash/feature/system/presentation/system_routes.dart';

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
            IconButton(
              icon: _buildHealth(ref),
              onPressed: () {
                context.push(SystemScreens.health);
              },
            ),
          if (ResponsiveWidget.isMobile(context))
            PopupMenuButton<String>(
              onSelected: (value) {
                context.go(value);
              },
              itemBuilder: (context) {
                return [
                  if (withFullscreenAction)
                    PopupMenuItem(
                      child: Row(
                        children: [
                          isFullscreen
                              ? const Icon(Icons.fullscreen_exit)
                              : const Icon(Icons.fullscreen),
                          const SizedBox(width: 16),
                          const Text('Fullscreen'),
                        ],
                      ),
                      onTap: () => FullscreenState.notifier(ref).toggle(),
                    ),
                ];
              },
            )
          else
            IconButton(
              icon: isFullscreen
                  ? const Icon(Icons.fullscreen_exit)
                  : const Icon(Icons.fullscreen),
              onPressed: () => FullscreenState.notifier(ref).toggle(),
            ),
        ],
      ),
    );
  }

  Widget _buildHealth(WidgetRef ref) {
    final connectivity = ref.read(connectivityServiceProvider);
    return StreamBuilder(
        stream: connectivity.events,
        builder: (context, snapshot) {
          return connectivity.isOK
              ? const Tooltip(
                  message: 'System is OK',
                  child: Icon(Icons.info_outline, color: Colors.green),
                )
              : Tooltip(
                  message: '${connectivity.failCount} connections has failed',
                  child: const Icon(Icons.info_outline, color: Colors.red),
                );
        });
  }
}
