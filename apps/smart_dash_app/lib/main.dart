import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:logging/logging.dart';
import 'package:media_kit/media_kit.dart';
import 'package:network_tools/network_tools.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_dash_app/core/presentation/smart_dash_app.dart';
import 'package:smart_dash_app/feature/device/application/device_service.dart';
import 'package:smart_dash_app/feature/presence/application/presence_service.dart';
import 'package:smart_dash_app/feature/system/application/network_info_service.dart';
import 'package:smart_dash_app/feature/system/application/timing_service.dart';
import 'package:smart_dash_app/integration/application/integration_manager.dart';
import 'package:smart_dash_app/integration/mqtt/application/mqtt_service.dart';
import 'package:smart_dash_app/util/platform.dart';
import 'package:smart_dash_analytics/smart_dash_analytics.dart';
import 'package:smart_dash_common/smart_dash_common_flutter.dart';
import 'package:smart_dash_flow/smart_dash_flow.dart';
import 'package:smart_dash_notification/smart_dash_notification.dart';
import 'package:stack_trace/stack_trace.dart' as stack_trace;
import 'package:universal_io/io.dart' as io;
import 'package:window_manager/window_manager.dart';

const sentryDNS =
    'https://49ed9a96f02544e1ab064eb451a5b01c@o288287.ingest.sentry.io/4504854610444288';

final log = Logger('main');

void main() async {
  Logger.root.level =
      kDebugMode ? Level.FINE : Level.INFO; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    // TODO: Store logs locally with hive
    debugPrint([
      record.time,
      record.level.name,
      record.loggerName,
      record.message,
      [
        if (record.error != null) record.error,
        if (record.stackTrace != null) record.stackTrace,
      ].join('\n'),
    ].where((e) => e.toString().isNotEmpty == true).join(': '));
  });

  WidgetsFlutterBinding.ensureInitialized();
  MediaKit.ensureInitialized();
  await initializeDateFormatting('nb_NO');
  final appDocDirectory = await getApplicationDocumentsDirectory();
  await configureNetworkTools(
    appDocDirectory.path,
    enableDebugging: !kReleaseMode,
  );
  await Hive.initFlutter(io.Platform.pathSeparator);

  // This is needed for riverpod error messages
  FlutterError.demangleStackTrace = (StackTrace stack) {
    if (stack is stack_trace.Trace) return stack.vmTrace;
    if (stack is stack_trace.Chain) return stack.toTrace().vmTrace;
    return stack;
  };

  await SentryFlutter.init(
    (options) {
      options.dsn = sentryDNS;
      // Set tracesSampleRate to 1.0 to capture 100% of
      // transactions for performance monitoring.
      // We recommend adjusting this value in production.
      options.tracesSampleRate = kReleaseMode ? 0.1 : 1.0;
    },
    appRunner: () async {
      // Initialize desktop-specific capabilities
      await _initOnDesktop();

      return runApp(
        // For widgets to be able to read providers, we need to wrap the entire
        // application in a "UncontrolledProviderScope" widget. This is where
        // the state of our providers will be stored.
        UncontrolledProviderScope(
          container: initProviders(),
          child: const SmartDashApp(),
        ),
      );
    },
  );
}

Future<void> _initOnDesktop() async {
  if (Platform.isDesktop) {
    WidgetsFlutterBinding.ensureInitialized();
    final prefs = await SharedPreferences.getInstance();
    final size = Size(
      prefs.getDouble(SmartDashApp.propWindowSizeWidth) ?? 800,
      prefs.getDouble(SmartDashApp.propWindowSizeHeight) ?? 600,
    );
    WindowOptions windowOptions = WindowOptions(
      title: 'SmartDash',
      size: size,
      skipTaskbar: false,
      titleBarStyle: TitleBarStyle.normal,
      minimumSize: const Size(400, 600),
      maximumSize: const Size(2560, 1440),
    );
    await windowManager.ensureInitialized();
    await windowManager.waitUntilReadyToShow(windowOptions);
  }
}

// TODO: Make code generator for initProviders
ProviderContainer initProviders() {
  final container = ProviderContainer();

  // Initialize core services
  container.read(flutterDirsProvider);
  container.read(notificationServiceProvider);
  container.read(deviceServiceProvider);
  container.read(flowManagerProvider);
  container.read(mqttServiceProvider).init();
  container.read(blockManagerProvider).init();

  // Bind with dependencies
  container.read(historyManagerProvider).bind(
        container.read(flowManagerProvider).events.map((e) => e.tags),
        container.read(deviceServiceProvider).getTokens,
      );
  container.read(networkInfoServiceProvider).bind();
  container.read(presenceServiceProvider).bind();

  // Initialize integrations
  container.read(integrationManagerProvider).init(container);

  // Start pumping events
  container.read(timingServiceProvider).start();
  container.read(historyManagerProvider).pump();

  log.info('Providers: Initialized');
  return container;
}
