import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:optional/optional.dart';
import 'package:smart_dash/feature/weather/application/weather_service.dart';
import 'package:smart_dash/feature/weather/domain/weather.dart';
import 'package:smart_dash/scaffold/presentation/app/smart_dash_app_theme_data.dart';
import 'package:smart_dash/util/widget.dart';
import 'package:smart_dash/widget/tile/smart_dash_tile.dart';

class WeatherNowTile<T extends num> extends ConsumerStatefulWidget {
  const WeatherNowTile({
    super.key,
    required this.lat,
    required this.lon,
    required this.place,
  });

  final double lat;
  final double lon;
  final String place;

  @override
  ConsumerState<WeatherNowTile> createState() => _WeatherNowTileState();
}

class _WeatherNowTileState extends ConsumerState<WeatherNowTile> {
  static const constraints = BoxConstraints(
    minWidth: 270,
    minHeight: 180,
  );

  int _selected = 0;
  final nf = NumberFormat("00");
  Optional<(DateTime, Future<Weather>)> _request = const Optional.empty();

  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  Future<Weather> _fetchWeather() {
    if (_request.isEmpty ||
        DateTime.now().difference(_request.value.$1).inMinutes > 5) {
      final service = ref.read(weatherServiceProvider);
      _request = Optional.of(
        (
          DateTime.now(),
          service.getWeather(widget.lat, widget.lon),
        ),
      );
    }
    return _request.value.$2;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Weather>(
      future: _fetchWeather(),
      builder: (context, snapshot) {
        final now = DateTime.now();
        final weather = _select(snapshot.data, now);
        final details = _selected == 0
            ? weather
            : _select(snapshot.data, now.add(Duration(hours: _selected)));
        if (details == null) {
          return SmartDashTile(
            title: 'Weather Now',
            subTitle: widget.place,
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
            body: const Center(
              child: CircularProgressIndicator(
                color: Colors.lightGreen,
              ),
            ),
          );
        }
        return SmartDashTile(
          title: 'Weather ${_selected == 0 ? 'Now' : '+${_selected}h'}',
          // TODO: Make location configurable
//          subTitle: 'Tindefjell @ ${details.time}',
          subTitle: 'Tindefjell @ '
              '${nf.format(details.time.toLocal().hour)}:00'
              ' ${details.time.toLocal().day == now.day ? 'today' : 'tomorrow'}',
          constraints: constraints,
          leading: const Icon(
            Icons.wb_sunny,
            color: Colors.lightGreen,
          ),
          trailing: Text(
            _toTemperature(details.data.instant),
            style: const TextStyle(
              color: Colors.lightGreen,
              fontWeight: FontWeight.bold,
            ),
            textScaler: const TextScaler.linear(1.2),
          ),
          body: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 800),
                  child: WeatherInstanceWidget(
                    weather: details,
                    meta: snapshot.data!.props.meta,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: SelectableForecastWidget(
                  now: now,
                  weather: snapshot.data,
                  selected: _selected,
                  onSelected: (index) => setState(() {
                    _selected = _selected == index ? 0 : index;
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
    return '${data?.details.airTemperature ?? '-'} °C';
  }
}

class SelectableForecastWidget extends StatelessWidget {
  const SelectableForecastWidget({
    super.key,
    required this.now,
    this.selected = 0,
    required this.onSelected,
    this.weather,
  });

  final DateTime now;
  final Weather? weather;
  final int selected;

  final void Function(int index) onSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [3, 6, 12, 24]
          .map((hours) => SelectableBoxWidget(
                WeatherForecastWidget(
                  weather,
                  now: now,
                  hours: hours,
                ),
                index: hours,
                onSelected: onSelected,
                isSelected: selected == hours,
              ))
          .toList(),
    );
  }
}

class SelectableBoxWidget extends StatelessWidget {
  const SelectableBoxWidget(
    this.child, {
    super.key,
    required this.index,
    required this.onSelected,
    this.isSelected = false,
  });

  final int index;
  final Widget child;
  final bool isSelected;

  final void Function(int index) onSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onSelected(index);
      },
      child: isSelected
          ? ConstrainedBox(
              constraints: BoxConstraints.tight(
                const Size.square(50),
              ),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.lightGreen,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                child: child,
              ),
            )
          : ConstrainedBox(
              constraints: BoxConstraints.tight(
                const Size.square(50),
              ),
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: child,
              ),
            ),
    );
  }
}

