import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_dash/feature/analytics/application/history_manager.dart';
import 'package:smart_dash/feature/camera/application/camera_manager.dart';
import 'package:smart_dash/feature/presence/application/presence_service.dart';
import 'package:smart_dash/feature/system/application/network_info_service.dart';
import 'package:smart_dash/feature/system/application/timing_service.dart';
import 'package:smart_dash/feature/device/application/device_driver_manager.dart';
import 'package:smart_dash/feature/flow/application/flow_manager.dart';
import 'package:smart_dash/integration/foscam/application/foscam_service.dart';
import 'package:smart_dash/integration/sikom/application/sikom_driver.dart';

class AppStateManager {
  AppStateManager(this.container);
  final ProviderContainer container;
  ProviderContainer init() {
    // Bind services with dependencies
    container.read(flowManagerProvider).bind();
    container.read(historyManagerProvider).bind();
    container.read(networkInfoServiceProvider)
      ..init()
      ..bind();
    container.read(presenceServiceProvider).bind();

    // Register services with managers
    container.read(deviceDriverManagerProvider)
      ..register(container.read(sikomDriverProvider))
      ..init()
      ..bind();

    container.read(cameraManagerProvider)
      ..register(container.read(foscamServiceProvider))
      ..init();

    // Start pumping events
    container.read(timingServiceProvider).start();
    container.read(historyManagerProvider).pump();

    debugPrint('AppStateManager: Initialized');
    return container;
  }
}
