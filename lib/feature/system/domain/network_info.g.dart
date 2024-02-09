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
      hostName: json['hostName'] as String?,
      macAddress: json['macAddress'] as String?,
      vendorName: json['vendorName'] as String?,
    );

Map<String, dynamic> _$$NetworkDeviceInfoImplToJson(
        _$NetworkDeviceInfoImpl instance) =>
    <String, dynamic>{
      'hostId': instance.hostId,
      'ipAddress': instance.ipAddress,
      'deviceName': instance.deviceName,
      'hostName': instance.hostName,
      'macAddress': instance.macAddress,
      'vendorName': instance.vendorName,
    };