class WeatherInstanceWidget extends StatelessWidget {
  const WeatherInstanceWidget({
    super.key,
    required this.weather,
    required this.meta,
  });

  final WeatherTimeStep weather;
  final WeatherMeta meta;

  @override
  Widget build(BuildContext context) {
    final next4h = weather.data.next1h;
    final instant = weather.data.instant;
    final airTemp = (instant.details.airTemperature ?? 0);
    final surfaceColor = Theme.of(context).navigationRailTheme.backgroundColor!;
    final legendColor = surfaceColor.lighten(0.2);
    final textStyle = getLegendTextStyle(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _toSymbol(weather, 120),
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
                  child: const Icon(Icons.arrow_downward, size: 16),
                ),
                Text(
                  ' ${Weather.toCompassDirection(
                    instant.details.windFromDirection,
                  )}',
                  style: textStyle,
                ),
              ],
            ),
            if (next4h != null) ...[
              const SizedBox(height: 8),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.snowing,
                    color: legendColor,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    _toPrecipitationAmount(next4h, airTemp),
                  ),
                  Text(
                    airTemp > 0 ? ' mm rain' : ' cm snow',
                    style: textStyle,
                  )
                ],
              ),
            ],
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
    );
  }

  String _toPrecipitationAmount(WeatherForecast next4h, double temp) {
    if (temp > 0) {
      return '${next4h.details.precipitationAmount?.toStringAsFixed(1)}';
    }

    final amountInMm = next4h.details.precipitationAmount ?? 0;
    final ratioInCm = _calcSnowRatioInInches(temp) * 2.54 / 10;
    return (amountInMm * ratioInCm).toStringAsFixed(0);
  }

  // From https://goodcalculators.com/rain-to-snow-calculator/
  double _calcSnowRatioInInches(double temp) {
    // 1 to -2
    if (temp <= 1 && temp > -3) {
      return 10;
    }
    // -3 to -7
    else if (temp <= -3 && temp > -8) {
      return 15;
    }
    // -7 to -9
    else if (temp <= -7 && temp > -10) {
      return 20;
    }
    // -10 to -12
    else if (temp <= -10 && temp > -13) {
      return 30;
    }
    // -13 to -18
    else if (temp <= -13 && temp > -19) {
      return 40;
    }
    // -18 to -29
    else if (temp <= -18 && temp > -30) {
      return 50;
    }
    // <-29
    return 100;
  }
}

Image _toSymbol(WeatherTimeStep step, double size) {
  final code = step.data.next1h?.summary.symbolCode ?? '';
  return Image.asset(
    'assets/images/weather/$code.png',
    width: size,
    cacheWidth: size.toInt(),
  );
}

class WeatherForecastWidget extends StatelessWidget {
  const WeatherForecastWidget(
    this.weather, {
    super.key,
    required this.now,
    required this.hours,
  });

  final DateTime now;
  final int hours;
  final Weather? weather;

  @override
  Widget build(BuildContext context) {
    final when = now.add(Duration(hours: hours));
    final forecast = _select(weather, when, false);
    final actual = forecast?.time.difference(now).inHours ?? hours;
    final symbol = forecast == null ? const Text('-') : _toSymbol(forecast, 32);
    return Column(
      children: [
        symbol,
        Text(
          '${actual}h',
          style: getLegendTextStyle(context),
        ),
      ],
    );
  }
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
