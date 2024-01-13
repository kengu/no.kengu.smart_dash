import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:optional/optional.dart';
import 'package:smart_dash/feature/camera/domain/camera.dart';
import 'package:smart_dash/integration/foscam/application/foscam_service.dart';
import 'package:smart_dash/scaffold/presentation/app/smart_dash_app_theme_data.dart';

class CameraCard extends ConsumerStatefulWidget {
  const CameraCard({
    super.key,
    required this.camera,
  });

  final Optional<Camera> camera;

  @override
  ConsumerState<CameraCard> createState() => _VideoCardState();
}

class _VideoCardState extends ConsumerState<CameraCard> {
  Optional<Uint8List> _snapshot = const Optional.empty();

  String get cameraName => widget.camera.orElseNull?.name ?? '-';

  bool get motionDetectEnabled =>
      widget.camera.orElseNull?.motion?.enabled == true;

  MotionDetectSensitivityLevel get motionDetectSensitivity =>
      widget.camera.orElseNull?.motion?.sensitivity ??
      MotionDetectSensitivityLevel.low;

  Future<Optional<Uint8List>> _fetchSnapshot() async {
    if (widget.camera.isPresent) {
      final snapshot = await ref
          .read(foscamServiceProvider.notifier)
          .getSnapshot(widget.camera.value);
      _snapshot = Optional.ofNullable(snapshot.orElseNull?.bytes);
    }
    return _snapshot;
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
                child: FutureBuilder<Optional<Uint8List>>(
                    initialData: _snapshot,
                    future: _fetchSnapshot(),
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
                        snapshot.data!.value,
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
                subtitle: Text(
                  'Motion Detection: '
                  '${motionDetectEnabled ? 'yes' : 'no'} | '
                  'Sensitivity: ${motionDetectSensitivity.name}',
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.refresh),
                  onPressed: () => setState(() {}),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
