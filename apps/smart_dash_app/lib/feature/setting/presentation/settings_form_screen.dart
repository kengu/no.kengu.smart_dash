import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_dash_account/smart_dash_account_app.dart';
import 'package:smart_dash_analytics/smart_dash_analytics.dart';
import 'package:smart_dash_app/core/presentation/widget/form/async_form_screen.dart';
import 'package:smart_dash_app/core/presentation/widget/snackbar/snackbar_controller.dart';
import 'package:smart_dash_app/feature/presence/data/presence_repository.dart';
import 'package:smart_dash_app/feature/setting/data/setting_repository.dart';
import 'package:smart_dash_app/feature/setting/domain/setting.dart';
import 'package:smart_dash_app/feature/setting/presentation/settings_form_screen_controller.dart';
import 'package:smart_dash_app/feature/setting/presentation/tile/dark_mode_tile.dart';
import 'package:smart_dash_app/feature/setting/presentation/tile/price_area_tile.dart';
import 'package:smart_dash_app/feature/setting/presentation/tile/setting_switch_tile.dart';
import 'package:smart_dash_app/feature/system/data/network_device_info_repository.dart';
import 'package:smart_dash_device/smart_dash_device.dart';
import 'package:smart_dash_energy/smart_dash_energy.dart';
import 'package:smart_dash_flow/smart_dash_flow.dart';
import 'package:smart_dash_notification/smart_dash_notification.dart';

import 'tile/connection_mode_tile.dart';

class SettingFormScreen extends ConsumerWidget {
  const SettingFormScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncFormScreen<SettingsQuery, SettingMap,
        SettingsFormScreenController>(
      title: 'Edit settings',
      query: const SettingsQuery(),
      autoSubmit: true,
      provider: settingsFormScreenControllerProvider.call,
      onClose: () => context.pop(),
      onSubmitted: (settings) => SnackbarController.showSnackBarByRef(
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
            return StatefulBuilder(
              builder: (context, setState) {
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
                          DarkModeTile(
                            formControlName: SettingType.darkMode.name,
                          ),
                        ],
                      ),
                      SettingsSection(
                        title: const Text('Interaction'),
                        tiles: [
                          SettingSwitchTile(
                            title: 'Show notices',
                            description: 'A notice is shown on each save',
                            type: SettingType.showSnackBar,
                            formControlName: SettingType.showSnackBar.name,
                          )
                        ],
                      ),
                      SettingsSection(
                        title: const Text('Connection'),
                        tiles: [
                          ConnectionModeTile(
                            formControlName: SettingType.connectionMode.name,
                          ),
                        ],
                      ),
                      SettingsSection(
                        title: const Text('Features'),
                        tiles: [
                          SettingSwitchTile(
                            title: 'Presence detection',
                            description: 'Let devices track presence',
                            type: SettingType.enablePresence,
                            formControlName: SettingType.enablePresence.name,
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
                              await ref.read(accountServiceProvider).clear();
                              setState(() {
                                SnackbarController.showSnackBarByRef(
                                  context,
                                  ref,
                                  'Account data deleted',
                                );
                              });
                            },
                          ),
                          SettingsTile.navigation(
                            title: const Text('Clear device data'),
                            description: const Text(
                              'This will delete all local device data',
                            ),
                            onPressed: (context) async {
                              await ref.read(deviceRepositoryProvider).clear();
                              setState(() {
                                SnackbarController.showSnackBarByRef(
                                  context,
                                  ref,
                                  'Device data deleted',
                                );
                              });
                            },
                          ),
                          SettingsTile.navigation(
                            title: const Text('Clear flow data'),
                            description: const Text(
                              'This will delete all local flow data',
                            ),
                            onPressed: (context) async {
                              await ref.read(blockRepositoryProvider).clear();
                              setState(() {
                                SnackbarController.showSnackBarByRef(
                                  context,
                                  ref,
                                  'Flow data deleted',
                                );
                              });
                            },
                          ),
                          SettingsTile.navigation(
                            title: const Text('Clear notification data'),
                            description: const Text(
                              'This will delete all local notification data',
                            ),
                            onPressed: (context) async {
                              await ref
                                  .read(notificationRepositoryProvider)
                                  .clear();
                              setState(() {
                                SnackbarController.showSnackBarByRef(
                                  context,
                                  ref,
                                  'Notification data deleted',
                                );
                              });
                            },
                          ),
                          SettingsTile.navigation(
                            title: const Text('Clear presence data'),
                            description: const Text(
                              'This will delete all local presence data',
                            ),
                            onPressed: (context) async {
                              await ref
                                  .read(presenceRepositoryProvider)
                                  .clear();
                              setState(() {
                                SnackbarController.showSnackBarByRef(
                                  context,
                                  ref,
                                  'Presence data deleted',
                                );
                              });
                            },
                          ),
                          SettingsTile.navigation(
                            title: const Text('Clear network data'),
                            description: const Text(
                              'This will delete all local network data',
                            ),
                            onPressed: (_) async {
                              final prefs =
                                  await SharedPreferences.getInstance();
                              await prefs
                                  .remove(NetworkDeviceInfoRepository.key);
                              setState(() {
                                SnackbarController.showSnackBarByRef(
                                  context,
                                  ref,
                                  'Network data deleted',
                                );
                              });
                            },
                          ),
                          SettingsTile.navigation(
                            title: const Text('Clear history data'),
                            description: const Text(
                              'This will delete all local history data',
                            ),
                            onPressed: (context) async {
                              await ref
                                  .read(timeSeriesRepositoryProvider)
                                  .deleteAll();
                              setState(() {
                                SnackbarController.showSnackBarByRef(
                                  context,
                                  ref,
                                  'History data deleted',
                                );
                              });
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
                              setState(() {
                                SnackbarController.showSnackBarByRef(
                                  context,
                                  ref,
                                  'Price data deleted',
                                );
                              });
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
      },
    );
  }
}

enum SectionType {
  lookAndFeel({'darkMode'});

  final Set<String> settings;
  const SectionType(this.settings);
}
