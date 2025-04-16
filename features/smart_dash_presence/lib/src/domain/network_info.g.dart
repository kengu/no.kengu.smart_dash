// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NetworkDeviceInfo _$NetworkDeviceInfoFromJson(Map<String, dynamic> json) =>
    _NetworkDeviceInfo(
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

Map<String, dynamic> _$NetworkDeviceInfoToJson(_NetworkDeviceInfo instance) =>
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
