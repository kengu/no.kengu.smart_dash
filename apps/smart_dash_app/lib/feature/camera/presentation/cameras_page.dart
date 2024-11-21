import 'dart:async';

import 'package:dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:optional/optional.dart';
import 'package:smart_dash_account/smart_dash_account.dart';
import 'package:smart_dash_app/core/presentation/scaffold/fullscreen_state.dart';
import 'package:smart_dash_app/core/presentation/screens.dart';
import 'package:smart_dash_app/feature/camera/presentation/camera_card.dart';
import 'package:smart_dash_app/feature/camera/presentation/camera_group_controls.dart';
import 'package:smart_dash_app/feature/dashboard/presentation/smart_dash_header.dart';
import 'package:smart_dash_app/feature/dashboard/presentation/smart_dashboard.dart';
import 'package:smart_dash_camera/smart_dash_camera.dart';

class CamerasPage extends ConsumerStatefulWidget {
  const CamerasPage({super.key});

  @override
  ConsumerState<CamerasPage> createState() => _CameraPageState();
}

class _CameraPageState extends ConsumerState<CamerasPage> {
  final df = DateFormat('dd-MM-yyyy HH:mm');

  int _refreshRate = 5;

  bool _isUpdating = false;

  Optional<bool> _motionDetectEnabled = const Optional.empty();

  bool get isFullscreen => FullscreenState.watch(ref);

  @override
  void initState() {
    unawaited(_checkCameras());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final service = ref.read(cameraServiceProvider).requireValue;
    final configs = service.configs;
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
              slotHeight: (slotCount) => 380,
              storage: SmartDashboardItemStorage(
                cacheItems: true,
                mobileSlotCount: 1,
                tabletSlotCount: 2,
                desktopSlotCount: 3,
                mobile: _items(configs),
                tablet: _items(configs),
                desktop: _items(configs),
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
                      Optional.ofNullable(configs),
                      item,
                    );
                    return CameraCard(
                      config: config,
                      cachedWidth: 600,
                      fit: BoxFit.fitWidth,
                      isUpdating: _isUpdating,
                      period: Duration(seconds: _refreshRate),
                      onDoubleTap: () {
                        context.push(Screens.camera, extra: config);
                      },
                    );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  List<DashboardItem> _items(
    List<ServiceConfig> configs,
  ) {
    return [
      ...configs.map(
        (e) => DashboardItem(
          width: 1,
          height: 1,
          identifier: e.id!,
        ),
      ),
      DashboardItem(width: 1, height: 1, identifier: 'group'),
    ];
  }

  Optional<ServiceConfig> _toConfig(
      Optional<List<ServiceConfig>> configs, DashboardItem item) {
    return configs.isPresent
        ? configs.value.where((e) => e.id == item.identifier).firstOptional
        : const Optional.empty();
  }

  Future<void> _checkCameras() async {
    final service = ref.read(cameraServiceProvider).requireValue;
    final configs = service.configs;
    final cameras = await Future.wait(
      configs.map((e) => service.getCamera(e,
          ttl: Duration(
            seconds: _refreshRate,
          ))),
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
    _isUpdating = true;
    final motions = <Optional<MotionDetectConfig>>[];
    final service = ref.read(cameraServiceProvider).requireValue;
    final cameras = await service.getCameras(
        ttl: Duration(
      seconds: _refreshRate,
    ));
    for (final camera in cameras) {
      motions.add(await service.setMotionConfig(
        camera,
        enabled: enabled,
      ));
      setState(() {});
    }
    _isUpdating = false;
    _motionDetectEnabled = Optional.of(
      motions.where((e) => e.isPresent).any((e) => e.value.enabled),
    );
    return _motionDetectEnabled;
  }
}
