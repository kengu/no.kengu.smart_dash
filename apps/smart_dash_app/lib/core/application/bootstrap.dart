import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:media_kit/media_kit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash_account/smart_dash_account_app.dart';
import 'package:smart_dash_analytics/smart_dash_analytics.dart';
import 'package:smart_dash_app/feature/setting/application/setting_service.dart';
import 'package:smart_dash_app/feature/setting/domain/setting.dart';
import 'package:smart_dash_app/feature/system/application/system_health_service.dart';
import 'package:smart_dash_camera/smart_dash_camera.dart';
import 'package:smart_dash_common/smart_dash_common_flutter.dart';
import 'package:smart_dash_device/smart_dash_device.dart';
import 'package:smart_dash_flow/smart_dash_flow.dart';
import 'package:smart_dash_mqtt/smart_dash_mqtt.dart';
import 'package:smart_dash_notification/smart_dash_notification.dart';
import 'package:smart_dash_presence/smart_dash_presence.dart';
import 'package:smart_dash_snow/smart_dash_snow.dart';
import 'package:smart_dash_weather/smart_dash_weather.dart';

part 'bootstrap.g.dart';

typedef Installer = IntegrationType Function(Ref ref);
typedef DriverServiceBuilder = DriverService Function();

@Riverpod(keepAlive: true)
class Bootstrap extends _$Bootstrap {
  final _log = Logger('$Bootstrap');

  bool _init = true;

  @override
  Future<Bootstrap> build() async {
    assert(_init, '$Bootstrap should only build once!');

    _log.info('Initializing...');
    _init = false;

    MediaKit.ensureInitialized();

    // Initialize system dirs provider for Flutter
    final dirs = await FlutterDirs.init(ref);
    _log.info('Working directory is ${dirs.documentsDir.absolute.path}');

    final user = ref.read(userRepositoryProvider).currentUser;
    final home = await ref.read(accountServiceProvider).getCurrentHome();
    assert(home.isPresent, 'TODO: Handle no home better!');

    // Build integrations
    final services = await _build(home.value, [
      Snow.install,
      Mqtt.install,
      Cameras.install,
      Weather.install,
      Geocoder.install,
      Devices.install,
    ]);

    // Monitor integration health
    final monitor = ref.read(systemHealthServiceProvider);
    for (final service in services) {
      monitor.onDriverEvents(service.events);
    }

    // Bind with dependencies
    // TODO: Move into Devices.install
    final flows = ref.read(flowManagerProvider);
    await ref.read(historyManagerProvider).bind(
          flows.events.map((e) => e.tags),
          ref.read(deviceServiceProvider).getTokens,
        );

    // Handle for notification events
    flows.events.listen(
      (event) {
        if (event is BlockEvent) {
          switch (event.runtimeType) {
            case const (BlockNotificationEvent):
              final notification = event as BlockNotificationEvent;
              ref.read(notificationServiceProvider).show(
                    title: notification.label,
                    body: notification.description,
                  );
              break;
          }
        }
      },
      onError: (error, stackTrace) {
        _log.severe(error, stackTrace);
      },
      cancelOnError: false,
    );

    // Load settings
    final settings = ref.read(settingServiceProvider);
    await settings.load();

    // Start presence discovery
    // TODO: Move to smart_dash_presence?
    final network = ref.read(networkInfoServiceProvider);
    await network.start();
    await ref.read(presenceServiceProvider).start();
    final enabled = settings.getOrDefault(SettingType.enablePresence, false);
    if (enabled) {
      network.enable(true);
    }

    settings.onChange<bool>(
      SettingType.enablePresence,
      network.enable,
    );

    // Start other services
    final mqtt = ref.read(mqttServiceProvider);

    // We do not wait for connections to complete
    unawaited(mqtt.connect(user.userId));

    // TODO: Refactor into flowService
    ref.read(blockManagerProvider).start();

    // Start pumping events
    ref.read(timingServiceProvider).start();

    // Force first pump of events
    ref.read(historyManagerProvider).pump();

    _log.info('Completed');

    return this;
  }

  Future<List<DriverService>> _build(Home home, List<Installer> list) async {
    for (final install in list) {
      install(ref);
    }

    // Build all integrations
    final manager = ref.read(integrationManagerProvider);
    final services = await manager.build(home.serviceWhere);

    return services;
  }
}
