import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:optional/optional.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash_app/feature/setting/application/setting_service.dart';
import 'package:smart_dash_app/feature/setting/data/setting_repository.dart';
import 'package:smart_dash_app/feature/setting/domain/setting.dart';

part 'smart_dash_theme_data.g.dart';

class SmartDashThemeData {
  static const double inputDecorationLabelStyleHeight = 0.7;
  static const String fontFamily = '';
  static ThemeData build(SettingMap settings, Brightness brightness) {
    final data = _theme(settings, brightness);
    final navigationSurfaceColor = data.brightness == Brightness.dark
        ? data.colorScheme.surface.lighten(0.03)
        : data.colorScheme.surface;
    return data.copyWith(
      // Define the default font family.
      textTheme: data.textTheme.apply(fontFamily: fontFamily),
      primaryTextTheme: data.primaryTextTheme.apply(fontFamily: fontFamily),
      inputDecorationTheme: data.inputDecorationTheme.copyWith(
        labelStyle: const TextStyle(
          height: inputDecorationLabelStyleHeight,
        ),
      ),
      navigationBarTheme: data.navigationBarTheme.copyWith(
        backgroundColor: navigationSurfaceColor,
        elevation: 4.0,
      ),
      navigationRailTheme: data.navigationRailTheme.copyWith(
        backgroundColor: navigationSurfaceColor,
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.all(data.colorScheme.inversePrimary),
        trackColor: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.selected)
              ? data.colorScheme.inversePrimary
              : data.colorScheme.inversePrimary,
        ),
      ),
    );
  }

  static ThemeData _theme(SettingMap settings, Brightness brightness) {
    if (settings.isNotEmpty) {
      final brightness = settings[SettingType.darkMode]!;
      switch (brightness.value) {
        case DarkMode.on:
          return ThemeData.dark(useMaterial3: true);
        case DarkMode.off:
          return ThemeData.light(useMaterial3: true);
      }
    }
    return Brightness.dark == brightness
        ? ThemeData.dark(useMaterial3: true)
        : ThemeData.light(useMaterial3: true);
  }
}

extension ColorX on Color {
  Color darken([double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(this);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

    return hslDark.toColor();
  }

  Color lighten([double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(this);
    final hslLight =
        hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

    return hslLight.toColor();
  }
}

class SmartDashAppThemeQuery {}

@riverpod
class SmartDashAppThemeController extends _$SmartDashAppThemeController {
  @override
  FutureOr<Optional<SettingMap>> build(SmartDashAppThemeQuery query) =>
      load(query);

  Future<Optional<SettingMap>> load(SmartDashAppThemeQuery query) async {
    return Optional.of(
      await ref.read(settingServiceProvider).load(),
    );
  }
}

@riverpod
SettingMap themeChanged(ThemeChangedRef ref) => Map.fromEntries(
      ref.watch(settingServiceProvider).settings.entries.where(
            (e) => SettingType.darkMode == e.key,
          ),
    );

@riverpod
class PlatformBrightnessNotifier extends _$PlatformBrightnessNotifier {
  void call() {
    state = SchedulerBinding.instance.platformDispatcher.platformBrightness;
  }

  @override
  Brightness build() {
    // Listen for system brightness changes
    SchedulerBinding.instance.platformDispatcher.onPlatformBrightnessChanged =
        call;
    return SchedulerBinding.instance.platformDispatcher.platformBrightness;
  }
}
