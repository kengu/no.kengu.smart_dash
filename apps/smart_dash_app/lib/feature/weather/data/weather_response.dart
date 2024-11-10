import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_dash_app/feature/weather/domain/weather.dart';

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

  bool get isExpired => expires.difference(DateTime.now()).isNegative;

  factory WeatherResponse.fromJson(Map<String, Object?> json) =>
      _$WeatherResponseFromJson(json);
}
