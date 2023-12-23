import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_dash/scaffold/presentation/app/smart_dash_app_theme_data.dart';
import 'package:smart_dash/scaffold/smart_dash_router.dart';
import 'package:smart_dash/util/drift/connection.dart';
import 'package:smart_dash/util/platform.dart';
import 'package:window_manager/window_manager.dart';

class SmartDashApp extends ConsumerStatefulWidget {
  const SmartDashApp({super.key});

  static const String propWindowSizeWidth = 'window.size.width';
  static const String propWindowSizeHeight = 'window.size.height';

  @override
  ConsumerState<SmartDashApp> createState() => _SmartDashAppState();
}

class _SmartDashAppState extends ConsumerState<SmartDashApp>
    with WindowListener, WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    // Register after creating SmartDashRouter in
    // case this throws an exception before
    // MaterialApp is built for the first time.
    /*ErrorWidget.builder = (FlutterErrorDetails details) {
      return SmartDashErrorWidget(
        details: details,
      );
    };*/
    WidgetsBinding.instance.addObserver(this);
    if (Platform.isDesktop) {
      windowManager.addListener(this);
      _storePrefs();
    } else {
      SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.manual,
        overlays: [],
      );
    }
  }

  @override
  void dispose() {
    SmartDashRoutes.dispose();
    if (Platform.isDesktop) {
      windowManager.removeListener(this);
    }
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final settings = ref.watch(themeChangedProvider);
        final brightness = ref.watch(platformBrightnessNotifierProvider);
        return MaterialApp.router(
          title: 'SmartDash',
          restorationScopeId: 'app',
          debugShowCheckedModeBanner: false,
          routerConfig: SmartDashRoutes.router,
          theme: SmartDashThemeData.build(settings, brightness),
        );
      },
    );
  }

  @override
  void onWindowResized() => _storePrefs();

  Future<void> _storePrefs() async {
    if (Platform.isDesktop) {
      final prefs = await SharedPreferences.getInstance();
      final size = await windowManager.getSize();
      await prefs.setDouble(SmartDashApp.propWindowSizeWidth, size.width);
      await prefs.setDouble(SmartDashApp.propWindowSizeHeight, size.height);
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.detached) {
      // NOTE: This might fail to complete since the time
      // left until application is killed is undefined, leaving
      // the possibility of some connections still being open.
      // If any transaction are pending, this will leave locks
      // on tables when the application resumes again.
      ref.read(connectionManagerProvider).dispose();
    }
  }
}
