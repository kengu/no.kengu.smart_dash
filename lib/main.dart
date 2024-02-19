import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:media_kit/media_kit.dart';
import 'package:network_tools_flutter/network_tools_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_dash/core/presentation/smart_dash_app.dart';
import 'package:smart_dash/feature/analytics/application/history_manager.dart';
import 'package:smart_dash/feature/camera/application/camera_manager.dart';
import 'package:smart_dash/feature/device/application/device_driver_manager.dart';
import 'package:smart_dash/feature/flow/application/flow_manager.dart';
import 'package:smart_dash/feature/presence/application/presence_service.dart';
import 'package:smart_dash/feature/system/application/network_info_service.dart';
import 'package:smart_dash/feature/system/application/timing_service.dart';
import 'package:smart_dash/integration/foscam/application/foscam_service.dart';
import 'package:smart_dash/integration/sikom/application/sikom_driver.dart';
import 'package:smart_dash/util/platform.dart';
import 'package:stack_trace/stack_trace.dart' as stack_trace;
import 'package:window_manager/window_manager.dart';

const sentryDNS =
    'https://49ed9a96f02544e1ab064eb451a5b01c@o288287.ingest.sentry.io/4504854610444288';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MediaKit.ensureInitialized();
  await initializeDateFormatting('nb_NO');
  final appDocDirectory = await getApplicationDocumentsDirectory();
  await configureNetworkTools(
    appDocDirectory.path,
    enableDebugging: !kReleaseMode,
  );

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

ProviderContainer initProviders() {
  final container = ProviderContainer();
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

  debugPrint('Providers: Initialized');
  return container;
}
