// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sikom_device.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SikomDeviceImpl _$$SikomDeviceImplFromJson(Map<String, dynamic> json) =>
    _$SikomDeviceImpl(
      properties: SikomDeviceProperties.fromJson(
          json['Properties'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SikomDeviceImplToJson(_$SikomDeviceImpl instance) =>
    <String, dynamic>{
      'Properties': instance.properties.toJson(),
    };

_$SikomDevicePropertiesImpl _$$SikomDevicePropertiesImplFromJson(
        Map<String, dynamic> json) =>
    _$SikomDevicePropertiesImpl(
      vendorType:
          SikomProperty.fromJson(json['vendor_type'] as Map<String, dynamic>),
      bestEffortName: SikomProperty.fromJson(
          json['best_effort_name'] as Map<String, dynamic>),
      latestUpdateFromDevice: json['latest_update_from_device'] == null
          ? null
          : SikomProperty.fromJson(
              json['latest_update_from_device'] as Map<String, dynamic>),
      pushUpdateIntervalMinutes: json['push_update_interval_minutes'] == null
          ? null
          : SikomProperty.fromJson(
              json['push_update_interval_minutes'] as Map<String, dynamic>),
      dummy: json['dummy'] == null
          ? null
          : SikomProperty.fromJson(json['dummy'] as Map<String, dynamic>),
      connection: json['connection'] == null
          ? null
          : SikomProperty.fromJson(json['connection'] as Map<String, dynamic>),
      gprsNetname: json['gprsNetname'] == null
          ? null
          : SikomProperty.fromJson(json['gprsNetname'] as Map<String, dynamic>),
      productCode: json['product_code'] == null
          ? null
          : SikomProperty.fromJson(
              json['product_code'] as Map<String, dynamic>),
      modelName: json['model_name'] == null
          ? null
          : SikomProperty.fromJson(json['model_name'] as Map<String, dynamic>),
      deviceType: json['device_type'] == null
          ? null
          : SikomProperty.fromJson(json['device_type'] as Map<String, dynamic>),
      deviceModel: json['device_model'] == null
          ? null
          : SikomProperty.fromJson(
              json['device_model'] as Map<String, dynamic>),
      userDefinedName: json['user_defined_name'] == null
          ? null
          : SikomProperty.fromJson(
              json['user_defined_name'] as Map<String, dynamic>),
      deviceModelReadable: json['device_model_readable'] == null
          ? null
          : SikomProperty.fromJson(
              json['device_model_readable'] as Map<String, dynamic>),
      vendorAndDeviceModelReadable: json['vendor_and_device_model_readable'] ==
              null
          ? null
          : SikomProperty.fromJson(
              json['vendor_and_device_model_readable'] as Map<String, dynamic>),
      currentPowerUsage: json['ams_iap_slp_avg'] == null
          ? null
          : SikomProperty.fromJson(
              json['ams_iap_slp_avg'] as Map<String, dynamic>),
      cumulativeEnergy: json['ams_cumulative_plus_calculated_energy'] == null
          ? null
          : SikomProperty.fromJson(json['ams_cumulative_plus_calculated_energy']
              as Map<String, dynamic>),
      cumulativeEnergyToday:
          json['ams_cumulative_plus_calculated_energy_today'] == null
              ? null
              : SikomProperty.fromJson(
                  json['ams_cumulative_plus_calculated_energy_today']
                      as Map<String, dynamic>),
      powerVoltage: json['ams_power_voltage'] == null
          ? null
          : SikomProperty.fromJson(
              json['ams_power_voltage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SikomDevicePropertiesImplToJson(
        _$SikomDevicePropertiesImpl instance) =>
    <String, dynamic>{
      'vendor_type': instance.vendorType.toJson(),
      'best_effort_name': instance.bestEffortName.toJson(),
      'latest_update_from_device': instance.latestUpdateFromDevice?.toJson(),
      'push_update_interval_minutes':
          instance.pushUpdateIntervalMinutes?.toJson(),
      'dummy': instance.dummy?.toJson(),
      'connection': instance.connection?.toJson(),
      'gprsNetname': instance.gprsNetname?.toJson(),
      'product_code': instance.productCode?.toJson(),
      'model_name': instance.modelName?.toJson(),
      'device_type': instance.deviceType?.toJson(),
      'device_model': instance.deviceModel?.toJson(),
      'user_defined_name': instance.userDefinedName?.toJson(),
      'device_model_readable': instance.deviceModelReadable?.toJson(),
      'vendor_and_device_model_readable':
          instance.vendorAndDeviceModelReadable?.toJson(),
      'ams_iap_slp_avg': instance.currentPowerUsage?.toJson(),
      'ams_cumulative_plus_calculated_energy':
          instance.cumulativeEnergy?.toJson(),
      'ams_cumulative_plus_calculated_energy_today':
          instance.cumulativeEnergyToday?.toJson(),
      'ams_power_voltage': instance.powerVoltage?.toJson(),
    };
