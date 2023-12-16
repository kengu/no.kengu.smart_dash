import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_dash/feature/analytics/application/history_manager.dart';
import 'package:smart_dash/feature/analytics/application/timing_service.dart';
import 'package:smart_dash/feature/device/application/device_driver_manager.dart';
import 'package:smart_dash/feature/flow/application/flow_manager.dart';
import 'package:smart_dash/feature/sikom/application/sikom_driver.dart';

class AppStateManager {
  AppStateManager(this.container);
  final ProviderContainer container;
  ProviderContainer init() {
    // Bind managers to global event pump
    container.read(flowManagerProvider).bind();
    container.read(historyManagerProvider).bind();
    container.read(deviceDriverManagerProvider)
      ..register(container.read(sikomDriverProvider))
      ..init()
      ..bind();

    // Pumping timing events
    container.read(timingServiceProvider).start();

    debugPrint('AppStateManager: Initialized');
    return container;
  }
}
