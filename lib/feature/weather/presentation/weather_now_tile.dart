import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_dash/feature/weather/application/weather_service.dart';
import 'package:smart_dash/feature/weather/domain/weather.dart';
import 'package:smart_dash/scaffold/presentation/app/smart_dash_app_theme_data.dart';
import 'package:smart_dash/util/widget.dart';
import 'package:smart_dash/widget/tile/smart_dash_tile.dart';

class WeatherNowTile<T extends num> extends ConsumerWidget {
  const WeatherNowTile({
    super.key,
    required this.lat,
    required this.lon,
  });

  final double lat;
  final double lon;

  static const constraints = BoxConstraints(
    minWidth: 270,
    minHeight: 180,
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final surfaceColor = Theme.of(context).navigationRailTheme.backgroundColor!;
    final legendColor = surfaceColor.lighten(0.2);
    final textStyle = getLegendTextStyle(context);
    final service = ref.watch(weatherServiceProvider);
    return FutureBuilder<Weather>(
      future: service.getWeather(lat, lon),
      builder: (context, snapshot) {
        final now = DateTime.now();
        final weather = _select(snapshot.data, now);
        if (weather == null) {
          return SmartDashTile(
            title: 'Weather Now',
            // TODO: Make location configurable
            subTitle: 'Tindefjell',
            constraints: constraints,
            leading: const Icon(
              Icons.wb_sunny,
              color: Colors.lightGreen,
            ),
            trailing: Text(
              _toTemperature(weather?.data.instant),
              style: const TextStyle(
                color: Colors.lightGreen,
                fontWeight: FontWeight.bold,
              ),
              textScaler: const TextScaler.linear(1.2),
            ),
            body: const Center(
              child: CircularProgressIndicator(
                color: Colors.lightGreen,
              ),
            ),
          );
        }
        final instant = weather.data.instant;
        final meta = snapshot.data!.props.meta;
        return SmartDashTile(
          title: 'Weather Now',
          // TODO: Make location configurable
          subTitle: 'Tindefjell',
          constraints: constraints,
          leading: const Icon(
            Icons.wb_sunny,
            color: Colors.lightGreen,
          ),
          trailing: Text(
            _toTemperature(instant),
            style: const TextStyle(
              color: Colors.lightGreen,
              fontWeight: FontWeight.bold,
            ),
            textScaler: const TextScaler.linear(1.2),
          ),
          body: Column(
            children: [
              Expanded(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 800),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      _toSymbol(weather, 100),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.air, color: legendColor),
                              const SizedBox(width: 8),
                              Text(
                                '${instant.details.windSpeed!.floor()}',
                              ),
                              if (instant.details.windSpeedOfGust != null)
                                Text(
                                  ' (${instant.details.windSpeedOfGust!.floor()})',
                                  style: textStyle,
                                ),
                              Text(
                                ' ${meta.units.windSpeed}',
                                style: textStyle,
                              ),
                              const SizedBox(width: 4),
                              Transform.rotate(
                                angle: math.pi /
                                    180 *
                                    (instant.details.windFromDirection ?? 0.0),
                                child:
                                    const Icon(Icons.arrow_downward, size: 16),
                              ),
                              Text(
                                ' ${Weather.toCompassDirection(
                                  instant.details.windFromDirection,
                                )}',
                                style: textStyle,
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              RotatedBox(
                                quarterTurns: 1,
                                child: Icon(
                                  Icons.deblur,
                                  color: legendColor,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                '${instant.details.cloudAreaFraction?.round()}',
                              ),
                              Text(
                                ' ${meta.units.cloudAreaFraction} clouds',
                                style: textStyle,
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  children: [
                    const Spacer(),
                    _buildForecast(
                      snapshot.data,
                      now: now,
                      hours: 3,
                      style: textStyle,
                    ),
                    const Spacer(),
                    _buildForecast(
                      snapshot.data,
                      now: now,
                      hours: 6,
                      style: textStyle,
                    ),
                    const Spacer(),
                    _buildForecast(
                      snapshot.data,
                      now: now,
                      hours: 12,
                      style: textStyle,
                    ),
                    const Spacer(),
                    _buildForecast(
                      snapshot.data,
                      now: now,
                      hours: 24,
                      style: textStyle,
                    ),
                    const Spacer(),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Widget _buildForecast(
    Weather? weather, {
    required DateTime now,
    required int hours,
    required TextStyle style,
  }) {
    final when = now.add(Duration(hours: hours));
    final forecast = _select(weather, when, false);
    final actual = forecast?.time.difference(now).inHours ?? hours;
    final symbol = forecast == null ? const Text('-') : _toSymbol(forecast, 32);
    return Column(
      children: [
        symbol,
        Text('${actual}h', style: style),
      ],
    );
  }

  WeatherTimeStep? _select(Weather? weather,
      [DateTime? now, bool closest = true]) {
    WeatherTimeStep? step;
    if (weather != null) {
      final it = weather.props.timeseries.iterator;
      if (it.moveNext()) {
        step = it.current;
        var looking = true;
        now ??= DateTime.now().toUtc();
        var delta = step.time.difference(now);
        while (looking && it.moveNext()) {
          if (closest) {
            final next = it.current.time.difference(now).abs();
            delta = delta.abs();
            if (next < delta) {
              step = it.current;
              delta = next;
            }
            looking = delta.inMinutes >= 60;
          } else {
            if (looking = now.difference(step!.time).inMinutes > 0) {
              step = it.current;
            }
          }
        }
      }
    }
    return step;
  }

  String _toTemperature(WeatherInstant? data) {
    return '${data?.details.airTemperature ?? '-'} °C';
  }

  Image _toSymbol(WeatherTimeStep step, double size) {
    final code = step.data.next1h?.summary.symbolCode ?? '';
    return Image.asset(
      'assets/images/weather/$code.png',
      width: size,
    );
  }
  /*
  TimeSeries _prices(AsyncSnapshot<List<ElectricityPrice>> snapshot) {
    final prices = snapshot.hasData
        ? DataArray(
            [snapshot.data!.map((e) => e.nokPerKwh).toList()],
            coords: List.generate(
              snapshot.data!.length,
              (index) => {'hour': index},
            ),
            dims: [{}],
          )
        : DataArray.size(1, [{}]);
    return TimeSeries(
      name: 'price',
      array: prices,
      offset: when,
      span: TimeScale.hours.to(),
    );
  }

   */
}
