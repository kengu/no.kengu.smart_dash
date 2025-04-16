import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_dash_energy/smart_dash_energy.dart';

part 'electricity_price_response.freezed.dart';
part 'electricity_price_response.g.dart';

@freezed
sealed class ElectricityPriceResponse with _$ElectricityPriceResponse {
  const factory ElectricityPriceResponse({
    @JsonKey(name: 'data') required List<ElectricityPrice> prices,
  }) = _ElectricityPriceResponse;

  factory ElectricityPriceResponse.fromJson(Map<String, Object?> json) =>
      _$ElectricityPriceResponseFromJson(json);
}
