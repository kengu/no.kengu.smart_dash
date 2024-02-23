import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:smart_dash/core/presentation/widget/tile/smart_dash_tile.dart';
import 'package:smart_dash/feature/weather/application/weather_service.dart';
import 'package:smart_dash/feature/weather/domain/weather.dart';
import 'package:smart_dash/util/data/units.dart';

import 'weather.dart';
import 'weather_forecast_widget.dart';
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

  int _selected = 0;
  final nf = NumberFormat("00");

  @override
  Widget build(BuildContext context) {
    final service = ref.watch(weatherServiceProvider);
    return FutureBuilder<Weather>(
      future: service.getForecast(widget.lat, widget.lon, widget.period),
      initialData: service.getCachedForecast(widget.lat, widget.lon).orElseNull,
      builder: (context, snapshot) {
        final now = DateTime.now();
        final weather = selectWeatherTimeStep(snapshot.data, now);
        final details = _selected == 0
            ? weather
            : selectWeatherTimeStep(
                snapshot.data,
                now.add(Duration(hours: _selected)),
              );
        if (details == null) {
          return SmartDashTile(
            title: 'Weather Forecast',
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
        final index = snapshot.data!.props.timeseries.indexOf(details);
        return SmartDashTile(
          title: 'Weather Forecast '
              '${_selected == 0 ? 'Now' : '+${_selected}h'}',
          // TODO: Make location configurable
          subTitle: '${widget.place} @ '
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
                  child: WeatherInstantWidget(
                    index: index,
                    weather: snapshot.data!,
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
    return data?.details.airTemperature?.toTemperature(1) ?? '- °C';
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
