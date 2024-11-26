import 'package:logging/logging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash_account/smart_dash_account_app.dart';
import 'package:smart_dash_analytics/smart_dash_analytics.dart';
import 'package:smart_dash_app/feature/presence/application/presence_service.dart';
import 'package:smart_dash_app/feature/system/application/network_info_service.dart';
import 'package:smart_dash_app/feature/system/application/system_health_service.dart';
import 'package:smart_dash_camera/smart_dash_camera.dart';
import 'package:smart_dash_common/smart_dash_common_flutter.dart';
import 'package:smart_dash_device/smart_dash_device.dart';
import 'package:smart_dash_flow/smart_dash_flow.dart';
import 'package:smart_dash_mqtt/smart_dash_mqtt.dart';
import 'package:smart_dash_snow/smart_dash_snow.dart';
import 'package:smart_dash_weather/smart_dash_weather.dart';

part 'bootstrap.g.dart';

typedef DriverServiceBuilder = Future<DriverService> Function();

@Riverpod(keepAlive: true)
class Bootstrap extends _$Bootstrap {
  final _log = Logger('$Bootstrap');

  bool _init = true;

  @override
  Future<Bootstrap> build() async {
    assert(_init, '$Bootstrap should only build once!');

    _log.info('Bootstrap: Initializing...');
    _init = false;

    // Initialize root providers
    final dirs = await ref.read(flutterDirsProvider.future);
    _log.info('Working directory is ${dirs.documentsDir}');

    final user = ref.read(userRepositoryProvider).currentUser;
    final home = await ref.read(accountServiceProvider).getCurrentHome();
    assert(home.isPresent, 'TODO: Handle no home better!');

    // Eager service initializations
    await _build([
      () => ref.read(mqttServiceProvider.future),
      () => ref.read(deviceServiceProvider.future),
      () => ref.read(cameraServiceProvider.future),
      () => ref.read(snowServiceProvider.future),
      () => ref.read(weatherServiceProvider.future),
      () async => ref.read(geocoderServiceProvider),
    ]);

    // Bind with dependencies
    // TODO: Refactor into integration
    ref.read(historyManagerProvider).bind(
          ref.read(flowManagerProvider).events.map((e) => e.tags),
          ref.read(deviceServiceProvider).requireValue.getTokens,
        );

    // TODO: Refactor into smart_dash_system feature
    ref.read(networkInfoServiceProvider).bind();
    ref.read(presenceServiceProvider).bind();

    // Start services
    final mqtt = await ref.read(mqttServiceProvider.future);
    await mqtt.connect(user.userId);

    // TODO: Refactor into flowService
    ref.read(blockManagerProvider).start();

    // Start pumping events
    ref.read(timingServiceProvider).start();
    ref.read(historyManagerProvider).pump();

    _log.info('Bootstrap: Completed');

    return this;
  }

  Future<void> _build(Iterable<DriverServiceBuilder> builders) async {
    final monitor = ref.read(systemHealthServiceProvider);
    for (final builder in builders) {
      final service = await builder();
      monitor.onDriverEvents(service.events);
    }
  }
}
