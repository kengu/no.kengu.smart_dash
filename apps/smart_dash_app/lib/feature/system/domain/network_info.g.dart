// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NetworkDeviceInfoImpl _$$NetworkDeviceInfoImplFromJson(
        Map<String, dynamic> json) =>
    _$NetworkDeviceInfoImpl(
      hostId: json['hostId'] as String,
      ipAddress: json['ipAddress'] as String,
      deviceName: json['deviceName'] as String,
      isAvailable: json['isAvailable'] as bool,
      hostName: json['hostName'] as String?,
      macAddress: json['macAddress'] as String?,
      vendorName: json['vendorName'] as String?,
      aliveWhen: json['aliveWhen'] == null
          ? null
          : DateTime.parse(json['aliveWhen'] as String),
    );

Map<String, dynamic> _$$NetworkDeviceInfoImplToJson(
        _$NetworkDeviceInfoImpl instance) =>
    <String, dynamic>{
      'hostId': instance.hostId,
      'ipAddress': instance.ipAddress,
      'deviceName': instance.deviceName,
      'isAvailable': instance.isAvailable,
      'hostName': instance.hostName,
      'macAddress': instance.macAddress,
      'vendorName': instance.vendorName,
      'aliveWhen': instance.aliveWhen?.toIso8601String(),
    };
