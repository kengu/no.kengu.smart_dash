// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nysny_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NySnyResponse _$NySnyResponseFromJson(Map<String, dynamic> json) =>
    _NySnyResponse(
      requestedBy: json['requestedby'] as String,
      information: json['information'] as String,
      sensors: (json['sensors'] as List<dynamic>)
          .map((e) => NySnySensor.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NySnyResponseToJson(_NySnyResponse instance) =>
    <String, dynamic>{
      'requestedby': instance.requestedBy,
      'information': instance.information,
      'sensors': instance.sensors.map((e) => e.toJson()).toList(),
    };
