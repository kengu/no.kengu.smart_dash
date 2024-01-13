import 'dart:async';

import 'package:dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:optional/optional.dart';
import 'package:smart_dash/feature/camera/domain/camera.dart';
import 'package:smart_dash/feature/camera/presentation/camera_card.dart';
import 'package:smart_dash/feature/dashboard/presentation/smart_dash_header.dart';
import 'package:smart_dash/feature/dashboard/presentation/smart_dashboard.dart';
import 'package:smart_dash/integration/foscam/application/foscam_service.dart';
import 'package:smart_dash/core/application/fullscreen_state.dart';

class CamerasPage extends ConsumerStatefulWidget {
  const CamerasPage({super.key});

  @override
  ConsumerState<CamerasPage> createState() => _CameraPageState();
}

class _CameraPageState extends ConsumerState<CamerasPage> {
  final df = DateFormat('dd-MM-yyyy HH:mm');

  Timer? _refresh;

  bool get isFullscreen => FullscreenState.watch(ref);

  @override
  void initState() {
    super.initState();
    _refresh = Timer.periodic(
      const Duration(seconds: 5),
      (timer) => setState(() {}),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _refresh?.cancel();
  }

  final items1 = [
    DashboardItem(
      width: 1,
      height: 1,
      identifier: 'Parkering',
    ),
    DashboardItem(
      width: 1,
      height: 1,
      identifier: 'Inngang',
    ),
    DashboardItem(
      width: 1,
      height: 1,
      identifier: 'Boblebad',
    ),
  ];
  final items2 = [
    DashboardItem(
      width: 1,
      height: 1,
      identifier: 'Parkering',
    ),
    DashboardItem(
      width: 1,
      height: 1,
      identifier: 'Inngang',
    ),
    DashboardItem(
      width: 1,
      height: 1,
      identifier: 'Boblebad',
    ),
  ];
  final items3 = [
    DashboardItem(
      width: 1,
      height: 1,
      identifier: 'Parkering',
    ),
    DashboardItem(
      width: 1,
      height: 1,
      identifier: 'Inngang',
    ),
    DashboardItem(
      width: 1,
      height: 1,
      identifier: 'Boblebad',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Camera>>(
        initialData: ref
            .read(foscamServiceProvider.notifier)
            .getCachedCameras()
            .orElseNull,
        future: ref.read(foscamServiceProvider.notifier).getCameras(),
        builder: (context, snapshot) {
          final cameras = Map.fromEntries(
            (snapshot.hasData ? snapshot.data! : <Camera>[]).map(
              (e) => MapEntry(e.name, e),
            ),
          );
          return Padding(
            padding: !isFullscreen
                ? const EdgeInsets.all(24.0).copyWith(bottom: 0.0)
                : const EdgeInsets.all(16.0),
            child: Stack(
              children: [
                if (!isFullscreen)
                  const SmartDashHeader(
                    title: 'Cameras',
                  ),
                Padding(
                  padding: !isFullscreen
                      ? const EdgeInsets.only(top: 56.0)
                      : const EdgeInsets.only(top: 0.0),
                  child: SmartDashboard(
                    slotHeight: 380,
                    mobile: items1,
                    tablet: items2,
                    desktop: items3,
                    mobileSlotCount: 1,
                    tabletSlotCount: 2,
                    desktopSlotCount: 3,
                    itemBuilder: (item) {
                      return CameraCard(
                        camera: Optional.ofNullable(
                          cameras[item.identifier],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        });
  }
}
