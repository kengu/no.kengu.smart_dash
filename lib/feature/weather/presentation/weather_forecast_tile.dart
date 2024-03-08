import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:smart_dash/core/presentation/widget/selectable_row_widget.dart';
import 'package:smart_dash/core/presentation/widget/tile/smart_dash_tile.dart';
import 'package:smart_dash/feature/weather/application/weather_service.dart';
import 'package:smart_dash/feature/weather/domain/weather.dart';
import 'package:smart_dash/util/data/units.dart';

import 'weather_box_widget.dart';
import 'weather_instant_widget.dart';

class WeatherForecastTile<T extends num> extends ConsumerStatefulWidget {
  const WeatherForecastTile({
    super.key,
    required this.lat,
    required this.lon,
    required this.place,
    this.period = const Duration(minutes: 5),
  });

  final double lat;
  final double lon;
  final String place;
  final Duration period;

  @override
  ConsumerState<WeatherForecastTile> createState() =>
      _WeatherForecastTileState();
}

class _WeatherForecastTileState extends ConsumerState<WeatherForecastTile> {
  static const constraints = BoxConstraints(
    minWidth: 270,
    minHeight: 180,
  );

  static const hours = [3, 6, 12, 24];

  final nf = NumberFormat("00");

  int _selected = -1;

  @override
  Widget build(BuildContext context) {
    final service = ref.read(weatherServiceProvider);
    return StreamBuilder<Weather>(
      initialData: service
          .getCachedForecast(
            widget.lat,
            widget.lon,
          )
          .orElseNull,
      stream: service.getForecastAsStream(
        widget.lat,
        widget.lon,
        widget.period,
      ),
      builder: (context, snapshot) {
        final now = DateTime.now();
        final weather = snapshot.data?.select(now);
        final details = _selected == -1
            ? weather
            : snapshot.data?.select(now.add(
                Duration(hours: hours[_selected]),
              ));
        if (details == null) {
          return _buildTile(
              title: 'Weather Forecast',
              value: _toTemperature(),
              subtitle: widget.place,
              body: const Center(
                child: CircularProgressIndicator(
                  color: Colors.lightGreen,
                ),
              ));
        }
        final steps = List.generate(
          hours.length,
          (index) => snapshot.data?.select(now.add(
            Duration(hours: hours[index]),
          )),
        );
        return _buildTile(
          title: 'Weather Forecast '
              '${_selected < 0 ? 'Now' : '+${hours[_selected]}h'}',
          subtitle: '${widget.place} @ '
              '${nf.format(details.time.toLocal().hour)}:00 '
              '${details.time.toLocal().day == now.day ? 'today' : 'tomorrow'}',
          value: _toTemperature(_selected < 0
              ? details.data.instant
              : steps[_selected]?.data.instant),
          body: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 800),
                  child: WeatherInstantWidget(
                    withSymbol: true,
                    withWind: true,
                    withPrecipitation: true,
                    withLightLuminance: false,
                    withRelativeHumidity: false,
                    withCloudAreaFraction: true,
                    withUltravioletRadiation: false,
                    isForecast: true,
                    weather: snapshot.data!,
                    index: _selected < 0 ? 0 : hours[_selected],
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: SelectableRowWidget(
                  selected: _selected,
                  length: hours.length,
                  builder: (_, index) => WeatherBoxWidget(
                    hours: hours[index],
                    step: steps[index],
                  ),
                  onSelected: (index) => setState(() {
                    _selected = _selected == index ? -1 : index;
                    debugPrint(_selected.toString());
                  }),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  String _toTemperature([WeatherInstant? data]) {
    return data?.details.airTemperature?.toTemperature(1) ?? '- °C';
  }

  SmartDashTile _buildTile({
    required String title,
    required String subtitle,
    required String value,
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
        value,
        style: const TextStyle(
          color: Colors.lightGreen,
          fontWeight: FontWeight.bold,
        ),
        textScaler: const TextScaler.linear(1.2),
      ),
      body: body,
    );
  }
}
