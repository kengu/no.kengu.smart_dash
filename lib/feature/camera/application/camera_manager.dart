import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash/feature/account/domain/service_config.dart';
import 'package:smart_dash/feature/camera/application/camera_service.dart';
import 'package:smart_dash/feature/camera/domain/camera.dart';
import 'package:smart_dash/integration/data/integration_repository.dart';
import 'package:smart_dash/integration/domain/integration.dart';

part 'camera_manager.g.dart';

class CameraManager {
  CameraManager(this.ref);

  final Ref ref;
  final Map<String, CameraService> _services = {};

  /// Check if [CameraService] for given [ServiceConfig.key] exists
  bool exists(String key) => _services.containsKey(key);

  /// [Camera] should call this to register
  void register(CameraService service) {
    _services[service.key] = service;
    debugPrint('CameraManager: '
        '${service.runtimeType}[key:${service.key}] registered');
  }

  /// Get available device driver definitions
  Future<Map<String, Integration>> getDefinitions() =>
      ref.read(integrationRepositoryProvider.future);

  /// Get [Camera] for given [IntegrationFields.key]
  CameraService getService(String key) {
    assert(
      exists(key),
      'CameraService $key not found. '
      'Have you remembered to register it with the CameraManager?',
    );
    return _services[key]!;
  }
}

@Riverpod(keepAlive: true)
CameraManager cameraManager(CameraManagerRef ref) => CameraManager(ref);
