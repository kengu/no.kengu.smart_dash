// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_array.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DataArray _$DataArrayFromJson(Map<String, dynamic> json) => _DataArray(
      (json['data'] as List<dynamic>)
          .map((e) => (e as List<dynamic>).map((e) => e as num).toList())
          .toList(),
      coords: (json['coords'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      dims: (json['dims'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$DataArrayToJson(_DataArray instance) =>
    <String, dynamic>{
      'data': instance.data,
      'coords': instance.coords,
      'dims': instance.dims,
    };
