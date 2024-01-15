import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_kit/media_kit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_dash/core/application/app_state_manager.dart';
import 'package:smart_dash/util/platform.dart';
import 'package:smart_dash/core/presentation/smart_dash_app.dart';
import 'package:window_manager/window_manager.dart';
import 'package:stack_trace/stack_trace.dart' as stack_trace;
import 'package:sentry_flutter/sentry_flutter.dart';

const sentryDNS =
    'https://49ed9a96f02544e1ab064eb451a5b01c@o288287.ingest.sentry.io/4504854610444288';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MediaKit.ensureInitialized();

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
      options.tracesSampleRate = 1.0;
    },
    appRunner: () async {
      // Initialize desktop-specific capabilities
      await _initOnDesktop();

      // Create SmartDash state manager
      final manager = AppStateManager(
        ProviderContainer(),
      );

      return runApp(
        // For widgets to be able to read providers, we need to wrap the entire
        // application in a "UncontrolledProviderScope" widget. This is where
        // the state of our providers will be stored.
        UncontrolledProviderScope(
          container: manager.init(),
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
