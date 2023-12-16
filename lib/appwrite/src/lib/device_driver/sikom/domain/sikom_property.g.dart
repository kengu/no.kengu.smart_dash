// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sikom_property.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SikomPropertyImpl _$$SikomPropertyImplFromJson(Map<String, dynamic> json) =>
    _$SikomPropertyImpl(
      name: json['Name'] as String,
      value: json['Value'] as String,
      created: json['Created'] == null
          ? null
          : DateTime.parse(json['Created'] as String),
      deviceId: json['DeviceId'] as int,
      gatewayId: json['GatewayId'] as int,
      customerId1: json['CustomerId1'] as int,
      customerId2: json['CustomerId2'] as int,
    );

Map<String, dynamic> _$$SikomPropertyImplToJson(_$SikomPropertyImpl instance) =>
    <String, dynamic>{
      'Name': instance.name,
      'Value': instance.value,
      'Created': instance.created?.toIso8601String(),
      'DeviceId': instance.deviceId,
      'GatewayId': instance.gatewayId,
      'CustomerId1': instance.customerId1,
      'CustomerId2': instance.customerId2,
    };
