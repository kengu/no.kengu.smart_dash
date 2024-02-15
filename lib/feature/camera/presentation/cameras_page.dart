import 'dart:async';

import 'package:dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:optional/optional.dart';
import 'package:smart_dash/core/presentation/screens.dart';
import 'package:smart_dash/feature/account/domain/service_config.dart';
import 'package:smart_dash/feature/camera/application/camera_manager.dart';
import 'package:smart_dash/feature/camera/domain/camera.dart';
import 'package:smart_dash/feature/camera/presentation/camera_card.dart';
import 'package:smart_dash/feature/camera/presentation/camera_group_controls.dart';
import 'package:smart_dash/feature/dashboard/presentation/smart_dash_header.dart';
import 'package:smart_dash/feature/dashboard/presentation/smart_dashboard.dart';
import 'package:smart_dash/core/application/fullscreen_state.dart';

class CamerasPage extends ConsumerStatefulWidget {
  const CamerasPage({super.key});

  @override
  ConsumerState<CamerasPage> createState() => _CameraPageState();
}

class _CameraPageState extends ConsumerState<CamerasPage> {
  final df = DateFormat('dd-MM-yyyy HH:mm');

  int _refreshRate = 5;

  Optional<bool> _motionDetectEnabled = const Optional.empty();

  bool get isFullscreen => FullscreenState.watch(ref);

  @override
  void initState() {
    unawaited(_checkCameras());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ServiceConfig>>(
        future: ref.read(cameraManagerProvider).getConfigs(),
        initialData:
            ref.read(cameraManagerProvider).getCachedConfigs().orElseNull,
        builder: (context, configs) {
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
                    storage: SmartDashboardItemStorage(
                      mobile: _items(configs),
                      tablet: _items(configs),
                      desktop: _items(configs),
                      mobileSlotCount: 1,
                      tabletSlotCount: 2,
                      desktopSlotCount: 3,
                    ),
                    itemBuilder: (type, slotsCount, item) {
                      switch (item.identifier) {
                        case 'group':
                          return CameraGroupControls(
                            refreshRate: _refreshRate,
                            motionDetectEnabled: _motionDetectEnabled,
                            onChangedMotionDetect: _setMotionConfigs,
                            onChangedRefreshRate: (int value) {
                              setState(() {
                                _refreshRate = value;
                              });
                            },
                          );
                        default:
                          final config = _toConfig(
                            Optional.ofNullable(configs.data),
                            item,
                          );
                          return CameraCard(
                            period: Duration(seconds: _refreshRate),
                            cachedWidth: 600,
                            fit: BoxFit.fitWidth,
                            config: config,
                            onDoubleTap: () {
                              context.go(Screens.camera, extra: config);
                            },
                          );
                      }
                    },
                  ),
                ),
              ],
            ),
          );
        });
  }

  List<DashboardItem> _items(
    AsyncSnapshot<List<ServiceConfig>> configs,
  ) {
    return [
      ...configs.data!.map(
        (e) => DashboardItem(
          width: 1,
          height: 1,
          identifier: e.device!,
        ),
      ),
      DashboardItem(width: 1, height: 1, identifier: 'group'),
    ];
  }

  Optional<ServiceConfig> _toConfig(
      Optional<List<ServiceConfig>> configs, DashboardItem item) {
    return configs.isPresent
        ? configs.value.where((e) => e.device == item.identifier).firstOptional
        : const Optional.empty();
  }

  Future<void> _checkCameras() async {
    final configs =
        await ref.read(cameraManagerProvider).getConfigs(ttl: const Duration());
    final cameras = await Future.wait(
      configs.map((e) => ref
          .read(cameraManagerProvider)
          .getCamera(e, ttl: Duration(seconds: _refreshRate))),
    );
    if (mounted) {
      setState(() {
        _motionDetectEnabled = Optional.of(
          cameras
              .where((e) => e.isPresent)
              .any((e) => e.value.motion?.enabled == true),
        );
      });
    }
  }

  Future<Optional<bool>> _setMotionConfigs(bool enabled) async {
    final motions = <Optional<MotionDetectConfig>>[];
    final cameras = await ref
        .read(cameraManagerProvider)
        .getCameras(ttl: Duration(seconds: _refreshRate));
    for (final camera in cameras) {
      motions.add(await ref
          .read(cameraManagerProvider)
          .setMotionConfig(camera, enabled: enabled));
      setState(() {});
    }
    _motionDetectEnabled = Optional.of(
      motions.where((e) => e.isPresent).any((e) => e.value.enabled),
    );
    return _motionDetectEnabled;
  }
}
