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
      switchMode: json['switch_mode'] == null
          ? null
          : SikomProperty.fromJson(json['switch_mode'] as Map<String, dynamic>),
      switchReadableMode: json['switch_readable_mode'] == null
          ? null
          : SikomProperty.fromJson(
              json['switch_readable_mode'] as Map<String, dynamic>),
      switchState: json['switch_state'] == null
          ? null
          : SikomProperty.fromJson(
              json['switch_state'] as Map<String, dynamic>),
      switchReductionMode: json['switch_reduction_mode'] == null
          ? null
          : SikomProperty.fromJson(
              json['switch_reduction_mode'] as Map<String, dynamic>),
      switchThermostatActive: json['switch_thermostat_active'] == null
          ? null
          : SikomProperty.fromJson(
              json['switch_thermostat_active'] as Map<String, dynamic>),
      temperature: json['temperature'] == null
          ? null
          : SikomProperty.fromJson(json['temperature'] as Map<String, dynamic>),
      temperatureMin: json['temperature_min'] == null
          ? null
          : SikomProperty.fromJson(
              json['temperature_min'] as Map<String, dynamic>),
      temperatureMax: json['temperature_max'] == null
          ? null
          : SikomProperty.fromJson(
              json['temperature_max'] as Map<String, dynamic>),
      temperatureEco: json['temperature_eco'] == null
          ? null
          : SikomProperty.fromJson(
              json['temperature_eco'] as Map<String, dynamic>),
      temperatureEcoAdjustment: json['temperature_eco_prlsa'] == null
          ? null
          : SikomProperty.fromJson(
              json['temperature_eco_prlsa'] as Map<String, dynamic>),
      temperatureComfort: json['temperature_comfort'] == null
          ? null
          : SikomProperty.fromJson(
              json['temperature_comfort'] as Map<String, dynamic>),
      temperatureComfortAdjustment: json['temperature_comfort_prlsa'] == null
          ? null
          : SikomProperty.fromJson(
              json['temperature_comfort_prlsa'] as Map<String, dynamic>),
      regulatedState: json['ams_regulated_state'] == null
          ? null
          : SikomProperty.fromJson(
              json['ams_regulated_state'] as Map<String, dynamic>),
      regulationPriority: json['ams_regulation_priority'] == null
          ? null
          : SikomProperty.fromJson(
              json['ams_regulation_priority'] as Map<String, dynamic>),
      estimatedRegulatedPower: json['estimated_reg_power'] == null
          ? null
          : SikomProperty.fromJson(
              json['estimated_reg_power'] as Map<String, dynamic>),
      estimatedUnregulatedPower: json['estimated_unreg_power'] == null
          ? null
          : SikomProperty.fromJson(
              json['estimated_unreg_power'] as Map<String, dynamic>),
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
      'switch_mode': instance.switchMode?.toJson(),
      'switch_readable_mode': instance.switchReadableMode?.toJson(),
      'switch_state': instance.switchState?.toJson(),
      'switch_reduction_mode': instance.switchReductionMode?.toJson(),
      'switch_thermostat_active': instance.switchThermostatActive?.toJson(),
      'temperature': instance.temperature?.toJson(),
      'temperature_min': instance.temperatureMin?.toJson(),
      'temperature_max': instance.temperatureMax?.toJson(),
      'temperature_eco': instance.temperatureEco?.toJson(),
      'temperature_eco_prlsa': instance.temperatureEcoAdjustment?.toJson(),
      'temperature_comfort': instance.temperatureComfort?.toJson(),
      'temperature_comfort_prlsa':
          instance.temperatureComfortAdjustment?.toJson(),
      'ams_regulated_state': instance.regulatedState?.toJson(),
      'ams_regulation_priority': instance.regulationPriority?.toJson(),
      'estimated_reg_power': instance.estimatedRegulatedPower?.toJson(),
      'estimated_unreg_power': instance.estimatedUnregulatedPower?.toJson(),
    };
