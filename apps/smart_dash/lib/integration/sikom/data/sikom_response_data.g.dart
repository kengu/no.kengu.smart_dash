// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sikom_response_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SikomResponseDataImpl _$$SikomResponseDataImplFromJson(
        Map<String, dynamic> json) =>
    _$SikomResponseDataImpl(
      bpapiStatus: json['bpapi_status'] as String,
      bpapiMessage: json['bpapi_message'] as String,
      bpapiArray: (json['bpapi_array'] as List<dynamic>?)
          ?.map((e) =>
              SikomResponseDataArrayObject.fromJson(e as Map<String, dynamic>))
          .toList(),
      result:
          (json['result'] as List<dynamic>?)?.map((e) => e as Object).toList(),
      scalarResult: json['scalar_result'],
      device: json['device'] == null
          ? null
          : SikomDevice.fromJson(json['device'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SikomResponseDataImplToJson(
        _$SikomResponseDataImpl instance) =>
    <String, dynamic>{
      'bpapi_status': instance.bpapiStatus,
      'bpapi_message': instance.bpapiMessage,
      'bpapi_array': instance.bpapiArray?.map((e) => e.toJson()).toList(),
      'result': instance.result,
      'scalar_result': instance.scalarResult,
      'device': instance.device?.toJson(),
    };

_$SikomResponseDataArrayObjectImpl _$$SikomResponseDataArrayObjectImplFromJson(
        Map<String, dynamic> json) =>
    _$SikomResponseDataArrayObjectImpl(
      gateway: json['gateway'] == null
          ? null
          : SikomGateway.fromJson(json['gateway'] as Map<String, dynamic>),
      device: json['device'] == null
          ? null
          : SikomDevice.fromJson(json['device'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SikomResponseDataArrayObjectImplToJson(
        _$SikomResponseDataArrayObjectImpl instance) =>
    <String, dynamic>{
      'gateway': instance.gateway?.toJson(),
      'device': instance.device?.toJson(),
    };
