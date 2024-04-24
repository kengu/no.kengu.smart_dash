import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:optional/optional.dart';
import 'package:smart_dash/core/presentation/widget/tile/smart_dash_tile.dart';
import 'package:smart_dash/feature/device/domain/device.dart';
import 'package:smart_dash/feature/weather/application/weather_now_service.dart';
import 'package:smart_dash/feature/weather/domain/weather.dart';
import 'package:smart_dash/feature/weather/presentation/weather_instant_widget.dart';
import 'package:smart_dash/util/data/units.dart';

class WeatherNowTile<T extends num> extends ConsumerStatefulWidget {
  const WeatherNowTile({
    super.key,
    required this.place,
    required this.device,
    this.title = 'Weather Now',
    this.withWind = true,
    this.withSymbol = false,
    this.withPrecipitation = true,
    this.withLightLuminance = false,
    this.withRelativeHumidity = true,
    this.withCloudAreaFraction = false,
    this.withUltravioletRadiation = false,
    this.period = const Duration(seconds: 5),
  });
  final String place;
  final String title;
  final Duration period;
  final Optional<Identity> device;

  final bool withWind;
  final bool withSymbol;
  final bool withPrecipitation;
  final bool withLightLuminance;
  final bool withRelativeHumidity;
  final bool withCloudAreaFraction;
  final bool withUltravioletRadiation;

  @override
  ConsumerState<WeatherNowTile> createState() => _WeatherNowTileState();
}

class _WeatherNowTileState extends ConsumerState<WeatherNowTile> {
  static const constraints = BoxConstraints(
    minWidth: 170,
    minHeight: 180,
  );

  final nf = NumberFormat("00");

  @override
  Widget build(BuildContext context) {
    if (!widget.device.isPresent) {
      return _buildEmptyTile();
    }
    final service = ref.watch(weatherNowServiceProvider);
    return StreamBuilder<Weather>(
      stream: service.getNowAsStream(
        widget.device.value,
        refresh: true,
        period: widget.period,
      ),
      initialData: service.getCachedNow(widget.device.value).orElseNull,
      builder: (context, snapshot) {
        final now = DateTime.now();
        final data = snapshot.data;
        final weather = snapshot.data?.select(now);
        if (weather == null) {
          return _buildEmptyTile();
        }
        final index = data!.props.timeseries.indexOf(weather);
        return SmartDashTile(
          title: widget.title,
          subtitle: widget.place,
          constraints: constraints,
          leading: const Icon(
            Icons.wb_sunny,
            color: Colors.lightGreen,
          ),
          trailing: Text(
            _toTemperature(weather.data.instant),
            style: const TextStyle(
              color: Colors.lightGreen,
              fontWeight: FontWeight.bold,
            ),
            textScaler: const TextScaler.linear(1.2),
          ),
          body: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 800),
                child: WeatherInstantWidget(
                  index: index,
                  weather: data,
                  isForecast: false,
                  withWind: widget.withWind,
                  withSymbol: widget.withSymbol,
                  withPrecipitation: widget.withPrecipitation,
                  withLightLuminance: widget.withLightLuminance,
                  withRelativeHumidity: widget.withRelativeHumidity,
                  withCloudAreaFraction: widget.withCloudAreaFraction,
                  withUltravioletRadiation: widget.withUltravioletRadiation,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  SmartDashTile _buildEmptyTile() {
    return _buildTile(
      title: widget.title,
      subtitle: widget.place,
      body: const Center(
        child: CircularProgressIndicator(
          color: Colors.lightGreen,
        ),
      ),
    );
  }

  SmartDashTile _buildTile({
    required String title,
    required String subtitle,
    required Widget body,
  }) {
    return SmartDashTile(
      title: title,
      subtitle: subtitle,
      constraints: constraints,
      leading: const Icon(
        Icons.wb_sunny,
        color: Colors.lightGreen,
      ),
      trailing: Text(
        _toTemperature(),
        style: const TextStyle(
          color: Colors.lightGreen,
          fontWeight: FontWeight.bold,
        ),
        textScaler: const TextScaler.linear(1.2),
      ),
      body: body,
    );
  }

  String _toTemperature([WeatherInstant? data]) {
    return data?.details.airTemperature?.toTemperature(1) ?? '- °C';
  }
}
