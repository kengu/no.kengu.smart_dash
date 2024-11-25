// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LocationImpl _$$LocationImplFromJson(Map<String, dynamic> json) =>
    _$LocationImpl(
      service: json['service'] as String?,
      lon: (json['lon'] as num).toDouble(),
      lat: (json['lat'] as num).toDouble(),
      name: json['name'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      street: json['street'] as String?,
      municipality: json['municipality'] as String?,
      county: json['county'] as String?,
      country: json['country'] as String?,
      postalCode: json['postalCode'] as String?,
      data: json['data'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$LocationImplToJson(_$LocationImpl instance) =>
    <String, dynamic>{
      'service': instance.service,
      'lon': instance.lon,
      'lat': instance.lat,
      'name': instance.name,
      'city': instance.city,
      'state': instance.state,
      'street': instance.street,
      'municipality': instance.municipality,
      'county': instance.county,
      'country': instance.country,
      'postalCode': instance.postalCode,
      'data': instance.data,
    };

_$PointGeometryImpl _$$PointGeometryImplFromJson(Map<String, dynamic> json) =>
    _$PointGeometryImpl(
      coords: (json['coordinates'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$$PointGeometryImplToJson(_$PointGeometryImpl instance) =>
    <String, dynamic>{
      'coordinates': instance.coords,
    };
