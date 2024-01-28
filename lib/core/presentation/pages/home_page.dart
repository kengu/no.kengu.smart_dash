import 'package:dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_dash/feature/accounting/presentation/energy_bill_hourly_tile.dart';
import 'package:smart_dash/feature/accounting/presentation/energy_bill_month_tile.dart';
import 'package:smart_dash/feature/analytics/application/history_manager.dart';
import 'package:smart_dash/feature/dashboard/data/dashboard_repository.dart';
import 'package:smart_dash/feature/dashboard/domain/dashboard.dart' as m;
import 'package:smart_dash/feature/dashboard/presentation/smart_dashboard.dart';
import 'package:smart_dash/feature/dashboard/presentation/smart_dash_header.dart';
import 'package:smart_dash/feature/device/presentation/tile/energy_usage_tile.dart';
import 'package:smart_dash/feature/accounting/presentation/electricity_price_hourly_tile.dart';
import 'package:smart_dash/feature/device/presentation/tile/power_usage_tile.dart';
import 'package:smart_dash/feature/device/presentation/tile/switch_onoff_list_tile.dart';
import 'package:smart_dash/feature/device/presentation/tile/temperature_list_tile.dart';
import 'package:smart_dash/feature/device/presentation/tile/voltage_usage_tile.dart';
import 'package:smart_dash/feature/setting/domain/setting.dart';
import 'package:smart_dash/feature/setting/presentation/settings_form_screen_controller.dart';
import 'package:smart_dash/feature/snow/presentation/snow_now_list_tile.dart';
import 'package:smart_dash/feature/snow/presentation/snow_now_tile.dart';
import 'package:smart_dash/feature/weather/presentation/weather_now_tile.dart';
import 'package:smart_dash/core/application/fullscreen_state.dart';
import 'package:smart_dash/util/time/date_time.dart';
import 'package:smart_dash/util/time/time_scale.dart';
import 'package:smart_dash/core/presentation/widget/smart_dash_error_widget.dart';
import 'package:smart_dash/core/presentation/widget/smart_dash_progress_indicator.dart';
import 'package:smart_dash/feature/system/presentation/system_now_tile.dart';

class HomePage extends ConsumerWidget {
  const HomePage({
    super.key,
    this.size = 90,
  });

  final int size;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFullscreen = FullscreenState.watch(ref);
    return ref.watch(settingsFormScreenControllerProvider).when(
          error: SmartDashErrorWidget.from,
          loading: SmartDashProgressIndicator.new,
          data: (settings) {
            final now = DateTime.now();
            final area = settings.isPresent
                ? settings.value[SettingType.priceArea]!.value.toString()
                : SettingType.priceArea.toStringValue();
            final when = HistoryManager.toOffset(now);
            final withHeader = !isFullscreen;
            return ref.watch(dashboardRepositoryProvider).when(
                  error: SmartDashErrorWidget.from,
                  loading: SmartDashProgressIndicator.new,
                  data: (dashboards) {
                    final home = dashboards['home'] as m.Dashboard;
                    final storage = SmartDashboardItemStorage(
                      mobile: home.mobile
                          .map((e) => e.toJson())
                          .map((e) => DashboardItem.fromMap(e))
                          .toList(),
                      tablet: home.tablet
                          .map((e) => e.toJson())
                          .map((e) => DashboardItem.fromMap(e))
                          .toList(),
                      desktop: home.desktop
                          .map((e) => e.toJson())
                          .map((e) => DashboardItem.fromMap(e))
                          .toList(),
                      mobileLarge: home.mobileLarge
                          .map((e) => e.toJson())
                          .map((e) => DashboardItem.fromMap(e))
                          .toList(),
                      mobileSlotCount: home.mobileSlotCount,
                      tabletSlotCount: home.tabletSlotCount,
                      desktopSlotCount: home.desktopSlotCount,
                      mobileLargeSlotCount: home.mobileLargeSlotCount,
                    );
                    return Padding(
                      padding: withHeader
                          ? const EdgeInsets.all(24.0).copyWith(bottom: 0.0)
                          : const EdgeInsets.all(16.0),
                      child: Stack(
                        children: [
                          if (withHeader)
                            const SmartDashHeader(
                              key: GlobalObjectKey('home'),
                              title: 'Home',
                            ),
                          Padding(
                            padding: withHeader
                                ? const EdgeInsets.only(top: 56.0)
                                : const EdgeInsets.only(top: 0.0),
                            child: SmartDashboard(
                              slotHeight: 270,
                              storage: storage,
                              itemBuilder: (type, slotsCount, item) {
                                switch (item.identifier) {
                                  case 'meter_energy:sikom:device:541905':
                                    return EnergyUsageTile<int>(
                                      key: GlobalObjectKey(item),
                                      size: size,
                                      duration: TimeScale.minutes.to(size),
                                      energy: home.get(
                                        'meter_energy:sikom:device:541905',
                                      ),
                                    );
                                  case 'measure_power:sikom:device:541905':
                                    return PowerUsageTile<int>(
                                      key: GlobalObjectKey(item),
                                      size: size,
                                      duration: TimeScale.minutes.to(size),
                                      power: home.get(
                                        'measure_power:sikom:device:541905',
                                      ),
                                    );
                                  case 'measure_voltage:sikom:device:541905':
                                    return VoltageTile<int>(
                                      key: GlobalObjectKey(item),
                                      size: size,
                                      duration: TimeScale.minutes.to(size),
                                      voltage: home.get(
                                        'measure_voltage:sikom:device:541905',
                                      ),
                                    );
                                  case 'temperature':
                                    return TemperatureListTile(
                                      title: 'Temperatures Now',
                                      subtitle: 'Last $size minutes',
                                      key: GlobalObjectKey(item),
                                      duration: TimeScale.minutes.to(size),
                                    );
                                  case 'onOff':
                                    return SwitchOnOffListTile(
                                      title: 'Switches Now',
                                      subtitle:
                                          'Last updated ${DateTime.now().format()}',
                                      key: GlobalObjectKey(item),
                                      duration: TimeScale.minutes.to(size),
                                    );
                                  case 'price_hourly':
                                    return ElectricityPriceHourlyTile(
                                      key: GlobalObjectKey(item),
                                      area: area,
                                      when: when,
                                    );
                                  case 'bill_hourly':
                                    return EnergyBillHourlyTile(
                                      key: GlobalObjectKey(item),
                                      power: home.get(
                                        'measure_power:sikom:device:541905',
                                      ),
                                      area: area,
                                      when: when,
                                    );
                                  case 'bill_month':
                                    return EnergyBillMonthTile(
                                      key: GlobalObjectKey(item),
                                      power: home.get(
                                        'measure_power:sikom:device:541905',
                                      ),
                                      area: area,
                                      when: when,
                                    );
                                  case 'weather_now':
                                    // TODO: Make location name configurable
                                    return WeatherNowTile(
                                      key: GlobalObjectKey(item),
                                      lat: 60.0802,
                                      lon: 8.8168,
                                      place: 'Tindefjell',
                                    );
                                  case 'snow_now':
                                    return const SnowNowTile(
                                      location: 'Skirvedalen',
                                    );
                                  case 'snow_now_list':
                                    return const SnowNowListTile();
                                  case 'system_now':
                                    return SystemNowTile(
                                      key: GlobalObjectKey(item),
                                    );
                                  default:
                                    return Text(item.identifier);
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
          },
        );
  }
}
