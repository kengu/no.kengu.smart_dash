// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_series.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TimeSeriesImpl _$$TimeSeriesImplFromJson(Map<String, dynamic> json) =>
    _$TimeSeriesImpl(
      name: json['name'] as String,
      array: DataArray.fromJson(json['array'] as Map<String, dynamic>),
      offset: DateTime.parse(json['offset'] as String),
      span: Duration(microseconds: (json['span'] as num).toInt()),
    );

Map<String, dynamic> _$$TimeSeriesImplToJson(_$TimeSeriesImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'array': instance.array.toJson(),
      'offset': instance.offset.toIso8601String(),
      'span': instance.span.inMicroseconds,
    };
