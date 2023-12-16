import 'package:freezed_annotation/freezed_annotation.dart';

part 'electricity_price.freezed.dart';
part 'electricity_price.g.dart';

@freezed
class ElectricityPrice with _$ElectricityPrice {
  const ElectricityPrice._();
  const factory ElectricityPrice({
    @JsonKey(name: 'NOK_per_kWh') required double nokPerKwh,
    @JsonKey(name: 'EUR_per_kWh') required double eurPerKwh,
    @JsonKey(name: 'EXR') required double eurToNokRate,
    @JsonKey(name: 'time_start') required DateTime begin,
    @JsonKey(name: 'time_end') required DateTime end,
  }) = _ElectricityPrice;

  int get hours => end.difference(begin).inHours;
  int get minutes => end.difference(begin).inMinutes;

  factory ElectricityPrice.fromJson(Map<String, Object?> json) =>
      _$ElectricityPriceFromJson(json);
}
