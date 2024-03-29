import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:optional/optional.dart';
import 'package:smart_dash/core/presentation/widget/smart_dash_screen.dart';
import 'package:smart_dash/feature/account/domain/service_config.dart';
import 'package:smart_dash/feature/camera/presentation/camera_card.dart';

class CameraScreen extends StatelessWidget {
  const CameraScreen({
    super.key,
    required this.location,
    required this.config,
  });

  final String location;

  final Optional<ServiceConfig> config;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SmartDashScreen(
        title: 'Camera',
        onClose: () => context.go(location),
        constraints: constraints,
        child: Padding(
          padding: const EdgeInsets.only(top: 0.0),
          child: LimitedBox(
            maxWidth: constraints.maxWidth,
            maxHeight: constraints.maxWidth / 1.68,
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onDoubleTap: () {
                context.go(location);
              },
              // Prevent doubleTaps to occur in CameraCard
              child: CameraCard(
                config: config,
                withVideoControl: true,
              ),
            ),
          ),
        ),
      );
    });
  }
}
