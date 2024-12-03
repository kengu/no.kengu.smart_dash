import 'package:logging/logging.dart';
import 'package:nanoid/nanoid.dart';
import 'package:path/path.dart' as path;
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash_analytics/smart_dash_analytics.dart';
import 'package:smart_dash_camera/smart_dash_camera.dart';
import 'package:smart_dash_common/smart_dash_common_linux.dart';
import 'package:smart_dash_common/smart_dash_common_native.dart';
import 'package:smart_dash_device/smart_dash_device.dart';
import 'package:smart_dash_flow/smart_dash_flow.dart';
import 'package:smart_dash_integration/smart_dash_integration.dart';
import 'package:smart_dash_mqtt/smart_dash_mqtt.dart';
import 'package:smart_dash_snow/smart_dash_snow.dart';
import 'package:smart_dash_weather/smart_dash_weather.dart';
import 'package:universal_io/io.dart';

part 'bootstrap.g.dart';

typedef Installer = IntegrationType Function(Ref ref);

@Riverpod(keepAlive: true)
class Bootstrap extends _$Bootstrap {
  final _log = Logger('$Bootstrap');

  bool _init = true;

  @override
  Future<Bootstrap> build() async {
    assert(_init, '$Bootstrap should only build once!');

    _log.info('Initializing...');
    _init = false;

    // Initialize system dirs provider for Flutter
    final dirs = await _initSystemDirs();
    _log.info(
      'Working directory is ${dirs.documentsDir.absolute.path}',
    );

    // Build integrations
    /*final services =*/ await _build([
      Snow.install,
      Mqtt.install,
      Cameras.install,
      Weather.install,
      Devices.install,
    ]);

    // TODO Monitor integration health
    /*
    final monitor = ref.read(systemHealthServiceProvider);
    for (final service in services) {
      monitor.onDriverEvents(service.events);
    }
    */

    // Bind with dependencies
    // TODO: Move into Devices.install
    await ref.read(historyManagerProvider).bind(
          ref.read(flowManagerProvider).events.map((e) => e.tags),
          ref.read(deviceServiceProvider).getTokens,
        );

    /*
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
     */

    // Start other services
    final mqtt = ref.read(mqttServiceProvider);
    await mqtt.connect(nanoid());

    // TODO: Refactor into flowService
    ref.read(blockManagerProvider).start();

    // Start pumping events
    ref.read(timingServiceProvider).start();

    // Force first pump of events
    ref.read(historyManagerProvider).pump();

    _log.info('Completed');

    return this;
  }

  Future<List<DriverService>> _build(List<Installer> list) async {
    final repo = ref.read(serviceConfigRepositoryProvider);

    final configs = await repo.getAll();

    for (final install in list) {
      install(ref);
    }

    // Build all integrations
    final manager = ref.read(integrationManagerProvider);
    final services = await manager.build(
      (String key) => configs.where(
        (e) {
          return e.key == key;
        },
      ),
    );

    return services;
  }

  // TODO: Move to utils for backends
  Future<SystemDirs> _initSystemDirs() async {
    late SystemDirs dirs;

    // Register system paths
    if (Platform.isLinux) {
      _log.info(
        'Platform is Linux: Initializing SystemDirs provider for Linux',
      );
      dirs = await LinuxDirs.init(ref);
    } else {
      _log.info(
        'Platform is not Linux: Initializing SystemDirs provider native to daemon',
      );
      final root = Directory.current.absolute.path;

      // TODO: Add system paths to command arguments
      dirs = NativeDirs(
        cacheDir: Directory(path.join(root, '.cache')),
        supportDir: Directory(path.join(root, '.support')),
        downloadsDir: Directory(path.join(root, '.download')),
        documentsDir: Directory(path.join(root, '.documents')),
        tempDir: Directory(Directory.systemTemp.absolute.path),
      )..createSync();

      // Only use native
      systemDirsBuilder(() => dirs);
    }

    Hive.init(dirs.documentsDir.path);

    return dirs;
  }
}
