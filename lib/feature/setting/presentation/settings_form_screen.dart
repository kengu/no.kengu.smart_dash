import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_dash/feature/account/data/account_repository.dart';
import 'package:smart_dash/feature/accounting/data/pricing/electricity_price_repository.dart';
import 'package:smart_dash/feature/analytics/data/time_series_repository.dart';
import 'package:smart_dash/feature/device/data/device_repository.dart';
import 'package:smart_dash/feature/setting/data/setting_repository.dart';
import 'package:smart_dash/feature/setting/domain/setting.dart';
import 'package:smart_dash/feature/setting/presentation/settings_form_screen_controller.dart';
import 'package:smart_dash/feature/setting/presentation/tile/dark_mode_tile.dart';
import 'package:smart_dash/feature/setting/presentation/tile/price_area_tile.dart';
import 'package:smart_dash/feature/setting/presentation/tile/setting_switch_tile.dart';
import 'package:smart_dash/core/presentation/widget/form/async_form_screen.dart';

import 'package:smart_dash/core/presentation/widget/notice/notice_controller.dart';

class SettingFormScreen extends ConsumerWidget {
  const SettingFormScreen({
    super.key,
    required this.location,
  });

  final String location;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncFormScreen<SettingsQuery, SettingMap>(
      title: 'Edit settings',
      query: SettingsQuery(),
      autoSubmit: true,
      provider: settingsFormScreenControllerProvider,
      onClose: () => context.go(location),
      onSubmitted: (settings) => NoticeController.showSnackBarByRef(
        context,
        ref,
        'Settings saved',
      ),
      child: const SettingTilesWidget(),
    );
  }
}

class SettingTilesWidget extends StatelessWidget {
  const SettingTilesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return ReactiveFormConsumer(
          builder: (context, formGroup, child) {
            final theme = Theme.of(context);
            return Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: SettingsList(
                platform: DevicePlatform.android,
                lightTheme: SettingsThemeData(
                  settingsListBackground: theme.canvasColor,
                  settingsTileTextColor: theme.listTileTheme.tileColor,
                ),
                darkTheme: SettingsThemeData(
                  settingsListBackground: theme.canvasColor,
                  settingsTileTextColor: theme.listTileTheme.tileColor,
                ),
                sections: [
                  SettingsSection(
                    title: const Text('Look and feel'),
                    tiles: [
                      DarkModeTile(formControlName: SettingType.darkMode.name),
                    ],
                  ),
                  SettingsSection(
                    title: const Text('Interaction'),
                    tiles: [
                      SettingSwitchTile(
                        type: SettingType.showSnackBar,
                        formControlName: SettingType.showSnackBar.name,
                      )
                    ],
                  ),
                  SettingsSection(
                    title: const Text('Accounting'),
                    tiles: [
                      PriceAreaTile(
                        formControlName: SettingType.priceArea.name,
                      )
                    ],
                  ),
                  SettingsSection(
                    title: const Text('Data'),
                    tiles: [
                      SettingsTile.navigation(
                        title: const Text('Clear account data'),
                        description: const Text(
                          'This will delete all local account data',
                        ),
                        onPressed: (_) async {
                          final prefs = await SharedPreferences.getInstance();
                          await prefs.remove(AccountRepository.key);
                        },
                      ),
                      SettingsTile.navigation(
                        title: const Text('Clear device data'),
                        description: const Text(
                          'This will delete all local device data',
                        ),
                        onPressed: (_) async {
                          final prefs = await SharedPreferences.getInstance();
                          await prefs.remove(DeviceRepository.key);
                        },
                      ),
                      SettingsTile.navigation(
                        title: const Text('Clear history data'),
                        description: const Text(
                          'This will delete all local history data',
                        ),
                        onPressed: (_) async {
                          await ref
                              .read(timeSeriesRepositoryProvider)
                              .deleteAll();
                        },
                      ),
                      SettingsTile.navigation(
                        title: const Text('Clear price data'),
                        description: const Text(
                          'This will delete all local price data',
                        ),
                        onPressed: (_) async {
                          await ref
                              .read(electricityPriceRepositoryProvider)
                              .deleteAll();
                        },
                      )
                    ],
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }
}

enum SectionType {
  lookAndFeel({'darkMode'});

  final Set<String> settings;
  const SectionType(this.settings);
}
