// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sikom_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SikomResponseImpl _$$SikomResponseImplFromJson(Map<String, dynamic> json) =>
    _$SikomResponseImpl(
      contentEncoding: json['ContentEncoding'] as String?,
      contentType: json['ContentType'] as String?,
      data: SikomResponseData.fromJson(json['Data'] as Map<String, dynamic>),
      jsonRequestBehavior: json['JsonRequestBehavior'] as int,
      maxJsonLength: json['MaxJsonLength'] as int?,
      recursionLimit: json['RecursionLimit'] as int?,
    );

Map<String, dynamic> _$$SikomResponseImplToJson(_$SikomResponseImpl instance) =>
    <String, dynamic>{
      'ContentEncoding': instance.contentEncoding,
      'ContentType': instance.contentType,
      'Data': instance.data.toJson(),
      'JsonRequestBehavior': instance.jsonRequestBehavior,
      'MaxJsonLength': instance.maxJsonLength,
      'RecursionLimit': instance.recursionLimit,
    };
