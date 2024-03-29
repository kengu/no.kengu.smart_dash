import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_dash/core/presentation/theme/smart_dash_theme_data.dart';
import 'package:smart_dash/feature/weather/domain/weather.dart';
import 'package:smart_dash/util/data/units.dart';
import 'package:smart_dash/util/widget.dart';

import 'weather.dart';

class WeatherInstantWidget extends StatelessWidget {
  const WeatherInstantWidget({
    super.key,
    this.offset = 0,
    required this.index,
    required this.weather,
    required this.withWind,
    required this.withSymbol,
    required this.isForecast,
    required this.withPrecipitation,
    required this.withLightLuminance,
    required this.withRelativeHumidity,
    required this.withCloudAreaFraction,
    required this.withUltravioletRadiation,
  });

  final int index;
  final int offset;
  final Weather weather;
  final bool isForecast;
  final bool withWind;
  final bool withSymbol;
  final bool withPrecipitation;
  final bool withLightLuminance;
  final bool withRelativeHumidity;
  final bool withCloudAreaFraction;
  final bool withUltravioletRadiation;

  @override
  Widget build(BuildContext context) {
    final step = weather.props.timeseries[index];
    final instant = step.data.instant;
    final airTemp = (instant.details.airTemperature ?? 0);
    final surfaceColor = Theme.of(context).navigationRailTheme.backgroundColor!;
    final legendColor = surfaceColor.lighten(0.2);
    final textStyle = getLegendTextStyle(context);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (withSymbol) toWeatherSymbol(step, 110),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (withWind) ...[
                _buildWind(instant, legendColor, textStyle),
                const SizedBox(height: 8),
              ],
              if (withPrecipitation) ...[
                _buildPrecipitation(airTemp, legendColor, textStyle),
                const SizedBox(height: 8),
              ],
              if (withCloudAreaFraction) ...[
                _buildCloudAreaFraction(instant, legendColor, textStyle),
                const SizedBox(height: 8),
              ],
              if (withRelativeHumidity) ...[
                _buildRelativeHumidity(instant, legendColor, textStyle),
                const SizedBox(height: 8),
              ],
              if (withUltravioletRadiation) ...[
                _buildUltravioletRadiation(instant, legendColor, textStyle),
                const SizedBox(height: 8),
              ],
              if (withLightLuminance) ...[
                _buildLightLuminance(instant, legendColor, textStyle),
                const SizedBox(height: 8),
              ],
            ],
          ),
        ],
      ),
    );
  }

  Row _buildWind(
    WeatherInstant instant,
    Color legendColor,
    TextStyle textStyle,
  ) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.air, color: legendColor),
        const SizedBox(width: 8),
        Text(
          '${instant.details.windSpeed?.floor() ?? 0}',
        ),
        if (instant.details.windSpeedOfGust != null)
          Text(
            ' (${instant.details.windSpeedOfGust!.floor()})',
            style: textStyle,
          ),
        Text(
          ' ${weather.props.meta.units.windSpeed}',
          style: textStyle,
        ),
        const SizedBox(width: 4),
        Transform.rotate(
          angle: pi / 180 * (instant.details.windFromDirection ?? 0.0),
          child: const Icon(Icons.arrow_downward, size: 16),
        ),
        Text(
          ' ${Weather.toCompassDirection(
            instant.details.windFromDirection,
          )}',
          style: textStyle,
        ),
      ],
    );
  }

  Row _buildPrecipitation(
    double airTemp,
    Color legendColor,
    TextStyle textStyle,
  ) {
    final precipitationAmount = isForecast
        ? weather
            .toPrecipitationForecastAmount(index <= 1 ? offset + 24 : index)
        : (weather.props.timeseries[index].data.instant.details
                .precipitationAmount ??
            0.0);
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          airTemp > 0 ? CupertinoIcons.drop : Icons.snowing,
          color: legendColor,
        ),
        const SizedBox(width: 8),
        Text(
          precipitationAmount.toStringAsFixed(1),
        ),
        Text(
          [
            if (!isForecast || airTemp > 0) ' mm rain' else ' cm snow',
            if (isForecast) 'next' else 'previous',
            '${index - offset > 1 ? index - offset : 24}h'
          ].join(' '),
          style: textStyle,
          overflow: TextOverflow.fade,
        )
      ],
    );
  }

  Row _buildCloudAreaFraction(
    WeatherInstant instant,
    Color legendColor,
    TextStyle textStyle,
  ) {
    return Row(
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
        if (instant.details.cloudAreaFraction != null) ...[
          Text(
            '${instant.details.cloudAreaFraction?.round()}',
          ),
          Text(
            ' ${weather.props.meta.units.cloudAreaFraction} clouds',
            style: textStyle,
          )
        ] else
          const Text('unavailable')
      ],
    );
  }

  Row _buildLightLuminance(
    WeatherInstant instant,
    Color legendColor,
    TextStyle textStyle,
  ) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          CupertinoIcons.light_min,
          color: legendColor,
        ),
        const SizedBox(width: 8),
        if (instant.details.lightLuminance != null) ...[
          Text(
            Illuminance.of(instant.details.lightLuminance ?? 10000).description,
          ),
          Text(
            ' Luminance',
            style: textStyle,
          )
        ] else
          const Text('unavailable')
      ],
    );
  }

  Row _buildRelativeHumidity(
    WeatherInstant instant,
    Color legendColor,
    TextStyle textStyle,
  ) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          CupertinoIcons.drop,
          color: legendColor,
        ),
        const SizedBox(width: 8),
        if (instant.details.relativeHumidity != null) ...[
          Text(
            '${instant.details.relativeHumidity?.round()}',
          ),
          Text(
            ' ${weather.props.meta.units.relativeHumidity} relative humidity',
            style: textStyle,
          )
        ] else
          const Text('unavailable')
      ],
    );
  }

  Row _buildUltravioletRadiation(
    WeatherInstant instant,
    Color legendColor,
    TextStyle textStyle,
  ) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        RotatedBox(
          quarterTurns: 1,
          child: Icon(
            CupertinoIcons.radiowaves_right,
            color: legendColor,
          ),
        ),
        const SizedBox(width: 8),
        if (instant.details.ultravioletRadiation != null) ...[
          Text(
            '${instant.details.ultravioletRadiation?.round()}',
          ),
          Text(
            ' UV index',
            style: textStyle,
          )
        ] else
          const Text('unavailable')
      ],
    );
  }
}
