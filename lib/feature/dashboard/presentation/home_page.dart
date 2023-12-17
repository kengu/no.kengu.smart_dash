import 'package:dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:optional/optional.dart';
import 'package:smart_dash/feature/accounting/presentation/energy_bill_tile.dart';
import 'package:smart_dash/feature/analytics/application/history_manager.dart';
import 'package:smart_dash/feature/analytics/domain/data_array.dart';
import 'package:smart_dash/feature/analytics/domain/time_series.dart';
import 'package:smart_dash/feature/dashboard/presentation/smart_dash_board.dart';
import 'package:smart_dash/feature/dashboard/presentation/smart_dash_header.dart';
import 'package:smart_dash/feature/analytics/presentation/energy_usage_tile.dart';
import 'package:smart_dash/feature/accounting/presentation/hourly_electricity_price_tile.dart';
import 'package:smart_dash/feature/analytics/presentation/power_usage_tile.dart';
import 'package:smart_dash/feature/analytics/presentation/voltage_usage_tile.dart';
import 'package:smart_dash/feature/flow/tokens.dart';
import 'package:smart_dash/feature/setting/domain/setting.dart';
import 'package:smart_dash/feature/setting/presentation/settings_form_screen_controller.dart';
import 'package:smart_dash/util/time/time_scale.dart';
import 'package:smart_dash/util/time/time_series.dart';
import 'package:smart_dash/widget/smart_dash_error_widget.dart';
import 'package:smart_dash/widget/smart_dash_progress_indicator.dart';

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
            return Padding(
              padding: const EdgeInsets.all(24.0),
              child: Stack(
                children: [
                  const SmartDashHeader(
                    title: 'Dashboard',
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 56.0),
                    child: SmartDashboard(
                      slotHeight: 270,
                      mobile: mobile(),
                      desktop: desktop(),
                      mobileSlotCount: 6,
                      desktopSlotCount: 12,
                      itemBuilder: (item) {
                        switch (item.identifier) {
                          case 'energy':
                            return EnergyUsageTile<int>(
                              duration: TimeScale.minutes.to(size),
                              history: _energy(Optional.ofNullable(
                                event,
                              )),
                            );
                          case 'power':
                            return PowerUsageTile<int>(
                              duration: TimeScale.minutes.to(size),
                              history: _power(Optional.ofNullable(
                                event,
                              )),
                            );
                          case 'voltage':
                            return VoltageTile<int>(
                              duration: TimeScale.minutes.to(size),
                              history: _voltage(Optional.ofNullable(
                                event,
                              )),
                            );
                          case 'price':
                            return HourlyElectricityPriceTile(
                              area: area,
                              when: when,
                            );
                          case 'bill':
                            return EnergyBillTile(
                              area: area,
                              when: when,
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

  List<DashboardItem> desktop() => [
        DashboardItem(
          identifier: Tokens.energy.name,
          width: 6,
          height: 1,
          minWidth: 1,
        ),
        DashboardItem(
          identifier: Tokens.power.name,
          startX: 6,
          width: 6,
          height: 1,
          minWidth: 1,
        ),
        DashboardItem(
          identifier: Tokens.voltage.name,
          startY: 1,
          width: 4,
          height: 1,
          minWidth: 1,
        ),
        DashboardItem(
          identifier: 'price',
          startY: 1,
          startX: 4,
          width: 4,
          height: 1,
          minWidth: 1,
        ),
        DashboardItem(
          identifier: 'bill',
          startY: 1,
          startX: 8,
          width: 4,
          height: 1,
          minWidth: 1,
        ),
      ];

  List<DashboardItem> mobile() => [
        DashboardItem(
          identifier: Tokens.energy.name,
          width: 6,
          height: 1,
          minWidth: 1,
        ),
        DashboardItem(
          identifier: Tokens.power.name,
          startY: 1,
          width: 6,
          height: 1,
          minWidth: 1,
        ),
        DashboardItem(
          identifier: Tokens.voltage.name,
          startY: 2,
          width: 6,
          height: 1,
          minWidth: 1,
        ),
        DashboardItem(
          identifier: 'price',
          startY: 3,
          width: 6,
          height: 1,
          minWidth: 1,
        ),
        DashboardItem(
          identifier: 'bill',
          startY: 4,
          width: 6,
          height: 1,
          minWidth: 1,
        ),
      ];
}
