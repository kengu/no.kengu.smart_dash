import 'package:dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:optional/optional.dart';
import 'package:smart_dash/feature/accounting/presentation/energy_bill_hourly_tile.dart';
import 'package:smart_dash/feature/accounting/presentation/energy_bill_month_tile.dart';
import 'package:smart_dash/feature/analytics/application/history_manager.dart';
import 'package:smart_dash/feature/analytics/domain/time_series.dart';
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
import 'package:smart_dash/feature/flow/domain/token.dart';
import 'package:smart_dash/feature/setting/domain/setting.dart';
import 'package:smart_dash/feature/setting/presentation/settings_form_screen_controller.dart';
import 'package:smart_dash/feature/weather/presentation/snow_now_list_tile.dart';
import 'package:smart_dash/feature/weather/presentation/weather_now_tile.dart';
import 'package:smart_dash/core/application/fullscreen_state.dart';
import 'package:smart_dash/util/time/date_time.dart';
import 'package:smart_dash/util/time/time_scale.dart';
import 'package:smart_dash/core/presentation/widget/smart_dash_error_widget.dart';
import 'package:smart_dash/core/presentation/widget/smart_dash_progress_indicator.dart';
import 'package:smart_dash/feature/system/presentation/system_now_tile.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  static const int size = 90;

  final Map<Token, TimeSeries> _series = {};

  Optional<TimeSeries> _fetchHistory(
      DashboardItem item, List<Token> tokens, HistoryEvent? event) {
    final token = tokens.firstWhereOptional((e) => e.name == item.identifier);
    if (!token.isPresent) {
      return const Optional.empty();
    }
    return Optional.of(
      token.value == event?.token
          ? _series[token.value] = token.value.toTs(event, size)
          : _series.putIfAbsent(token.value, () {
              final cached =
                  manager.getCached(token.value, when: DateTime.now());
              return cached.isPresent ? cached.value : token.value.emptyTs();
            }),
    );
  }

  bool get isFullscreen => FullscreenState.watch(ref);

  HistoryManager get manager => ref.read(historyManagerProvider);

  @override
  Widget build(BuildContext context) {
    return ref.watch(historyProvider()).when(
          data: _build,
          loading: _build,
          error: SmartDashErrorWidget.from,
        );
  }

  Widget _build([HistoryEvent? event]) {
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
                      mobileSlotCount: 8,
                      tabletSlotCount: 6,
                      desktopSlotCount: 12,
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
                              itemBuilder: (slotsCount, item) {
                                switch (item.identifier) {
                                  case 'meter_energy:sikom:device:541905':
                                    return EnergyUsageTile<int>(
                                      key: GlobalObjectKey(item),
                                      duration: TimeScale.minutes.to(size),
                                      history: _fetchHistory(
                                          item, home.tokens, event),
                                    );
                                  case 'measure_power:sikom:device:541905':
                                    return PowerUsageTile<int>(
                                      key: GlobalObjectKey(item),
                                      duration: TimeScale.minutes.to(size),
                                      history: _fetchHistory(
                                          item, home.tokens, event),
                                    );
                                  case 'measure_voltage:sikom:device:541905':
                                    return VoltageTile<int>(
                                      key: GlobalObjectKey(item),
                                      duration: TimeScale.minutes.to(size),
                                      history: _fetchHistory(
                                          item, home.tokens, event),
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
                                      power: home.tokens.firstWhereOptional((e) =>
                                          e.name ==
                                          'measure_power:sikom:device:541905'),
                                      area: area,
                                      when: when,
                                    );
                                  case 'bill_month':
                                    return EnergyBillMonthTile(
                                      key: GlobalObjectKey(item),
                                      power: home.tokens.firstWhereOptional((e) =>
                                          e.name ==
                                          'measure_power:sikom:device:541905'),
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
                                    // TODO: Make location name configurable
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
