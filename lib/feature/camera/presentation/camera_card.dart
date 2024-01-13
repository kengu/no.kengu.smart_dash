import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:optional/optional.dart';
import 'package:smart_dash/feature/camera/application/camera_manager.dart';
import 'package:smart_dash/feature/camera/domain/camera.dart';
import 'package:smart_dash/core/presentation/theme/smart_dash_theme_data.dart';

class CameraCard extends ConsumerStatefulWidget {
  const CameraCard({
    super.key,
    required this.name,
    required this.camera,
  });

  final String name;

  final Optional<Camera> camera;

  @override
  ConsumerState<CameraCard> createState() => _VideoCardState();
}

class _VideoCardState extends ConsumerState<CameraCard> {
  String get cameraName => widget.camera.orElseNull?.name ?? widget.name;

  bool get motionDetectEnabled =>
      widget.camera.orElseNull?.motion?.enabled == true;

  MotionDetectSensitivityLevel get motionDetectSensitivity =>
      widget.camera.orElseNull?.motion?.sensitivity ??
      MotionDetectSensitivityLevel.low;

  Future<Optional<CameraSnapshot>> _fetchSnapshot() async {
    if (widget.camera.isPresent) {
      final snapshot = await ref
          .read(cameraManagerProvider)
          .getSnapshot(widget.camera.value);
      return Optional.ofNullable(snapshot.orElseNull);
    }
    return const Optional.empty();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: 600,
        height: 400,
        child: ClipRRect(
          clipBehavior: Clip.hardEdge,
          borderRadius: BorderRadius.circular(16),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: FutureBuilder<Optional<CameraSnapshot>>(
                    future: _fetchSnapshot(),
                    initialData: _fetchCachedSnapshot(),
                    builder: (context, snapshot) {
                      if (!(snapshot.hasData && snapshot.data!.isPresent)) {
                        return Container(
                          color: Theme.of(context)
                              .navigationRailTheme
                              .backgroundColor!
                              .lighten(0.05),
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                      return Image.memory(
                        snapshot.data!.value.bytes,
                        fit: BoxFit.scaleDown,
                        gaplessPlayback: true,
                      );
                    }),
              ),
              ListTile(
                leading: const Icon(
                  Icons.video_camera_back_outlined,
                ),
                title: Text(cameraName),
                trailing: SizedBox(
                  width: 250,
                  height: 50,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          const Text('Motion Detection'),
                          Transform.scale(
                            scale: 0.75,
                            child: CupertinoSwitch(
                              value: motionDetectEnabled,
                              activeColor: Colors.blueAccent,
                              onChanged: (enabled) {
                                if (widget.camera.isPresent) {
                                  ref
                                      .read(cameraManagerProvider)
                                      .setMotionConfig(
                                        widget.camera.value,
                                        enabled: enabled,
                                      );
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Optional<CameraSnapshot> _fetchCachedSnapshot() {
    if (!widget.camera.isPresent) return const Optional.empty();
    return ref
        .read(cameraManagerProvider)
        .getCachedSnapshot(widget.camera.value);
  }
}
