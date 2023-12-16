import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_dash/scaffold/presentation/app/smart_dash_app_theme_data.dart';
import 'package:smart_dash/scaffold/smart_dash_router.dart';
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
    with WindowListener {
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
    if (Platform.isDesktop) {
      windowManager.addListener(this);
      _storePrefs();
    }
  }

  @override
  void dispose() {
    SmartDashRoutes.dispose();
    if (Platform.isDesktop) {
      windowManager.removeListener(this);
    }
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
}
