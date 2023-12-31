import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_dash/feature/weather/domain/weather.dart';

part 'weather_response.freezed.dart';
part 'weather_response.g.dart';

@freezed
class WeatherResponse with _$WeatherResponse {
  const WeatherResponse._();
  const factory WeatherResponse({
    @JsonKey(name: 'data') required Weather data,
    @JsonKey(name: 'expires') required DateTime expires,
    @JsonKey(name: 'last_modified') required DateTime lastModified,
  }) = _WeatherResponse;

  bool get isExpired => DateTime.now().difference(expires).isNegative;
  bool get isOutdated => isExpired || isPassedFirstInstant(DateTime.now(), 60);
  bool isPassedFirstInstant(DateTime when, int minutes) =>
      data.props.timeseries.isNotEmpty &&
      data.props.timeseries.first.time.difference(when).inMinutes < -minutes;

  factory WeatherResponse.fromJson(Map<String, Object?> json) =>
      _$WeatherResponseFromJson(json);
}
