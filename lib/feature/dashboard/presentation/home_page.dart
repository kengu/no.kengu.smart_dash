import 'package:dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:optional/optional.dart';
import 'package:smart_dash/feature/accounting/presentation/energy_bill_hourly_tile.dart';
import 'package:smart_dash/feature/analytics/application/history_manager.dart';
import 'package:smart_dash/feature/analytics/domain/data_array.dart';
import 'package:smart_dash/feature/analytics/domain/time_series.dart';
import 'package:smart_dash/feature/dashboard/presentation/smart_dashboard.dart';
import 'package:smart_dash/feature/dashboard/presentation/smart_dash_header.dart';
import 'package:smart_dash/feature/analytics/presentation/energy_usage_tile.dart';
import 'package:smart_dash/feature/accounting/presentation/electricity_price_hourly_tile.dart';
import 'package:smart_dash/feature/analytics/presentation/power_usage_tile.dart';
import 'package:smart_dash/feature/analytics/presentation/voltage_usage_tile.dart';
import 'package:smart_dash/feature/flow/tokens.dart';
import 'package:smart_dash/feature/setting/domain/setting.dart';
import 'package:smart_dash/feature/setting/presentation/settings_form_screen_controller.dart';
import 'package:smart_dash/feature/weather/presentation/weather_now_tile.dart';
import 'package:smart_dash/scaffold/application/fullscreen_state.dart';
import 'package:smart_dash/util/time/time_scale.dart';
import 'package:smart_dash/util/time/time_series.dart';
import 'package:smart_dash/widget/smart_dash_error_widget.dart';
import 'package:smart_dash/widget/smart_dash_progress_indicator.dart';
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
  TimeSeries energy = TimeSeries(
      name: Tokens.energy.name,
      offset: DateTime.now(),
      span: TimeScale.minutes.to(),
      array: DataArray.size(1, [
        Tokens.energy.toJson(),
      ]));

  TimeSeries _energy(Optional<HistoryEvent> event) {
    if (event.isPresent && event.value.isEnergy) {
      energy = event.value.data.clamp(size, size, pad: 0);
    }
    return energy;
  }

  TimeSeries power = TimeSeries(
      name: Tokens.power.name,
      offset: DateTime.now(),
      span: TimeScale.minutes.to(),
      array: DataArray.size(1, [
        Tokens.power.toJson(),
      ]));

  TimeSeries _power(Optional<HistoryEvent> event) {
    if (event.isPresent && event.value.isPower) {
      power = event.value.data.clamp(size, size, pad: 0);
    }
    return power;
  }

  TimeSeries voltage = TimeSeries(
      name: Tokens.voltage.name,
      offset: DateTime.now(),
      span: TimeScale.minutes.to(),
      array: DataArray.size(1, [
        Tokens.voltage.toJson(),
      ]));

  TimeSeries _voltage(Optional<HistoryEvent> event) {
    if (event.isPresent && event.value.isVoltage) {
      voltage = event.value.data.clamp(size, size, pad: 0);
    }
    return voltage;
  }

  bool get isFullscreen => FullscreenState.watch(ref);

  @override
  void initState() {
    super.initState();
    ref.read(historyManagerProvider).pump();
  }

  @override
  Widget build(BuildContext context) {
    return ref.watch(historyProvider).when(
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
            final when = DateTime(now.year, now.month, now.day);
            final withHeader = !isFullscreen;
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
                      mobile: mobile(),
                      tablet: tablet(),
                      desktop: desktop(),
                      mobileSlotCount: 5,
                      tabletSlotCount: 6,
                      desktopSlotCount: 12,
                      itemBuilder: (item) {
                        switch (item.identifier) {
                          case 'energy':
                            return EnergyUsageTile<int>(
                              key: GlobalObjectKey(item),
                              duration: TimeScale.minutes.to(size),
                              history: _energy(Optional.ofNullable(
                                event,
                              )),
                            );
                          case 'power':
                            return PowerUsageTile<int>(
                              key: GlobalObjectKey(item),
                              duration: TimeScale.minutes.to(size),
                              history: _power(Optional.ofNullable(
                                event,
                              )),
                            );
                          case 'voltage':
                            return VoltageTile<int>(
                              key: GlobalObjectKey(item),
                              duration: TimeScale.minutes.to(size),
                              history: _voltage(Optional.ofNullable(
                                event,
                              )),
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
                          case 'system_now':
                            return SystemNowTile(
                              key: GlobalObjectKey(item),
                            );
                        }
                        return Text(item.identifier);
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
  }

  List<DashboardItem> mobile() => [
        DashboardItem(
          identifier: 'weather_now',
          width: 2,
          height: 1,
          minWidth: 2,
          maxWidth: 2,
        ),
        DashboardItem(
          identifier: 'bill_hourly',
          width: 3,
          height: 1,
          minWidth: 3,
          maxWidth: 3,
        ),
        DashboardItem(
          identifier: 'price_hourly',
          width: 3,
          height: 1,
          minWidth: 2,
          maxWidth: 3,
        ),
        DashboardItem(
          identifier: Tokens.energy.name,
          width: 2,
          height: 1,
          minWidth: 2,
          maxWidth: 3,
        ),
        DashboardItem(
          identifier: Tokens.voltage.name,
          width: 2,
          height: 1,
          minWidth: 2,
          maxWidth: 2,
        ),
        DashboardItem(
          identifier: Tokens.power.name,
          width: 3,
          height: 1,
          minWidth: 2,
          maxWidth: 3,
        ),
        DashboardItem(
          identifier: 'system_now',
          width: 2,
          height: 1,
          minWidth: 2,
          maxWidth: 2,
        ),
      ];
}

List<DashboardItem> tablet() => [
      DashboardItem(
        identifier: 'weather_now',
        width: 2,
        height: 1,
        maxWidth: 2,
        minWidth: 2,
      ),
      DashboardItem(
        identifier: Tokens.energy.name,
        width: 4,
        height: 1,
        minWidth: 4,
      ),
      DashboardItem(
        identifier: Tokens.power.name,
        width: 4,
        height: 1,
        minWidth: 4,
      ),
      DashboardItem(
        identifier: Tokens.voltage.name,
        width: 2,
        height: 1,
        minWidth: 2,
        maxWidth: 2,
      ),
      DashboardItem(
        identifier: 'price_hourly',
        width: 3,
        height: 1,
        minWidth: 3,
      ),
      DashboardItem(
        identifier: 'bill_hourly',
        width: 3,
        height: 1,
        minWidth: 3,
      ),
      DashboardItem(
        identifier: 'system_now',
        width: 2,
        height: 1,
        maxWidth: 2,
        minWidth: 2,
      ),
    ];

List<DashboardItem> desktop() => [
      DashboardItem(
        identifier: 'weather_now',
        width: 3,
        height: 1,
        maxWidth: 3,
        minWidth: 3,
      ),
      DashboardItem(
        identifier: Tokens.energy.name,
        width: 5,
        height: 1,
        minWidth: 5,
      ),
      DashboardItem(
        identifier: Tokens.power.name,
        width: 5,
        height: 1,
        minWidth: 3,
      ),
      DashboardItem(
        identifier: Tokens.voltage.name,
        width: 4,
        height: 1,
        minWidth: 4,
      ),
      DashboardItem(
        identifier: 'price_hourly',
        width: 4,
        height: 1,
        minWidth: 4,
      ),
      DashboardItem(
        identifier: 'bill_hourly',
        width: 4,
        height: 1,
        minWidth: 4,
      ),
      DashboardItem(
        identifier: 'system_now',
        width: 3,
        height: 1,
        maxWidth: 3,
        minWidth: 3,
      ),
    ];
