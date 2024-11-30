import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:smart_dash_account/smart_dash_account.dart';
import 'package:smart_dash_analytics/smart_dash_analytics.dart';
import 'package:smart_dash_app/core/presentation/widget/selectable_row_widget.dart';
import 'package:smart_dash_app/core/presentation/widget/tile/smart_dash_tile.dart';
import 'package:smart_dash_weather/smart_dash_weather.dart';

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
    final service = ref.watch(weatherServiceProvider);
    return StreamBuilder<WeatherState>(
      initialData: service
          .getForecastCached(PointGeometry.from(
            widget.lon,
            widget.lat,
          ))
          .orElseNull,
      stream: service.getForecastAsStream(
        PointGeometry.from(
          widget.lon,
          widget.lat,
        ),
        refresh: true,
        period: widget.period,
      ),
      builder: (context, snapshot) {
        final now = DateTime.now();
        final weather = snapshot.data?.select(now, true);
        final details = _selected == -1
            ? weather
            : snapshot.data?.select(now.add(
                Duration(hours: hours[_selected]),
              ));
        if (details == null) {
          return _buildEmptyTile();
        }
        final steps = List.generate(
          hours.length,
          (index) => snapshot.data?.select(now.add(
            Duration(hours: hours[index]),
          )),
        );

        // Get offset from first element in series
        final first = snapshot.data?.select(now);
        final offset =
            snapshot.data?.props.timeseries.indexWhere((e) => e == first) ?? 0;
        return _buildTile(
          title: 'Weather Forecast '
              '${_selected < 0 ? 'Now' : '+${hours[_selected]}h'}',
          subtitle: '${widget.place} @ '
              '${nf.format(details.time.toLocal().hour)}:00 '
              '${details.time.toLocal().day == now.day ? 'today' : 'tomorrow'}',
          value: _toTemperature(_selected < 0
              ? details.data.instant
              : steps[_selected]?.data.instant),
          when: details.time,
          body: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 800),
                  child: WeatherInstantWidget(
                    offset: offset,
                    withWind: true,
                    withSymbol: true,
                    isForecast: true,
                    weather: snapshot.data!,
                    withPrecipitation: true,
                    withLightLuminance: false,
                    withRelativeHumidity: false,
                    withCloudAreaFraction: true,
                    withUltravioletRadiation: false,
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
                  }),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  SmartDashTile _buildEmptyTile() {
    return _buildTile(
      title: 'Weather Forecast',
      value: _toTemperature(),
      subtitle: widget.place,
      when: DateTime.now(),
      body: const Center(
        child: CircularProgressIndicator(
          color: Colors.lightGreen,
        ),
      ),
    );
  }

  String _toTemperature([WeatherInstant? data]) {
    return data?.details.airTemperature?.toTemperature(1) ?? '- °C';
  }

  SmartDashTile _buildTile({
    required String title,
    required String subtitle,
    required String value,
    required DateTime when,
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
      trailing: Tooltip(
        message: when.format(),
        child: Text(
          value,
          style: const TextStyle(
            color: Colors.lightGreen,
            fontWeight: FontWeight.bold,
          ),
          textScaler: const TextScaler.linear(1.2),
        ),
      ),
      body: body,
    );
  }
}
