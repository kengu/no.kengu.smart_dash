import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_dash_app/core/presentation/widget/smart_dash_error_widget.dart';
import 'package:smart_dash_app/core/presentation/widget/smart_dash_progress_indicator.dart';
import 'package:smart_dash_app/feature/account/presentation/home_controller.dart';
import 'package:smart_dash_app/feature/accounting/presentation/electricity_price_hourly_tile.dart';
import 'package:smart_dash_app/feature/accounting/presentation/energy_bill_hourly_tile.dart';
import 'package:smart_dash_app/feature/accounting/presentation/energy_bill_month_tile.dart';
import 'package:smart_dash_app/feature/dashboard/presentation/smart_dashboard_page.dart';
import 'package:smart_dash_app/feature/device/presentation/tile/energy_usage_tile.dart';
import 'package:smart_dash_app/feature/device/presentation/tile/power_usage_tile.dart';
import 'package:smart_dash_app/feature/device/presentation/tile/switch_onoff_list_tile.dart';
import 'package:smart_dash_app/feature/device/presentation/tile/temperature_list_tile.dart';
import 'package:smart_dash_app/feature/device/presentation/tile/voltage_usage_tile.dart';
import 'package:smart_dash_app/feature/presence/presentation/presence_tile.dart';
import 'package:smart_dash_app/feature/setting/domain/setting.dart';
import 'package:smart_dash_app/feature/snow/presentation/snow_now_list_tile.dart';
import 'package:smart_dash_app/feature/snow/presentation/snow_now_tile.dart';
import 'package:smart_dash_app/feature/system/presentation/network_now_tile.dart';
import 'package:smart_dash_app/feature/system/presentation/system_now_tile.dart';
import 'package:smart_dash_app/feature/weather/presentation/weather_forecast_tile.dart';
import 'package:smart_dash_app/feature/weather/presentation/weather_now_tile.dart';
import 'package:smart_dash_analytics/smart_dash_analytics.dart';

class HomePage extends ConsumerWidget {
  const HomePage({
    super.key,
    this.size = 90,
  });

  final int size;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(homeControllerProvider(const HomeQuery())).when(
        error: SmartDashErrorWidget.from,
        loading: SmartDashProgressIndicator.new,
        data: (data) {
          final now = DateTime.now();
          final area = data.isPresent
              ? data.value.settings[SettingType.priceArea]!.value.toString()
              : SettingType.priceArea.toStringValue();
          final when = HistoryManager.toOffset(now);
          return SmartDashboardPage(
              name: 'home',
              title: 'Home',
              pageItemBuilder: (home, type, slotsCount, item) {
                switch (item.identifier) {
                  case 'weather_now':
                    // TODO: Add support for device ids in
                    return WeatherNowTile(
                      key: GlobalObjectKey(item),
                      place: data.value.home.name,
                      device: home.getIdentity(
                        'rtl_433:cotech-367959-29',
                      ),
                    );
                  case 'temp_backside':
                    // TODO: Add support for device ids in
                    return WeatherNowTile(
                      key: GlobalObjectKey(item),
                      place: data.value.home.name,
                      title: 'Front door',
                      withWind: false,
                      withPrecipitation: false,
                      device: home.getIdentity(
                        'rtl_433:fineoffset-telldusproove-199',
                      ),
                    );
                  case 'weather_forecast':
                    // TODO: Make location name configurable
                    return WeatherForecastTile(
                      key: GlobalObjectKey(item),
                      lat: data.value.home.location.lat,
                      lon: data.value.home.location.lon,
                      place: data.value.home.name,
                    );
                  case 'meter_energy:sikom:device:541905':
                    return EnergyUsageTile<int>(
                      key: GlobalObjectKey(item),
                      size: size,
                      duration: TimeScale.minutes.to(size),
                      energy: home.getToken(
                        'meter_energy:sikom:device:541905',
                      ),
                    );
                  case 'measure_power:sikom:device:541905':
                    return PowerUsageTile<int>(
                      key: GlobalObjectKey(item),
                      size: size,
                      duration: TimeScale.minutes.to(size),
                      power: home.getToken(
                        'measure_power:sikom:device:541905',
                      ),
                    );
                  case 'measure_voltage:sikom:device:541905':
                    return VoltageTile<int>(
                      key: GlobalObjectKey(item),
                      size: size,
                      duration: TimeScale.minutes.to(size),
                      voltage: home.getToken(
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
                      subtitle: 'Last updated ${DateTime.now().format()}',
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
                      power: home.getToken(
                        'measure_power:sikom:device:541905',
                      ),
                      area: area,
                      when: when,
                    );
                  case 'bill_month':
                    return EnergyBillMonthTile(
                      key: GlobalObjectKey(item),
                      area: area,
                      when: when,
                      power: home.getToken(
                        'measure_power:sikom:device:541905',
                      ),
                    );
                  case 'snow_now':
                    return SnowNowTile(
                      location: 'Skirvedalen',
                    );
                  case 'snow_now_list':
                    return const SnowNowListTile();
                  case 'system_now':
                    return SystemNowTile(
                      key: GlobalObjectKey(item),
                    );
                  case 'network_now':
                    return NetworkNowTile(
                      key: GlobalObjectKey(item),
                    );
                  case 'presence_now':
                    return PresenceTile(
                      key: GlobalObjectKey(item),
                    );
                  default:
                    return Text(item.identifier);
                }
              });
        });
  }
}
