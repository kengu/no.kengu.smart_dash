// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'electricity_price_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ElectricityPriceResponseImpl _$$ElectricityPriceResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ElectricityPriceResponseImpl(
      prices: (json['data'] as List<dynamic>)
          .map((e) => ElectricityPrice.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ElectricityPriceResponseImplToJson(
        _$ElectricityPriceResponseImpl instance) =>
    <String, dynamic>{
      'data': instance.prices.map((e) => e.toJson()).toList(),
    };
