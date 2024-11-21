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
import 'package:smart_dash_app/util/platform.dart';
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
        // application in a "ProviderScope" widget. This is where the state of
        // our providers will be stored.
        ProviderScope(
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
