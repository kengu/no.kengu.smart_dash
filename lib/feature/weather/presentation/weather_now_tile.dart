import 'dart:math' as math;
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:optional/optional.dart';
import 'package:smart_dash/core/presentation/theme/smart_dash_theme_data.dart';
import 'package:smart_dash/core/presentation/widget/tile/smart_dash_tile.dart';
import 'package:smart_dash/feature/device/domain/device.dart';
import 'package:smart_dash/feature/weather/application/weather_service.dart';
import 'package:smart_dash/feature/weather/domain/weather.dart';
import 'package:smart_dash/feature/weather/presentation/weather.dart';
import 'package:smart_dash/util/data/num.dart';
import 'package:smart_dash/util/data/units.dart';
import 'package:smart_dash/util/widget.dart';

class WeatherNowTile<T extends num> extends ConsumerStatefulWidget {
  const WeatherNowTile({
    super.key,
    required this.place,
    required this.device,
    this.period = const Duration(seconds: 10),
  });

  final String place;
  final Duration period;
  final Optional<Identity> device;

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

  @override
  Widget build(BuildContext context) {
    if (!widget.device.isPresent) {
      return _buildEmptyTile();
    }
    final service = ref.watch(weatherServiceProvider);
    return StreamBuilder<Weather>(
      initialData: service.getCachedNow(widget.device.value).orElseNull,
      stream: service.getNowAsStream(widget.device.value, widget.period),
      builder: (context, snapshot) {
        final now = DateTime.now();
        final data = snapshot.data;
        final weather = selectWeatherTimeStep(data, now);
        final details = _selected == 0
            ? weather
            : selectWeatherTimeStep(data, now.add(Duration(hours: _selected)));
        if (details == null) {
          return _buildEmptyTile();
        }
        final index = data!.props.timeseries.indexOf(details);
        return SmartDashTile(
          title: 'Weather '
              '${_selected == 0 ? 'Now' : '+${_selected}h'}',
          // TODO: Make location configurable
          subTitle: '${widget.place} @ '
              '${nf.format(details.time.toLocal().hour)}:'
              '${nf.format(details.time.toLocal().minute)}'
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
                  child: WeatherInstantWidget(
                    index: index,
                    weather: data,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: SelectableNowWidget(
                  now: now,
                  weather: data,
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

  SmartDashTile _buildEmptyTile() {
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

  String _toTemperature([WeatherInstant? data]) {
    return data?.details.airTemperature?.toTemperature(1) ?? '- °C';
  }
}

class SelectableNowWidget extends StatelessWidget {
  const SelectableNowWidget({
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
                WeatherNowWidget(
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

class WeatherInstantWidget extends StatelessWidget {
  const WeatherInstantWidget({
    super.key,
    required this.index,
    required this.weather,
  });

  final int index;
  final Weather weather;

  @override
  Widget build(BuildContext context) {
    final step = weather.props.timeseries[index];
    final instant = step.data.instant;
    final airTemp = (instant.details.airTemperature ?? 0);
    final surfaceColor = Theme.of(context).navigationRailTheme.backgroundColor!;
    final legendColor = surfaceColor.lighten(0.2);
    final textStyle = getLegendTextStyle(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        toWeatherSymbol(step, 120),
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
                  instant.details.windSpeed!.toStringAsFixed(1),
                ),
                if (instant.details.windSpeedOfGust != null)
                  Text(
                    ' (${instant.details.windSpeedOfGust!.toStringAsFixed(1)})',
                    style: textStyle,
                  ),
                Text(
                  ' ${weather.props.meta.units.windSpeed}',
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
            const SizedBox(height: 8),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  airTemp > 0 ? CupertinoIcons.drop : Icons.snowing,
                  color: legendColor,
                ),
                const SizedBox(width: 8),
                Text(
                  _toPrecipitationAmount(),
                ),
                Text(
                  '${airTemp > 0 ? ' mm rain' : ' cm snow'} next ${index > 1 ? index : 24}h',
                  style: textStyle,
                )
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
                  ' ${weather.props.meta.units.cloudAreaFraction} clouds',
                  style: textStyle,
                )
              ],
            ),
          ],
        ),
      ],
    );
  }

  String _toPrecipitationAmount() {
    final hours = index <= 1 ? 24 : index;
    final steps = weather.props.timeseries
        .take(hours)
        .map((e) => e.data.next1h?.details)
        .whereType<WeatherForecastDetails>()
        .where((e) => (e.precipitationAmount ?? 0) > 0)
        .map(
      (e) {
        final amountInMm = e.precipitationAmount ?? 0.0;
        final hasMinTemp = e.airTemperatureMin != null;
        final hasMaxTemp = e.airTemperatureMax != null;
        final minTemp = hasMinTemp ? e.airTemperatureMin! : 0.0;
        final maxTemp = hasMaxTemp ? e.airTemperatureMax! : 0.0;
        final temp = hasMinTemp && hasMinTemp
            ? min(minTemp, maxTemp)
            : min(minTemp, maxTemp);
        return amountInMm *
            (temp > 0 ? 1 : _calcSnowRatioInInches(temp) * 0.254);
      },
    );

    // Sum over next 24 from index
    return steps.sum().toStringAsFixed(1);
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

class WeatherNowWidget extends StatelessWidget {
  const WeatherNowWidget(
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
    final forecast = selectWeatherTimeStep(weather, when, false);
    final actual = forecast?.time.difference(now).inHours ?? hours;
    final symbol =
        forecast == null ? const Text('-') : toWeatherSymbol(forecast, 32);
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
