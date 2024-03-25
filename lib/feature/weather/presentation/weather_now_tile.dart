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
    this.period = const Duration(seconds: 5),
  });
  final String place;
  final Duration period;
  final Optional<Identity> device;

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
    final cached = service.getCachedNow(widget.device.value, refresh: true);
    return StreamBuilder<Weather>(
      initialData: cached.orElseNull,
      stream: service.getNowAsStream(
        widget.device.value,
        period: widget.period,
      ),
      builder: (context, snapshot) {
        final now = DateTime.now();
        final data = snapshot.data;
        final weather = snapshot.data?.select(now);
        if (weather == null) {
          return _buildEmptyTile();
        }
        final index = data!.props.timeseries.indexOf(weather);
        return SmartDashTile(
          title: 'Weather Now',
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
                  withWind: true,
                  withSymbol: false,
                  withPrecipitation: true,
                  withLightLuminance: false,
                  withRelativeHumidity: true,
                  withCloudAreaFraction: false,
                  withUltravioletRadiation: false,
                  index: index,
                  weather: data,
                  isForecast: false,
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
      title: 'Weather Now',
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
