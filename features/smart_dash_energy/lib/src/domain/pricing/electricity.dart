import 'package:freezed_annotation/freezed_annotation.dart';

part 'electricity.freezed.dart';
part 'electricity.g.dart';

@freezed
sealed class ElectricityPrice with _$ElectricityPrice {
  const ElectricityPrice._();
  const factory ElectricityPrice({
    @JsonKey(name: 'NOK_per_kWh') required double nokPerKwh,
    @JsonKey(name: 'EUR_per_kWh') required double eurPerKwh,
    @JsonKey(name: 'EXR') required double eurToNokRate,
    @JsonKey(name: 'time_start') required DateTime begin,
    @JsonKey(name: 'time_end') required DateTime end,
  }) = _ElectricityPrice;

  double get nokToEurRate => 1 / eurToNokRate;

  int get hours => end.difference(begin).inHours;

  int get minutes => end.difference(begin).inMinutes;

  factory ElectricityPrice.fromJson(Map<String, Object?> json) =>
      _$ElectricityPriceFromJson(json);
}

@freezed
sealed class ElectricityTariff with _$ElectricityTariff {
  const ElectricityTariff._();
  const factory ElectricityTariff({
    required String provider,
    required DateTime validUntil,
    required List<ElectricityCapacity> capacity,
    required List<ElectricityConsumption> consumption,
  }) = _ElectricityTariff;

  factory ElectricityTariff.fromJson(Map<String, Object?> json) =>
      _$ElectricityTariffFromJson(json);
}

@freezed
sealed class ElectricityCapacity with _$ElectricityCapacity {
  const ElectricityCapacity._();
  const factory ElectricityCapacity({
    @JsonKey(name: 'from_kWh') required double fromKWh,
    @JsonKey(name: 'to_kWh') required double toKWh,
    @JsonKey(name: 'NOK_per_month') required double nokPerMonth,
  }) = _ElectricityCapacity;

  factory ElectricityCapacity.fromJson(Map<String, Object?> json) =>
      _$ElectricityCapacityFromJson(json);
}

@freezed
sealed class ElectricityConsumption with _$ElectricityConsumption {
  const ElectricityConsumption._();
  const factory ElectricityConsumption({
    @JsonKey(name: 'NOK_per_kWh') required double nokPerKwh,
    @JsonKey(name: 'from_hour') required int fromHour,
    @JsonKey(name: 'to_hour') required int toHour,
  }) = _ElectricityConsumption;

  bool isWithin(int hour) => hour >= fromHour && hour < toHour;

  factory ElectricityConsumption.fromJson(Map<String, Object?> json) =>
      _$ElectricityConsumptionFromJson(json);
}
