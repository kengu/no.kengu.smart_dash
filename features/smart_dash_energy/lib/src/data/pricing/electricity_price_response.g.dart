// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'electricity_price_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ElectricityPriceResponse _$ElectricityPriceResponseFromJson(
        Map<String, dynamic> json) =>
    _ElectricityPriceResponse(
      prices: (json['data'] as List<dynamic>)
          .map((e) => ElectricityPrice.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ElectricityPriceResponseToJson(
        _ElectricityPriceResponse instance) =>
    <String, dynamic>{
      'data': instance.prices.map((e) => e.toJson()).toList(),
    };
