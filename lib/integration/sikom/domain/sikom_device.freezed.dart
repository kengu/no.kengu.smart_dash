// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sikom_device.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SikomDevice _$SikomDeviceFromJson(Map<String, dynamic> json) {
  return _SikomDevice.fromJson(json);
}

/// @nodoc
mixin _$SikomDevice {
  @JsonKey(name: 'Properties')
  SikomDeviceProperties get properties => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SikomDeviceCopyWith<SikomDevice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SikomDeviceCopyWith<$Res> {
  factory $SikomDeviceCopyWith(
          SikomDevice value, $Res Function(SikomDevice) then) =
      _$SikomDeviceCopyWithImpl<$Res, SikomDevice>;
  @useResult
  $Res call({@JsonKey(name: 'Properties') SikomDeviceProperties properties});

  $SikomDevicePropertiesCopyWith<$Res> get properties;
}

/// @nodoc
class _$SikomDeviceCopyWithImpl<$Res, $Val extends SikomDevice>
    implements $SikomDeviceCopyWith<$Res> {
  _$SikomDeviceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? properties = null,
  }) {
    return _then(_value.copyWith(
      properties: null == properties
          ? _value.properties
          : properties // ignore: cast_nullable_to_non_nullable
              as SikomDeviceProperties,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SikomDevicePropertiesCopyWith<$Res> get properties {
    return $SikomDevicePropertiesCopyWith<$Res>(_value.properties, (value) {
      return _then(_value.copyWith(properties: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SikomDeviceImplCopyWith<$Res>
    implements $SikomDeviceCopyWith<$Res> {
  factory _$$SikomDeviceImplCopyWith(
          _$SikomDeviceImpl value, $Res Function(_$SikomDeviceImpl) then) =
      __$$SikomDeviceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'Properties') SikomDeviceProperties properties});

  @override
  $SikomDevicePropertiesCopyWith<$Res> get properties;
}

/// @nodoc
class __$$SikomDeviceImplCopyWithImpl<$Res>
    extends _$SikomDeviceCopyWithImpl<$Res, _$SikomDeviceImpl>
    implements _$$SikomDeviceImplCopyWith<$Res> {
  __$$SikomDeviceImplCopyWithImpl(
      _$SikomDeviceImpl _value, $Res Function(_$SikomDeviceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? properties = null,
  }) {
    return _then(_$SikomDeviceImpl(
      properties: null == properties
          ? _value.properties
          : properties // ignore: cast_nullable_to_non_nullable
              as SikomDeviceProperties,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SikomDeviceImpl extends _SikomDevice {
  const _$SikomDeviceImpl(
      {@JsonKey(name: 'Properties') required this.properties})
      : super._();

  factory _$SikomDeviceImpl.fromJson(Map<String, dynamic> json) =>
      _$$SikomDeviceImplFromJson(json);

  @override
  @JsonKey(name: 'Properties')
  final SikomDeviceProperties properties;

  @override
  String toString() {
    return 'SikomDevice(properties: $properties)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SikomDeviceImpl &&
            (identical(other.properties, properties) ||
                other.properties == properties));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, properties);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SikomDeviceImplCopyWith<_$SikomDeviceImpl> get copyWith =>
      __$$SikomDeviceImplCopyWithImpl<_$SikomDeviceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SikomDeviceImplToJson(
      this,
    );
  }
}

abstract class _SikomDevice extends SikomDevice {
  const factory _SikomDevice(
      {@JsonKey(name: 'Properties')
      required final SikomDeviceProperties properties}) = _$SikomDeviceImpl;
  const _SikomDevice._() : super._();

  factory _SikomDevice.fromJson(Map<String, dynamic> json) =
      _$SikomDeviceImpl.fromJson;

  @override
  @JsonKey(name: 'Properties')
  SikomDeviceProperties get properties;
  @override
  @JsonKey(ignore: true)
  _$$SikomDeviceImplCopyWith<_$SikomDeviceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SikomDeviceProperties _$SikomDevicePropertiesFromJson(
    Map<String, dynamic> json) {
  return _SikomDeviceProperties.fromJson(json);
}

/// @nodoc
mixin _$SikomDeviceProperties {
  @JsonKey(name: 'vendor_type')
  SikomProperty get vendorType => throw _privateConstructorUsedError;
  @JsonKey(name: 'best_effort_name')
  SikomProperty get bestEffortName => throw _privateConstructorUsedError;
  @JsonKey(name: 'latest_update_from_device')
  SikomProperty? get latestUpdateFromDevice =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'push_update_interval_minutes')
  SikomProperty? get pushUpdateIntervalMinutes =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'dummy')
  SikomProperty? get dummy => throw _privateConstructorUsedError;
  @JsonKey(name: 'connection')
  SikomProperty? get connection => throw _privateConstructorUsedError;
  @JsonKey(name: 'gprsNetname')
  SikomProperty? get gprsNetname => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_code')
  SikomProperty? get productCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'model_name')
  SikomProperty? get modelName => throw _privateConstructorUsedError;
  @JsonKey(name: 'device_type')
  SikomProperty? get deviceType => throw _privateConstructorUsedError;
  @JsonKey(name: 'device_model')
  SikomProperty? get deviceModel => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_defined_name')
  SikomProperty? get userDefinedName => throw _privateConstructorUsedError;
  @JsonKey(name: 'device_model_readable')
  SikomProperty? get deviceModelReadable => throw _privateConstructorUsedError;
  @JsonKey(name: 'vendor_and_device_model_readable')
  SikomProperty? get vendorAndDeviceModelReadable =>
      throw _privateConstructorUsedError; // DO NOT USE 'ams_current_power_usage', it is quite "random"
// since only given each minute according to Sikom. Use 'ams_iap_slp_avg'
// (Average Imported Active Power since last push) instead.
  @JsonKey(name: 'ams_iap_slp_avg')
  SikomProperty? get currentPowerUsage =>
      throw _privateConstructorUsedError; // This is the most frequently updated total meter reading in [Wh]
// consisting of the "official" value 'ams_cumulative_imported_energy'
// (active energy) from the meter itself (updated every hour)"
  @JsonKey(name: 'ams_cumulative_plus_calculated_energy')
  SikomProperty? get cumulativeEnergy => throw _privateConstructorUsedError;
  @JsonKey(name: 'ams_cumulative_plus_calculated_energy_today')
  SikomProperty? get cumulativeEnergyToday =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'ams_power_voltage')
  SikomProperty? get powerVoltage =>
      throw _privateConstructorUsedError; // Commanded mode of a switch. May differ from switch_state (actual relay-state) for instance
// when under thermostat control. Now how (for thermostats) a value of 0 does not have a single meaning
// (it may mean either "eco", "anti_freeze" and "off"). A value of 1 on the other hand is usually precise
// (Meaning "on" if dumb switch and "comfort" if thermostat). Note that for products like
// "ProductCode.CTMmTouchOne" this value should be ignored (considered irrelevant) when
// "DeviceProperty.switch_thermostat_active" is 0. Same issues with "ProductCode.CTMmTouchDim"
// and percent level == 99. See also "DeviceProperty.switch_reduction_mode" which explains (in plain text)
// what is the precise meaning of 0 and 1.
  @JsonKey(name: 'switch_mode')
  SikomProperty? get switchMode =>
      throw _privateConstructorUsedError; // Human-readable text explaining current "DeviceProperty.switch_mode" (off, eco, comfort, etc.)
  @JsonKey(name: 'switch_readable_mode')
  SikomProperty? get switchReadableMode =>
      throw _privateConstructorUsedError; // The actual relay state of the switch (on / off)
  @JsonKey(name: 'switch_state')
  SikomProperty? get switchState =>
      throw _privateConstructorUsedError; // The precise meaning of values 0 and 1 in "DeviceProperty.switch_mode".
  @JsonKey(name: 'switch_reduction_mode')
  SikomProperty? get switchReductionMode =>
      throw _privateConstructorUsedError; // Eco / comfort active or not. If 0 then switch_mode 0 will usually mean "off" or "anti_freeze"
// and 1 will not have any meaning. If 1 then switch_mode 0 will mean "eco" and 1 will mean "comfort".
// Not relevant to set for some kind of thermostats (for instance SI-3, SI-4 or CTM mTouch One).
// Not desired to set for other thermostats (because of danger of freezing water for instance).
  @JsonKey(name: 'switch_thermostat_active')
  SikomProperty? get switchThermostatActive =>
      throw _privateConstructorUsedError; // Air temperature (inside). Note that will always be the most important temperature (the one used for controlling)
// while "DeviceProperty.temperature_2" will be the secondary temperature. This is (pr Feb 2019) only relevant for
// "ProductCode.CTMmTouchOne" which can control based on either air or floor-temperature.
  @JsonKey(name: 'temperature')
  SikomProperty? get temperature =>
      throw _privateConstructorUsedError; // Minimum allowed temperature (at or above this value will result in temperature_notification_triggered).
  @JsonKey(name: 'temperature_min')
  SikomProperty? get temperatureMin =>
      throw _privateConstructorUsedError; // Maximum allowed temperature (at or below this value will result in temperature_notification_triggered).
  @JsonKey(name: 'temperature_max')
  SikomProperty? get temperatureMax =>
      throw _privateConstructorUsedError; // Thermostat temperature in switch_mode 'eco'
  @JsonKey(name: 'temperature_eco')
  SikomProperty? get temperatureEco =>
      throw _privateConstructorUsedError; // (prlsa = PowerRegulatorListenerSilentAdjustment). Number of degrees Celsius that the PowerRegulatorListener
// has silently adjusted the temperature in the background. (As of Feb 2019 will always be a negative value,
// that is, adjustment is done by lowering the temperature. But, in principle we might also adjust the temperature
// upwards, for instance heating the house extra before morning, in order for the thermostats to turn off in the
// morning). While silent adjustment is in force, temperature_eco / temperature_comfort will be adjusted with this
// value, keeping the fact of a adjustment "hidden" from BPAPI-user only relating to temperature_eco /
// temperature_comfort.
  @JsonKey(name: 'temperature_eco_prlsa')
  SikomProperty? get temperatureEcoAdjustment =>
      throw _privateConstructorUsedError; // Thermostat temperature in switch_mode 'comfort'
  @JsonKey(name: 'temperature_comfort')
  SikomProperty? get temperatureComfort =>
      throw _privateConstructorUsedError; // (prlsa = PowerRegulatorListenerSilentAdjustment). Number of degrees Celsius that the PowerRegulatorListener
// has silently adjusted the temperature in the background. (As of Feb 2019 will always be a negative value,
// that is, adjustment is done by lowering the temperature. But, in principle we might also adjust the temperature
// upwards, for instance heating the house extra before morning, in order for the thermostats to turn off in the
// morning). While silent adjustment is in force, temperature_eco / temperature_comfort will be adjusted with this
// value, keeping the fact of a adjustment "hidden" from BPAPI-user only relating to temperature_eco /
// temperature_comfort.
  @JsonKey(name: 'temperature_comfort_prlsa')
  SikomProperty? get temperatureComfortAdjustment =>
      throw _privateConstructorUsedError; // Tells whether the device is currently being regulated
// or not (0 = not regulated 1 = import regulated 2 = export regulated)
  @JsonKey(name: 'ams_regulated_state')
  SikomProperty? get regulatedState =>
      throw _privateConstructorUsedError; // The power (in W) that this device releases when regulated out, as estimated by
// the system itself, compared to when regulated in (raw value, no PWM or other partial
// regulation scheme accounted for). Will be a negative value (representing the power
// "added" when the device is regulated out. Only relevant to set for devices which have
// switch_mode (and when an ECOEnergyController is installed)
  @JsonKey(name: 'ams_regulation_priority')
  SikomProperty? get regulationPriority => throw _privateConstructorUsedError;
  @JsonKey(name: 'estimated_reg_power')
  SikomProperty? get estimatedRegulatedPower =>
      throw _privateConstructorUsedError; // The power (in W) that this device draws when unregulated, as estimated by the system itself,
// compared to when regulated out (raw value, no PWM or other partial regulation scheme accounted for).
// Will be a positive value. Only relevant to set for devices which have
// switch_mode (and when an ECOEnergyController)
  @JsonKey(name: 'estimated_unreg_power')
  SikomProperty? get estimatedUnregulatedPower =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SikomDevicePropertiesCopyWith<SikomDeviceProperties> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SikomDevicePropertiesCopyWith<$Res> {
  factory $SikomDevicePropertiesCopyWith(SikomDeviceProperties value,
          $Res Function(SikomDeviceProperties) then) =
      _$SikomDevicePropertiesCopyWithImpl<$Res, SikomDeviceProperties>;
  @useResult
  $Res call(
      {@JsonKey(name: 'vendor_type') SikomProperty vendorType,
      @JsonKey(name: 'best_effort_name') SikomProperty bestEffortName,
      @JsonKey(name: 'latest_update_from_device')
      SikomProperty? latestUpdateFromDevice,
      @JsonKey(name: 'push_update_interval_minutes')
      SikomProperty? pushUpdateIntervalMinutes,
      @JsonKey(name: 'dummy') SikomProperty? dummy,
      @JsonKey(name: 'connection') SikomProperty? connection,
      @JsonKey(name: 'gprsNetname') SikomProperty? gprsNetname,
      @JsonKey(name: 'product_code') SikomProperty? productCode,
      @JsonKey(name: 'model_name') SikomProperty? modelName,
      @JsonKey(name: 'device_type') SikomProperty? deviceType,
      @JsonKey(name: 'device_model') SikomProperty? deviceModel,
      @JsonKey(name: 'user_defined_name') SikomProperty? userDefinedName,
      @JsonKey(name: 'device_model_readable')
      SikomProperty? deviceModelReadable,
      @JsonKey(name: 'vendor_and_device_model_readable')
      SikomProperty? vendorAndDeviceModelReadable,
      @JsonKey(name: 'ams_iap_slp_avg') SikomProperty? currentPowerUsage,
      @JsonKey(name: 'ams_cumulative_plus_calculated_energy')
      SikomProperty? cumulativeEnergy,
      @JsonKey(name: 'ams_cumulative_plus_calculated_energy_today')
      SikomProperty? cumulativeEnergyToday,
      @JsonKey(name: 'ams_power_voltage') SikomProperty? powerVoltage,
      @JsonKey(name: 'switch_mode') SikomProperty? switchMode,
      @JsonKey(name: 'switch_readable_mode') SikomProperty? switchReadableMode,
      @JsonKey(name: 'switch_state') SikomProperty? switchState,
      @JsonKey(name: 'switch_reduction_mode')
      SikomProperty? switchReductionMode,
      @JsonKey(name: 'switch_thermostat_active')
      SikomProperty? switchThermostatActive,
      @JsonKey(name: 'temperature') SikomProperty? temperature,
      @JsonKey(name: 'temperature_min') SikomProperty? temperatureMin,
      @JsonKey(name: 'temperature_max') SikomProperty? temperatureMax,
      @JsonKey(name: 'temperature_eco') SikomProperty? temperatureEco,
      @JsonKey(name: 'temperature_eco_prlsa')
      SikomProperty? temperatureEcoAdjustment,
      @JsonKey(name: 'temperature_comfort') SikomProperty? temperatureComfort,
      @JsonKey(name: 'temperature_comfort_prlsa')
      SikomProperty? temperatureComfortAdjustment,
      @JsonKey(name: 'ams_regulated_state') SikomProperty? regulatedState,
      @JsonKey(name: 'ams_regulation_priority')
      SikomProperty? regulationPriority,
      @JsonKey(name: 'estimated_reg_power')
      SikomProperty? estimatedRegulatedPower,
      @JsonKey(name: 'estimated_unreg_power')
      SikomProperty? estimatedUnregulatedPower});

  $SikomPropertyCopyWith<$Res> get vendorType;
  $SikomPropertyCopyWith<$Res> get bestEffortName;
  $SikomPropertyCopyWith<$Res>? get latestUpdateFromDevice;
  $SikomPropertyCopyWith<$Res>? get pushUpdateIntervalMinutes;
  $SikomPropertyCopyWith<$Res>? get dummy;
  $SikomPropertyCopyWith<$Res>? get connection;
  $SikomPropertyCopyWith<$Res>? get gprsNetname;
  $SikomPropertyCopyWith<$Res>? get productCode;
  $SikomPropertyCopyWith<$Res>? get modelName;
  $SikomPropertyCopyWith<$Res>? get deviceType;
  $SikomPropertyCopyWith<$Res>? get deviceModel;
  $SikomPropertyCopyWith<$Res>? get userDefinedName;
  $SikomPropertyCopyWith<$Res>? get deviceModelReadable;
  $SikomPropertyCopyWith<$Res>? get vendorAndDeviceModelReadable;
  $SikomPropertyCopyWith<$Res>? get currentPowerUsage;
  $SikomPropertyCopyWith<$Res>? get cumulativeEnergy;
  $SikomPropertyCopyWith<$Res>? get cumulativeEnergyToday;
  $SikomPropertyCopyWith<$Res>? get powerVoltage;
  $SikomPropertyCopyWith<$Res>? get switchMode;
  $SikomPropertyCopyWith<$Res>? get switchReadableMode;
  $SikomPropertyCopyWith<$Res>? get switchState;
  $SikomPropertyCopyWith<$Res>? get switchReductionMode;
  $SikomPropertyCopyWith<$Res>? get switchThermostatActive;
  $SikomPropertyCopyWith<$Res>? get temperature;
  $SikomPropertyCopyWith<$Res>? get temperatureMin;
  $SikomPropertyCopyWith<$Res>? get temperatureMax;
  $SikomPropertyCopyWith<$Res>? get temperatureEco;
  $SikomPropertyCopyWith<$Res>? get temperatureEcoAdjustment;
  $SikomPropertyCopyWith<$Res>? get temperatureComfort;
  $SikomPropertyCopyWith<$Res>? get temperatureComfortAdjustment;
  $SikomPropertyCopyWith<$Res>? get regulatedState;
  $SikomPropertyCopyWith<$Res>? get regulationPriority;
  $SikomPropertyCopyWith<$Res>? get estimatedRegulatedPower;
  $SikomPropertyCopyWith<$Res>? get estimatedUnregulatedPower;
}

/// @nodoc
class _$SikomDevicePropertiesCopyWithImpl<$Res,
        $Val extends SikomDeviceProperties>
    implements $SikomDevicePropertiesCopyWith<$Res> {
  _$SikomDevicePropertiesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vendorType = null,
    Object? bestEffortName = null,
    Object? latestUpdateFromDevice = freezed,
    Object? pushUpdateIntervalMinutes = freezed,
    Object? dummy = freezed,
    Object? connection = freezed,
    Object? gprsNetname = freezed,
    Object? productCode = freezed,
    Object? modelName = freezed,
    Object? deviceType = freezed,
    Object? deviceModel = freezed,
    Object? userDefinedName = freezed,
    Object? deviceModelReadable = freezed,
    Object? vendorAndDeviceModelReadable = freezed,
    Object? currentPowerUsage = freezed,
    Object? cumulativeEnergy = freezed,
    Object? cumulativeEnergyToday = freezed,
    Object? powerVoltage = freezed,
    Object? switchMode = freezed,
    Object? switchReadableMode = freezed,
    Object? switchState = freezed,
    Object? switchReductionMode = freezed,
    Object? switchThermostatActive = freezed,
    Object? temperature = freezed,
    Object? temperatureMin = freezed,
    Object? temperatureMax = freezed,
    Object? temperatureEco = freezed,
    Object? temperatureEcoAdjustment = freezed,
    Object? temperatureComfort = freezed,
    Object? temperatureComfortAdjustment = freezed,
    Object? regulatedState = freezed,
    Object? regulationPriority = freezed,
    Object? estimatedRegulatedPower = freezed,
    Object? estimatedUnregulatedPower = freezed,
  }) {
    return _then(_value.copyWith(
      vendorType: null == vendorType
          ? _value.vendorType
          : vendorType // ignore: cast_nullable_to_non_nullable
              as SikomProperty,
      bestEffortName: null == bestEffortName
          ? _value.bestEffortName
          : bestEffortName // ignore: cast_nullable_to_non_nullable
              as SikomProperty,
      latestUpdateFromDevice: freezed == latestUpdateFromDevice
          ? _value.latestUpdateFromDevice
          : latestUpdateFromDevice // ignore: cast_nullable_to_non_nullable
              as SikomProperty?,
      pushUpdateIntervalMinutes: freezed == pushUpdateIntervalMinutes
          ? _value.pushUpdateIntervalMinutes
          : pushUpdateIntervalMinutes // ignore: cast_nullable_to_non_nullable
              as SikomProperty?,
      dummy: freezed == dummy
          ? _value.dummy
          : dummy // ignore: cast_nullable_to_non_nullable
              as SikomProperty?,
      connection: freezed == connection
          ? _value.connection
          : connection // ignore: cast_nullable_to_non_nullable
              as SikomProperty?,
      gprsNetname: freezed == gprsNetname
          ? _value.gprsNetname
          : gprsNetname // ignore: cast_nullable_to_non_nullable
              as SikomProperty?,
      productCode: freezed == productCode
          ? _value.productCode
          : productCode // ignore: cast_nullable_to_non_nullable
              as SikomProperty?,
      modelName: freezed == modelName
          ? _value.modelName
          : modelName // ignore: cast_nullable_to_non_nullable
              as SikomProperty?,
      deviceType: freezed == deviceType
          ? _value.deviceType
          : deviceType // ignore: cast_nullable_to_non_nullable
              as SikomProperty?,
      deviceModel: freezed == deviceModel
          ? _value.deviceModel
          : deviceModel // ignore: cast_nullable_to_non_nullable
              as SikomProperty?,
      userDefinedName: freezed == userDefinedName
          ? _value.userDefinedName
          : userDefinedName // ignore: cast_nullable_to_non_nullable
              as SikomProperty?,
      deviceModelReadable: freezed == deviceModelReadable
          ? _value.deviceModelReadable
          : deviceModelReadable // ignore: cast_nullable_to_non_nullable
              as SikomProperty?,
      vendorAndDeviceModelReadable: freezed == vendorAndDeviceModelReadable
          ? _value.vendorAndDeviceModelReadable
          : vendorAndDeviceModelReadable // ignore: cast_nullable_to_non_nullable
              as SikomProperty?,
      currentPowerUsage: freezed == currentPowerUsage
          ? _value.currentPowerUsage
          : currentPowerUsage // ignore: cast_nullable_to_non_nullable
              as SikomProperty?,
      cumulativeEnergy: freezed == cumulativeEnergy
          ? _value.cumulativeEnergy
          : cumulativeEnergy // ignore: cast_nullable_to_non_nullable
              as SikomProperty?,
      cumulativeEnergyToday: freezed == cumulativeEnergyToday
          ? _value.cumulativeEnergyToday
          : cumulativeEnergyToday // ignore: cast_nullable_to_non_nullable
              as SikomProperty?,
      powerVoltage: freezed == powerVoltage
          ? _value.powerVoltage
          : powerVoltage // ignore: cast_nullable_to_non_nullable
              as SikomProperty?,
      switchMode: freezed == switchMode
          ? _value.switchMode
          : switchMode // ignore: cast_nullable_to_non_nullable
              as SikomProperty?,
      switchReadableMode: freezed == switchReadableMode
          ? _value.switchReadableMode
          : switchReadableMode // ignore: cast_nullable_to_non_nullable
              as SikomProperty?,
      switchState: freezed == switchState
          ? _value.switchState
          : switchState // ignore: cast_nullable_to_non_nullable
              as SikomProperty?,
      switchReductionMode: freezed == switchReductionMode
          ? _value.switchReductionMode
          : switchReductionMode // ignore: cast_nullable_to_non_nullable
              as SikomProperty?,
      switchThermostatActive: freezed == switchThermostatActive
          ? _value.switchThermostatActive
          : switchThermostatActive // ignore: cast_nullable_to_non_nullable
              as SikomProperty?,
      temperature: freezed == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as SikomProperty?,
      temperatureMin: freezed == temperatureMin
          ? _value.temperatureMin
          : temperatureMin // ignore: cast_nullable_to_non_nullable
              as SikomProperty?,
      temperatureMax: freezed == temperatureMax
          ? _value.temperatureMax
          : temperatureMax // ignore: cast_nullable_to_non_nullable
              as SikomProperty?,
      temperatureEco: freezed == temperatureEco
          ? _value.temperatureEco
          : temperatureEco // ignore: cast_nullable_to_non_nullable
              as SikomProperty?,
      temperatureEcoAdjustment: freezed == temperatureEcoAdjustment
          ? _value.temperatureEcoAdjustment
          : temperatureEcoAdjustment // ignore: cast_nullable_to_non_nullable
              as SikomProperty?,
      temperatureComfort: freezed == temperatureComfort
          ? _value.temperatureComfort
          : temperatureComfort // ignore: cast_nullable_to_non_nullable
              as SikomProperty?,
      temperatureComfortAdjustment: freezed == temperatureComfortAdjustment
          ? _value.temperatureComfortAdjustment
          : temperatureComfortAdjustment // ignore: cast_nullable_to_non_nullable
              as SikomProperty?,
      regulatedState: freezed == regulatedState
          ? _value.regulatedState
          : regulatedState // ignore: cast_nullable_to_non_nullable
              as SikomProperty?,
      regulationPriority: freezed == regulationPriority
          ? _value.regulationPriority
          : regulationPriority // ignore: cast_nullable_to_non_nullable
              as SikomProperty?,
      estimatedRegulatedPower: freezed == estimatedRegulatedPower
          ? _value.estimatedRegulatedPower
          : estimatedRegulatedPower // ignore: cast_nullable_to_non_nullable
              as SikomProperty?,
      estimatedUnregulatedPower: freezed == estimatedUnregulatedPower
          ? _value.estimatedUnregulatedPower
          : estimatedUnregulatedPower // ignore: cast_nullable_to_non_nullable
              as SikomProperty?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SikomPropertyCopyWith<$Res> get vendorType {
    return $SikomPropertyCopyWith<$Res>(_value.vendorType, (value) {
      return _then(_value.copyWith(vendorType: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SikomPropertyCopyWith<$Res> get bestEffortName {
    return $SikomPropertyCopyWith<$Res>(_value.bestEffortName, (value) {
      return _then(_value.copyWith(bestEffortName: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SikomPropertyCopyWith<$Res>? get latestUpdateFromDevice {
    if (_value.latestUpdateFromDevice == null) {
      return null;
    }

    return $SikomPropertyCopyWith<$Res>(_value.latestUpdateFromDevice!,
        (value) {
      return _then(_value.copyWith(latestUpdateFromDevice: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SikomPropertyCopyWith<$Res>? get pushUpdateIntervalMinutes {
    if (_value.pushUpdateIntervalMinutes == null) {
      return null;
    }

    return $SikomPropertyCopyWith<$Res>(_value.pushUpdateIntervalMinutes!,
        (value) {
      return _then(_value.copyWith(pushUpdateIntervalMinutes: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SikomPropertyCopyWith<$Res>? get dummy {
    if (_value.dummy == null) {
      return null;
    }

    return $SikomPropertyCopyWith<$Res>(_value.dummy!, (value) {
      return _then(_value.copyWith(dummy: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SikomPropertyCopyWith<$Res>? get connection {
    if (_value.connection == null) {
      return null;
    }

    return $SikomPropertyCopyWith<$Res>(_value.connection!, (value) {
      return _then(_value.copyWith(connection: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SikomPropertyCopyWith<$Res>? get gprsNetname {
    if (_value.gprsNetname == null) {
      return null;
    }

    return $SikomPropertyCopyWith<$Res>(_value.gprsNetname!, (value) {
      return _then(_value.copyWith(gprsNetname: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SikomPropertyCopyWith<$Res>? get productCode {
    if (_value.productCode == null) {
      return null;
    }

    return $SikomPropertyCopyWith<$Res>(_value.productCode!, (value) {
      return _then(_value.copyWith(productCode: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SikomPropertyCopyWith<$Res>? get modelName {
    if (_value.modelName == null) {
      return null;
    }

    return $SikomPropertyCopyWith<$Res>(_value.modelName!, (value) {
      return _then(_value.copyWith(modelName: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SikomPropertyCopyWith<$Res>? get deviceType {
    if (_value.deviceType == null) {
      return null;
    }

    return $SikomPropertyCopyWith<$Res>(_value.deviceType!, (value) {
      return _then(_value.copyWith(deviceType: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SikomPropertyCopyWith<$Res>? get deviceModel {
    if (_value.deviceModel == null) {
      return null;
    }

    return $SikomPropertyCopyWith<$Res>(_value.deviceModel!, (value) {
      return _then(_value.copyWith(deviceModel: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SikomPropertyCopyWith<$Res>? get userDefinedName {
    if (_value.userDefinedName == null) {
      return null;
    }

    return $SikomPropertyCopyWith<$Res>(_value.userDefinedName!, (value) {
      return _then(_value.copyWith(userDefinedName: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SikomPropertyCopyWith<$Res>? get deviceModelReadable {
    if (_value.deviceModelReadable == null) {
      return null;
    }

    return $SikomPropertyCopyWith<$Res>(_value.deviceModelReadable!, (value) {
      return _then(_value.copyWith(deviceModelReadable: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SikomPropertyCopyWith<$Res>? get vendorAndDeviceModelReadable {
    if (_value.vendorAndDeviceModelReadable == null) {
      return null;
    }

    return $SikomPropertyCopyWith<$Res>(_value.vendorAndDeviceModelReadable!,
        (value) {
      return _then(
          _value.copyWith(vendorAndDeviceModelReadable: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SikomPropertyCopyWith<$Res>? get currentPowerUsage {
    if (_value.currentPowerUsage == null) {
      return null;
    }

    return $SikomPropertyCopyWith<$Res>(_value.currentPowerUsage!, (value) {
      return _then(_value.copyWith(currentPowerUsage: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SikomPropertyCopyWith<$Res>? get cumulativeEnergy {
    if (_value.cumulativeEnergy == null) {
      return null;
    }

    return $SikomPropertyCopyWith<$Res>(_value.cumulativeEnergy!, (value) {
      return _then(_value.copyWith(cumulativeEnergy: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SikomPropertyCopyWith<$Res>? get cumulativeEnergyToday {
    if (_value.cumulativeEnergyToday == null) {
      return null;
    }

    return $SikomPropertyCopyWith<$Res>(_value.cumulativeEnergyToday!, (value) {
      return _then(_value.copyWith(cumulativeEnergyToday: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SikomPropertyCopyWith<$Res>? get powerVoltage {
    if (_value.powerVoltage == null) {
      return null;
    }

    return $SikomPropertyCopyWith<$Res>(_value.powerVoltage!, (value) {
      return _then(_value.copyWith(powerVoltage: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SikomPropertyCopyWith<$Res>? get switchMode {
    if (_value.switchMode == null) {
      return null;
    }

    return $SikomPropertyCopyWith<$Res>(_value.switchMode!, (value) {
      return _then(_value.copyWith(switchMode: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SikomPropertyCopyWith<$Res>? get switchReadableMode {
    if (_value.switchReadableMode == null) {
      return null;
    }

    return $SikomPropertyCopyWith<$Res>(_value.switchReadableMode!, (value) {
      return _then(_value.copyWith(switchReadableMode: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SikomPropertyCopyWith<$Res>? get switchState {
    if (_value.switchState == null) {
      return null;
    }

    return $SikomPropertyCopyWith<$Res>(_value.switchState!, (value) {
      return _then(_value.copyWith(switchState: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SikomPropertyCopyWith<$Res>? get switchReductionMode {
    if (_value.switchReductionMode == null) {
      return null;
    }

    return $SikomPropertyCopyWith<$Res>(_value.switchReductionMode!, (value) {
      return _then(_value.copyWith(switchReductionMode: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SikomPropertyCopyWith<$Res>? get switchThermostatActive {
    if (_value.switchThermostatActive == null) {
      return null;
    }

    return $SikomPropertyCopyWith<$Res>(_value.switchThermostatActive!,
        (value) {
      return _then(_value.copyWith(switchThermostatActive: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SikomPropertyCopyWith<$Res>? get temperature {
    if (_value.temperature == null) {
      return null;
    }

    return $SikomPropertyCopyWith<$Res>(_value.temperature!, (value) {
      return _then(_value.copyWith(temperature: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SikomPropertyCopyWith<$Res>? get temperatureMin {
    if (_value.temperatureMin == null) {
      return null;
    }

    return $SikomPropertyCopyWith<$Res>(_value.temperatureMin!, (value) {
      return _then(_value.copyWith(temperatureMin: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SikomPropertyCopyWith<$Res>? get temperatureMax {
    if (_value.temperatureMax == null) {
      return null;
    }

    return $SikomPropertyCopyWith<$Res>(_value.temperatureMax!, (value) {
      return _then(_value.copyWith(temperatureMax: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SikomPropertyCopyWith<$Res>? get temperatureEco {
    if (_value.temperatureEco == null) {
      return null;
    }

    return $SikomPropertyCopyWith<$Res>(_value.temperatureEco!, (value) {
      return _then(_value.copyWith(temperatureEco: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SikomPropertyCopyWith<$Res>? get temperatureEcoAdjustment {
    if (_value.temperatureEcoAdjustment == null) {
      return null;
    }

    return $SikomPropertyCopyWith<$Res>(_value.temperatureEcoAdjustment!,
        (value) {
      return _then(_value.copyWith(temperatureEcoAdjustment: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SikomPropertyCopyWith<$Res>? get temperatureComfort {
    if (_value.temperatureComfort == null) {
      return null;
    }

    return $SikomPropertyCopyWith<$Res>(_value.temperatureComfort!, (value) {
      return _then(_value.copyWith(temperatureComfort: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SikomPropertyCopyWith<$Res>? get temperatureComfortAdjustment {
    if (_value.temperatureComfortAdjustment == null) {
      return null;
    }

    return $SikomPropertyCopyWith<$Res>(_value.temperatureComfortAdjustment!,
        (value) {
      return _then(
          _value.copyWith(temperatureComfortAdjustment: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SikomPropertyCopyWith<$Res>? get regulatedState {
    if (_value.regulatedState == null) {
      return null;
    }

    return $SikomPropertyCopyWith<$Res>(_value.regulatedState!, (value) {
      return _then(_value.copyWith(regulatedState: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SikomPropertyCopyWith<$Res>? get regulationPriority {
    if (_value.regulationPriority == null) {
      return null;
    }

    return $SikomPropertyCopyWith<$Res>(_value.regulationPriority!, (value) {
      return _then(_value.copyWith(regulationPriority: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SikomPropertyCopyWith<$Res>? get estimatedRegulatedPower {
    if (_value.estimatedRegulatedPower == null) {
      return null;
    }

    return $SikomPropertyCopyWith<$Res>(_value.estimatedRegulatedPower!,
        (value) {
      return _then(_value.copyWith(estimatedRegulatedPower: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SikomPropertyCopyWith<$Res>? get estimatedUnregulatedPower {
    if (_value.estimatedUnregulatedPower == null) {
      return null;
    }

    return $SikomPropertyCopyWith<$Res>(_value.estimatedUnregulatedPower!,
        (value) {
      return _then(_value.copyWith(estimatedUnregulatedPower: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SikomDevicePropertiesImplCopyWith<$Res>
    implements $SikomDevicePropertiesCopyWith<$Res> {
  factory _$$SikomDevicePropertiesImplCopyWith(
          _$SikomDevicePropertiesImpl value,
          $Res Function(_$SikomDevicePropertiesImpl) then) =
      __$$SikomDevicePropertiesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'vendor_type') SikomProperty vendorType,
      @JsonKey(name: 'best_effort_name') SikomProperty bestEffortName,
      @JsonKey(name: 'latest_update_from_device')
      SikomProperty? latestUpdateFromDevice,
      @JsonKey(name: 'push_update_interval_minutes')
      SikomProperty? pushUpdateIntervalMinutes,
      @JsonKey(name: 'dummy') SikomProperty? dummy,
      @JsonKey(name: 'connection') SikomProperty? connection,
      @JsonKey(name: 'gprsNetname') SikomProperty? gprsNetname,
      @JsonKey(name: 'product_code') SikomProperty? productCode,
      @JsonKey(name: 'model_name') SikomProperty? modelName,
      @JsonKey(name: 'device_type') SikomProperty? deviceType,
      @JsonKey(name: 'device_model') SikomProperty? deviceModel,
      @JsonKey(name: 'user_defined_name') SikomProperty? userDefinedName,
      @JsonKey(name: 'device_model_readable')
      SikomProperty? deviceModelReadable,
      @JsonKey(name: 'vendor_and_device_model_readable')
      SikomProperty? vendorAndDeviceModelReadable,
      @JsonKey(name: 'ams_iap_slp_avg') SikomProperty? currentPowerUsage,
      @JsonKey(name: 'ams_cumulative_plus_calculated_energy')
      SikomProperty? cumulativeEnergy,
      @JsonKey(name: 'ams_cumulative_plus_calculated_energy_today')
      SikomProperty? cumulativeEnergyToday,
      @JsonKey(name: 'ams_power_voltage') SikomProperty? powerVoltage,
      @JsonKey(name: 'switch_mode') SikomProperty? switchMode,
      @JsonKey(name: 'switch_readable_mode') SikomProperty? switchReadableMode,
      @JsonKey(name: 'switch_state') SikomProperty? switchState,
      @JsonKey(name: 'switch_reduction_mode')
      SikomProperty? switchReductionMode,
      @JsonKey(name: 'switch_thermostat_active')
      SikomProperty? switchThermostatActive,
      @JsonKey(name: 'temperature') SikomProperty? temperature,
      @JsonKey(name: 'temperature_min') SikomProperty? temperatureMin,
      @JsonKey(name: 'temperature_max') SikomProperty? temperatureMax,
      @JsonKey(name: 'temperature_eco') SikomProperty? temperatureEco,
      @JsonKey(name: 'temperature_eco_prlsa')
      SikomProperty? temperatureEcoAdjustment,
      @JsonKey(name: 'temperature_comfort') SikomProperty? temperatureComfort,
      @JsonKey(name: 'temperature_comfort_prlsa')
      SikomProperty? temperatureComfortAdjustment,
      @JsonKey(name: 'ams_regulated_state') SikomProperty? regulatedState,
      @JsonKey(name: 'ams_regulation_priority')
      SikomProperty? regulationPriority,
      @JsonKey(name: 'estimated_reg_power')
      SikomProperty? estimatedRegulatedPower,
      @JsonKey(name: 'estimated_unreg_power')
      SikomProperty? estimatedUnregulatedPower});

  @override
  $SikomPropertyCopyWith<$Res> get vendorType;
  @override
  $SikomPropertyCopyWith<$Res> get bestEffortName;
  @override
  $SikomPropertyCopyWith<$Res>? get latestUpdateFromDevice;
  @override
  $SikomPropertyCopyWith<$Res>? get pushUpdateIntervalMinutes;
  @override
  $SikomPropertyCopyWith<$Res>? get dummy;
  @override
  $SikomPropertyCopyWith<$Res>? get connection;
  @override
  $SikomPropertyCopyWith<$Res>? get gprsNetname;
  @override
  $SikomPropertyCopyWith<$Res>? get productCode;
  @override
  $SikomPropertyCopyWith<$Res>? get modelName;
  @override
  $SikomPropertyCopyWith<$Res>? get deviceType;
  @override
  $SikomPropertyCopyWith<$Res>? get deviceModel;
  @override
  $SikomPropertyCopyWith<$Res>? get userDefinedName;
  @override
  $SikomPropertyCopyWith<$Res>? get deviceModelReadable;
  @override
  $SikomPropertyCopyWith<$Res>? get vendorAndDeviceModelReadable;
  @override
  $SikomPropertyCopyWith<$Res>? get currentPowerUsage;
  @override
  $SikomPropertyCopyWith<$Res>? get cumulativeEnergy;
  @override
  $SikomPropertyCopyWith<$Res>? get cumulativeEnergyToday;
  @override
  $SikomPropertyCopyWith<$Res>? get powerVoltage;
  @override
  $SikomPropertyCopyWith<$Res>? get switchMode;
  @override
  $SikomPropertyCopyWith<$Res>? get switchReadableMode;
  @override
  $SikomPropertyCopyWith<$Res>? get switchState;
  @override
  $SikomPropertyCopyWith<$Res>? get switchReductionMode;
  @override
  $SikomPropertyCopyWith<$Res>? get switchThermostatActive;
  @override
  $SikomPropertyCopyWith<$Res>? get temperature;
  @override
  $SikomPropertyCopyWith<$Res>? get temperatureMin;
  @override
  $SikomPropertyCopyWith<$Res>? get temperatureMax;
  @override
  $SikomPropertyCopyWith<$Res>? get temperatureEco;
  @override
  $SikomPropertyCopyWith<$Res>? get temperatureEcoAdjustment;
  @override
  $SikomPropertyCopyWith<$Res>? get temperatureComfort;
  @override
  $SikomPropertyCopyWith<$Res>? get temperatureComfortAdjustment;
  @override
  $SikomPropertyCopyWith<$Res>? get regulatedState;
  @override
  $SikomPropertyCopyWith<$Res>? get regulationPriority;
  @override
  $SikomPropertyCopyWith<$Res>? get estimatedRegulatedPower;
  @override
  $SikomPropertyCopyWith<$Res>? get estimatedUnregulatedPower;
}

/// @nodoc
class __$$SikomDevicePropertiesImplCopyWithImpl<$Res>
    extends _$SikomDevicePropertiesCopyWithImpl<$Res,
        _$SikomDevicePropertiesImpl>
    implements _$$SikomDevicePropertiesImplCopyWith<$Res> {
  __$$SikomDevicePropertiesImplCopyWithImpl(_$SikomDevicePropertiesImpl _value,
      $Res Function(_$SikomDevicePropertiesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vendorType = null,
    Object? bestEffortName = null,
    Object? latestUpdateFromDevice = freezed,
    Object? pushUpdateIntervalMinutes = freezed,
    Object? dummy = freezed,
    Object? connection = freezed,
    Object? gprsNetname = freezed,
    Object? productCode = freezed,
    Object? modelName = freezed,
    Object? deviceType = freezed,
    Object? deviceModel = freezed,
    Object? userDefinedName = freezed,
    Object? deviceModelReadable = freezed,
    Object? vendorAndDeviceModelReadable = freezed,
    Object? currentPowerUsage = freezed,
    Object? cumulativeEnergy = freezed,
    Object? cumulativeEnergyToday = freezed,
    Object? powerVoltage = freezed,
    Object? switchMode = freezed,
    Object? switchReadableMode = freezed,
    Object? switchState = freezed,
    Object? switchReductionMode = freezed,
    Object? switchThermostatActive = freezed,
    Object? temperature = freezed,
    Object? temperatureMin = freezed,
    Object? temperatureMax = freezed,
    Object? temperatureEco = freezed,
    Object? temperatureEcoAdjustment = freezed,
    Object? temperatureComfort = freezed,
    Object? temperatureComfortAdjustment = freezed,
    Object? regulatedState = freezed,
    Object? regulationPriority = freezed,
    Object? estimatedRegulatedPower = freezed,
    Object? estimatedUnregulatedPower = freezed,
  }) {
    return _then(_$SikomDevicePropertiesImpl(
      vendorType: null == vendorType
          ? _value.vendorType
          : vendorType // ignore: cast_nullable_to_non_nullable
              as SikomProperty,
      bestEffortName: null == bestEffortName
          ? _value.bestEffortName
          : bestEffortName // ignore: cast_nullable_to_non_nullable
              as SikomProperty,
      latestUpdateFromDevice: freezed == latestUpdateFromDevice
          ? _value.latestUpdateFromDevice
          : latestUpdateFromDevice // ignore: cast_nullable_to_non_nullable
              as SikomProperty?,
      pushUpdateIntervalMinutes: freezed == pushUpdateIntervalMinutes
          ? _value.pushUpdateIntervalMinutes
          : pushUpdateIntervalMinutes // ignore: cast_nullable_to_non_nullable
              as SikomProperty?,
      dummy: freezed == dummy
          ? _value.dummy
          : dummy // ignore: cast_nullable_to_non_nullable
              as SikomProperty?,
      connection: freezed == connection
          ? _value.connection
          : connection // ignore: cast_nullable_to_non_nullable
              as SikomProperty?,
      gprsNetname: freezed == gprsNetname
          ? _value.gprsNetname
          : gprsNetname // ignore: cast_nullable_to_non_nullable
              as SikomProperty?,
      productCode: freezed == productCode
          ? _value.productCode
          : productCode // ignore: cast_nullable_to_non_nullable
              as SikomProperty?,
      modelName: freezed == modelName
          ? _value.modelName
          : modelName // ignore: cast_nullable_to_non_nullable
              as SikomProperty?,
      deviceType: freezed == deviceType
          ? _value.deviceType
          : deviceType // ignore: cast_nullable_to_non_nullable
              as SikomProperty?,
      deviceModel: freezed == deviceModel
          ? _value.deviceModel
          : deviceModel // ignore: cast_nullable_to_non_nullable
              as SikomProperty?,
      userDefinedName: freezed == userDefinedName
          ? _value.userDefinedName
          : userDefinedName // ignore: cast_nullable_to_non_nullable
              as SikomProperty?,
      deviceModelReadable: freezed == deviceModelReadable
          ? _value.deviceModelReadable
          : deviceModelReadable // ignore: cast_nullable_to_non_nullable
              as SikomProperty?,
      vendorAndDeviceModelReadable: freezed == vendorAndDeviceModelReadable
          ? _value.vendorAndDeviceModelReadable
          : vendorAndDeviceModelReadable // ignore: cast_nullable_to_non_nullable
              as SikomProperty?,
      currentPowerUsage: freezed == currentPowerUsage
          ? _value.currentPowerUsage
          : currentPowerUsage // ignore: cast_nullable_to_non_nullable
              as SikomProperty?,
      cumulativeEnergy: freezed == cumulativeEnergy
          ? _value.cumulativeEnergy
          : cumulativeEnergy // ignore: cast_nullable_to_non_nullable
              as SikomProperty?,
      cumulativeEnergyToday: freezed == cumulativeEnergyToday
          ? _value.cumulativeEnergyToday
          : cumulativeEnergyToday // ignore: cast_nullable_to_non_nullable
              as SikomProperty?,
      powerVoltage: freezed == powerVoltage
          ? _value.powerVoltage
          : powerVoltage // ignore: cast_nullable_to_non_nullable
              as SikomProperty?,
      switchMode: freezed == switchMode
          ? _value.switchMode
          : switchMode // ignore: cast_nullable_to_non_nullable
              as SikomProperty?,
      switchReadableMode: freezed == switchReadableMode
          ? _value.switchReadableMode
          : switchReadableMode // ignore: cast_nullable_to_non_nullable
              as SikomProperty?,
      switchState: freezed == switchState
          ? _value.switchState
          : switchState // ignore: cast_nullable_to_non_nullable
              as SikomProperty?,
      switchReductionMode: freezed == switchReductionMode
          ? _value.switchReductionMode
          : switchReductionMode // ignore: cast_nullable_to_non_nullable
              as SikomProperty?,
      switchThermostatActive: freezed == switchThermostatActive
          ? _value.switchThermostatActive
          : switchThermostatActive // ignore: cast_nullable_to_non_nullable
              as SikomProperty?,
      temperature: freezed == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as SikomProperty?,
      temperatureMin: freezed == temperatureMin
          ? _value.temperatureMin
          : temperatureMin // ignore: cast_nullable_to_non_nullable
              as SikomProperty?,
      temperatureMax: freezed == temperatureMax
          ? _value.temperatureMax
          : temperatureMax // ignore: cast_nullable_to_non_nullable
              as SikomProperty?,
      temperatureEco: freezed == temperatureEco
          ? _value.temperatureEco
          : temperatureEco // ignore: cast_nullable_to_non_nullable
              as SikomProperty?,
      temperatureEcoAdjustment: freezed == temperatureEcoAdjustment
          ? _value.temperatureEcoAdjustment
          : temperatureEcoAdjustment // ignore: cast_nullable_to_non_nullable
              as SikomProperty?,
      temperatureComfort: freezed == temperatureComfort
          ? _value.temperatureComfort
          : temperatureComfort // ignore: cast_nullable_to_non_nullable
              as SikomProperty?,
      temperatureComfortAdjustment: freezed == temperatureComfortAdjustment
          ? _value.temperatureComfortAdjustment
          : temperatureComfortAdjustment // ignore: cast_nullable_to_non_nullable
              as SikomProperty?,
      regulatedState: freezed == regulatedState
          ? _value.regulatedState
          : regulatedState // ignore: cast_nullable_to_non_nullable
              as SikomProperty?,
      regulationPriority: freezed == regulationPriority
          ? _value.regulationPriority
          : regulationPriority // ignore: cast_nullable_to_non_nullable
              as SikomProperty?,
      estimatedRegulatedPower: freezed == estimatedRegulatedPower
          ? _value.estimatedRegulatedPower
          : estimatedRegulatedPower // ignore: cast_nullable_to_non_nullable
              as SikomProperty?,
      estimatedUnregulatedPower: freezed == estimatedUnregulatedPower
          ? _value.estimatedUnregulatedPower
          : estimatedUnregulatedPower // ignore: cast_nullable_to_non_nullable
              as SikomProperty?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SikomDevicePropertiesImpl extends _SikomDeviceProperties {
  const _$SikomDevicePropertiesImpl(
      {@JsonKey(name: 'vendor_type') required this.vendorType,
      @JsonKey(name: 'best_effort_name') required this.bestEffortName,
      @JsonKey(name: 'latest_update_from_device') this.latestUpdateFromDevice,
      @JsonKey(name: 'push_update_interval_minutes')
      this.pushUpdateIntervalMinutes,
      @JsonKey(name: 'dummy') this.dummy,
      @JsonKey(name: 'connection') this.connection,
      @JsonKey(name: 'gprsNetname') this.gprsNetname,
      @JsonKey(name: 'product_code') this.productCode,
      @JsonKey(name: 'model_name') this.modelName,
      @JsonKey(name: 'device_type') this.deviceType,
      @JsonKey(name: 'device_model') this.deviceModel,
      @JsonKey(name: 'user_defined_name') this.userDefinedName,
      @JsonKey(name: 'device_model_readable') this.deviceModelReadable,
      @JsonKey(name: 'vendor_and_device_model_readable')
      this.vendorAndDeviceModelReadable,
      @JsonKey(name: 'ams_iap_slp_avg') this.currentPowerUsage,
      @JsonKey(name: 'ams_cumulative_plus_calculated_energy')
      this.cumulativeEnergy,
      @JsonKey(name: 'ams_cumulative_plus_calculated_energy_today')
      this.cumulativeEnergyToday,
      @JsonKey(name: 'ams_power_voltage') this.powerVoltage,
      @JsonKey(name: 'switch_mode') this.switchMode,
      @JsonKey(name: 'switch_readable_mode') this.switchReadableMode,
      @JsonKey(name: 'switch_state') this.switchState,
      @JsonKey(name: 'switch_reduction_mode') this.switchReductionMode,
      @JsonKey(name: 'switch_thermostat_active') this.switchThermostatActive,
      @JsonKey(name: 'temperature') this.temperature,
      @JsonKey(name: 'temperature_min') this.temperatureMin,
      @JsonKey(name: 'temperature_max') this.temperatureMax,
      @JsonKey(name: 'temperature_eco') this.temperatureEco,
      @JsonKey(name: 'temperature_eco_prlsa') this.temperatureEcoAdjustment,
      @JsonKey(name: 'temperature_comfort') this.temperatureComfort,
      @JsonKey(name: 'temperature_comfort_prlsa')
      this.temperatureComfortAdjustment,
      @JsonKey(name: 'ams_regulated_state') this.regulatedState,
      @JsonKey(name: 'ams_regulation_priority') this.regulationPriority,
      @JsonKey(name: 'estimated_reg_power') this.estimatedRegulatedPower,
      @JsonKey(name: 'estimated_unreg_power') this.estimatedUnregulatedPower})
      : super._();

  factory _$SikomDevicePropertiesImpl.fromJson(Map<String, dynamic> json) =>
      _$$SikomDevicePropertiesImplFromJson(json);

  @override
  @JsonKey(name: 'vendor_type')
  final SikomProperty vendorType;
  @override
  @JsonKey(name: 'best_effort_name')
  final SikomProperty bestEffortName;
  @override
  @JsonKey(name: 'latest_update_from_device')
  final SikomProperty? latestUpdateFromDevice;
  @override
  @JsonKey(name: 'push_update_interval_minutes')
  final SikomProperty? pushUpdateIntervalMinutes;
  @override
  @JsonKey(name: 'dummy')
  final SikomProperty? dummy;
  @override
  @JsonKey(name: 'connection')
  final SikomProperty? connection;
  @override
  @JsonKey(name: 'gprsNetname')
  final SikomProperty? gprsNetname;
  @override
  @JsonKey(name: 'product_code')
  final SikomProperty? productCode;
  @override
  @JsonKey(name: 'model_name')
  final SikomProperty? modelName;
  @override
  @JsonKey(name: 'device_type')
  final SikomProperty? deviceType;
  @override
  @JsonKey(name: 'device_model')
  final SikomProperty? deviceModel;
  @override
  @JsonKey(name: 'user_defined_name')
  final SikomProperty? userDefinedName;
  @override
  @JsonKey(name: 'device_model_readable')
  final SikomProperty? deviceModelReadable;
  @override
  @JsonKey(name: 'vendor_and_device_model_readable')
  final SikomProperty? vendorAndDeviceModelReadable;
// DO NOT USE 'ams_current_power_usage', it is quite "random"
// since only given each minute according to Sikom. Use 'ams_iap_slp_avg'
// (Average Imported Active Power since last push) instead.
  @override
  @JsonKey(name: 'ams_iap_slp_avg')
  final SikomProperty? currentPowerUsage;
// This is the most frequently updated total meter reading in [Wh]
// consisting of the "official" value 'ams_cumulative_imported_energy'
// (active energy) from the meter itself (updated every hour)"
  @override
  @JsonKey(name: 'ams_cumulative_plus_calculated_energy')
  final SikomProperty? cumulativeEnergy;
  @override
  @JsonKey(name: 'ams_cumulative_plus_calculated_energy_today')
  final SikomProperty? cumulativeEnergyToday;
  @override
  @JsonKey(name: 'ams_power_voltage')
  final SikomProperty? powerVoltage;
// Commanded mode of a switch. May differ from switch_state (actual relay-state) for instance
// when under thermostat control. Now how (for thermostats) a value of 0 does not have a single meaning
// (it may mean either "eco", "anti_freeze" and "off"). A value of 1 on the other hand is usually precise
// (Meaning "on" if dumb switch and "comfort" if thermostat). Note that for products like
// "ProductCode.CTMmTouchOne" this value should be ignored (considered irrelevant) when
// "DeviceProperty.switch_thermostat_active" is 0. Same issues with "ProductCode.CTMmTouchDim"
// and percent level == 99. See also "DeviceProperty.switch_reduction_mode" which explains (in plain text)
// what is the precise meaning of 0 and 1.
  @override
  @JsonKey(name: 'switch_mode')
  final SikomProperty? switchMode;
// Human-readable text explaining current "DeviceProperty.switch_mode" (off, eco, comfort, etc.)
  @override
  @JsonKey(name: 'switch_readable_mode')
  final SikomProperty? switchReadableMode;
// The actual relay state of the switch (on / off)
  @override
  @JsonKey(name: 'switch_state')
  final SikomProperty? switchState;
// The precise meaning of values 0 and 1 in "DeviceProperty.switch_mode".
  @override
  @JsonKey(name: 'switch_reduction_mode')
  final SikomProperty? switchReductionMode;
// Eco / comfort active or not. If 0 then switch_mode 0 will usually mean "off" or "anti_freeze"
// and 1 will not have any meaning. If 1 then switch_mode 0 will mean "eco" and 1 will mean "comfort".
// Not relevant to set for some kind of thermostats (for instance SI-3, SI-4 or CTM mTouch One).
// Not desired to set for other thermostats (because of danger of freezing water for instance).
  @override
  @JsonKey(name: 'switch_thermostat_active')
  final SikomProperty? switchThermostatActive;
// Air temperature (inside). Note that will always be the most important temperature (the one used for controlling)
// while "DeviceProperty.temperature_2" will be the secondary temperature. This is (pr Feb 2019) only relevant for
// "ProductCode.CTMmTouchOne" which can control based on either air or floor-temperature.
  @override
  @JsonKey(name: 'temperature')
  final SikomProperty? temperature;
// Minimum allowed temperature (at or above this value will result in temperature_notification_triggered).
  @override
  @JsonKey(name: 'temperature_min')
  final SikomProperty? temperatureMin;
// Maximum allowed temperature (at or below this value will result in temperature_notification_triggered).
  @override
  @JsonKey(name: 'temperature_max')
  final SikomProperty? temperatureMax;
// Thermostat temperature in switch_mode 'eco'
  @override
  @JsonKey(name: 'temperature_eco')
  final SikomProperty? temperatureEco;
// (prlsa = PowerRegulatorListenerSilentAdjustment). Number of degrees Celsius that the PowerRegulatorListener
// has silently adjusted the temperature in the background. (As of Feb 2019 will always be a negative value,
// that is, adjustment is done by lowering the temperature. But, in principle we might also adjust the temperature
// upwards, for instance heating the house extra before morning, in order for the thermostats to turn off in the
// morning). While silent adjustment is in force, temperature_eco / temperature_comfort will be adjusted with this
// value, keeping the fact of a adjustment "hidden" from BPAPI-user only relating to temperature_eco /
// temperature_comfort.
  @override
  @JsonKey(name: 'temperature_eco_prlsa')
  final SikomProperty? temperatureEcoAdjustment;
// Thermostat temperature in switch_mode 'comfort'
  @override
  @JsonKey(name: 'temperature_comfort')
  final SikomProperty? temperatureComfort;
// (prlsa = PowerRegulatorListenerSilentAdjustment). Number of degrees Celsius that the PowerRegulatorListener
// has silently adjusted the temperature in the background. (As of Feb 2019 will always be a negative value,
// that is, adjustment is done by lowering the temperature. But, in principle we might also adjust the temperature
// upwards, for instance heating the house extra before morning, in order for the thermostats to turn off in the
// morning). While silent adjustment is in force, temperature_eco / temperature_comfort will be adjusted with this
// value, keeping the fact of a adjustment "hidden" from BPAPI-user only relating to temperature_eco /
// temperature_comfort.
  @override
  @JsonKey(name: 'temperature_comfort_prlsa')
  final SikomProperty? temperatureComfortAdjustment;
// Tells whether the device is currently being regulated
// or not (0 = not regulated 1 = import regulated 2 = export regulated)
  @override
  @JsonKey(name: 'ams_regulated_state')
  final SikomProperty? regulatedState;
// The power (in W) that this device releases when regulated out, as estimated by
// the system itself, compared to when regulated in (raw value, no PWM or other partial
// regulation scheme accounted for). Will be a negative value (representing the power
// "added" when the device is regulated out. Only relevant to set for devices which have
// switch_mode (and when an ECOEnergyController is installed)
  @override
  @JsonKey(name: 'ams_regulation_priority')
  final SikomProperty? regulationPriority;
  @override
  @JsonKey(name: 'estimated_reg_power')
  final SikomProperty? estimatedRegulatedPower;
// The power (in W) that this device draws when unregulated, as estimated by the system itself,
// compared to when regulated out (raw value, no PWM or other partial regulation scheme accounted for).
// Will be a positive value. Only relevant to set for devices which have
// switch_mode (and when an ECOEnergyController)
  @override
  @JsonKey(name: 'estimated_unreg_power')
  final SikomProperty? estimatedUnregulatedPower;

  @override
  String toString() {
    return 'SikomDeviceProperties(vendorType: $vendorType, bestEffortName: $bestEffortName, latestUpdateFromDevice: $latestUpdateFromDevice, pushUpdateIntervalMinutes: $pushUpdateIntervalMinutes, dummy: $dummy, connection: $connection, gprsNetname: $gprsNetname, productCode: $productCode, modelName: $modelName, deviceType: $deviceType, deviceModel: $deviceModel, userDefinedName: $userDefinedName, deviceModelReadable: $deviceModelReadable, vendorAndDeviceModelReadable: $vendorAndDeviceModelReadable, currentPowerUsage: $currentPowerUsage, cumulativeEnergy: $cumulativeEnergy, cumulativeEnergyToday: $cumulativeEnergyToday, powerVoltage: $powerVoltage, switchMode: $switchMode, switchReadableMode: $switchReadableMode, switchState: $switchState, switchReductionMode: $switchReductionMode, switchThermostatActive: $switchThermostatActive, temperature: $temperature, temperatureMin: $temperatureMin, temperatureMax: $temperatureMax, temperatureEco: $temperatureEco, temperatureEcoAdjustment: $temperatureEcoAdjustment, temperatureComfort: $temperatureComfort, temperatureComfortAdjustment: $temperatureComfortAdjustment, regulatedState: $regulatedState, regulationPriority: $regulationPriority, estimatedRegulatedPower: $estimatedRegulatedPower, estimatedUnregulatedPower: $estimatedUnregulatedPower)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SikomDevicePropertiesImpl &&
            (identical(other.vendorType, vendorType) ||
                other.vendorType == vendorType) &&
            (identical(other.bestEffortName, bestEffortName) ||
                other.bestEffortName == bestEffortName) &&
            (identical(other.latestUpdateFromDevice, latestUpdateFromDevice) ||
                other.latestUpdateFromDevice == latestUpdateFromDevice) &&
            (identical(other.pushUpdateIntervalMinutes, pushUpdateIntervalMinutes) ||
                other.pushUpdateIntervalMinutes == pushUpdateIntervalMinutes) &&
            (identical(other.dummy, dummy) || other.dummy == dummy) &&
            (identical(other.connection, connection) ||
                other.connection == connection) &&
            (identical(other.gprsNetname, gprsNetname) ||
                other.gprsNetname == gprsNetname) &&
            (identical(other.productCode, productCode) ||
                other.productCode == productCode) &&
            (identical(other.modelName, modelName) ||
                other.modelName == modelName) &&
            (identical(other.deviceType, deviceType) ||
                other.deviceType == deviceType) &&
            (identical(other.deviceModel, deviceModel) ||
                other.deviceModel == deviceModel) &&
            (identical(other.userDefinedName, userDefinedName) ||
                other.userDefinedName == userDefinedName) &&
            (identical(other.deviceModelReadable, deviceModelReadable) ||
                other.deviceModelReadable == deviceModelReadable) &&
            (identical(other.vendorAndDeviceModelReadable, vendorAndDeviceModelReadable) ||
                other.vendorAndDeviceModelReadable ==
                    vendorAndDeviceModelReadable) &&
            (identical(other.currentPowerUsage, currentPowerUsage) ||
                other.currentPowerUsage == currentPowerUsage) &&
            (identical(other.cumulativeEnergy, cumulativeEnergy) ||
                other.cumulativeEnergy == cumulativeEnergy) &&
            (identical(other.cumulativeEnergyToday, cumulativeEnergyToday) ||
                other.cumulativeEnergyToday == cumulativeEnergyToday) &&
            (identical(other.powerVoltage, powerVoltage) ||
                other.powerVoltage == powerVoltage) &&
            (identical(other.switchMode, switchMode) ||
                other.switchMode == switchMode) &&
            (identical(other.switchReadableMode, switchReadableMode) ||
                other.switchReadableMode == switchReadableMode) &&
            (identical(other.switchState, switchState) ||
                other.switchState == switchState) &&
            (identical(other.switchReductionMode, switchReductionMode) ||
                other.switchReductionMode == switchReductionMode) &&
            (identical(other.switchThermostatActive, switchThermostatActive) ||
                other.switchThermostatActive == switchThermostatActive) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.temperatureMin, temperatureMin) ||
                other.temperatureMin == temperatureMin) &&
            (identical(other.temperatureMax, temperatureMax) ||
                other.temperatureMax == temperatureMax) &&
            (identical(other.temperatureEco, temperatureEco) ||
                other.temperatureEco == temperatureEco) &&
            (identical(other.temperatureEcoAdjustment, temperatureEcoAdjustment) ||
                other.temperatureEcoAdjustment == temperatureEcoAdjustment) &&
            (identical(other.temperatureComfort, temperatureComfort) ||
                other.temperatureComfort == temperatureComfort) &&
            (identical(other.temperatureComfortAdjustment, temperatureComfortAdjustment) ||
                other.temperatureComfortAdjustment ==
                    temperatureComfortAdjustment) &&
            (identical(other.regulatedState, regulatedState) || other.regulatedState == regulatedState) &&
            (identical(other.regulationPriority, regulationPriority) || other.regulationPriority == regulationPriority) &&
            (identical(other.estimatedRegulatedPower, estimatedRegulatedPower) || other.estimatedRegulatedPower == estimatedRegulatedPower) &&
            (identical(other.estimatedUnregulatedPower, estimatedUnregulatedPower) || other.estimatedUnregulatedPower == estimatedUnregulatedPower));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        vendorType,
        bestEffortName,
        latestUpdateFromDevice,
        pushUpdateIntervalMinutes,
        dummy,
        connection,
        gprsNetname,
        productCode,
        modelName,
        deviceType,
        deviceModel,
        userDefinedName,
        deviceModelReadable,
        vendorAndDeviceModelReadable,
        currentPowerUsage,
        cumulativeEnergy,
        cumulativeEnergyToday,
        powerVoltage,
        switchMode,
        switchReadableMode,
        switchState,
        switchReductionMode,
        switchThermostatActive,
        temperature,
        temperatureMin,
        temperatureMax,
        temperatureEco,
        temperatureEcoAdjustment,
        temperatureComfort,
        temperatureComfortAdjustment,
        regulatedState,
        regulationPriority,
        estimatedRegulatedPower,
        estimatedUnregulatedPower
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SikomDevicePropertiesImplCopyWith<_$SikomDevicePropertiesImpl>
      get copyWith => __$$SikomDevicePropertiesImplCopyWithImpl<
          _$SikomDevicePropertiesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SikomDevicePropertiesImplToJson(
      this,
    );
  }
}

abstract class _SikomDeviceProperties extends SikomDeviceProperties {
  const factory _SikomDeviceProperties(
      {@JsonKey(name: 'vendor_type') required final SikomProperty vendorType,
      @JsonKey(name: 'best_effort_name')
      required final SikomProperty bestEffortName,
      @JsonKey(name: 'latest_update_from_device')
      final SikomProperty? latestUpdateFromDevice,
      @JsonKey(name: 'push_update_interval_minutes')
      final SikomProperty? pushUpdateIntervalMinutes,
      @JsonKey(name: 'dummy') final SikomProperty? dummy,
      @JsonKey(name: 'connection') final SikomProperty? connection,
      @JsonKey(name: 'gprsNetname') final SikomProperty? gprsNetname,
      @JsonKey(name: 'product_code') final SikomProperty? productCode,
      @JsonKey(name: 'model_name') final SikomProperty? modelName,
      @JsonKey(name: 'device_type') final SikomProperty? deviceType,
      @JsonKey(name: 'device_model') final SikomProperty? deviceModel,
      @JsonKey(name: 'user_defined_name') final SikomProperty? userDefinedName,
      @JsonKey(name: 'device_model_readable')
      final SikomProperty? deviceModelReadable,
      @JsonKey(name: 'vendor_and_device_model_readable')
      final SikomProperty? vendorAndDeviceModelReadable,
      @JsonKey(name: 'ams_iap_slp_avg') final SikomProperty? currentPowerUsage,
      @JsonKey(name: 'ams_cumulative_plus_calculated_energy')
      final SikomProperty? cumulativeEnergy,
      @JsonKey(name: 'ams_cumulative_plus_calculated_energy_today')
      final SikomProperty? cumulativeEnergyToday,
      @JsonKey(name: 'ams_power_voltage') final SikomProperty? powerVoltage,
      @JsonKey(name: 'switch_mode') final SikomProperty? switchMode,
      @JsonKey(name: 'switch_readable_mode')
      final SikomProperty? switchReadableMode,
      @JsonKey(name: 'switch_state') final SikomProperty? switchState,
      @JsonKey(name: 'switch_reduction_mode')
      final SikomProperty? switchReductionMode,
      @JsonKey(name: 'switch_thermostat_active')
      final SikomProperty? switchThermostatActive,
      @JsonKey(name: 'temperature') final SikomProperty? temperature,
      @JsonKey(name: 'temperature_min') final SikomProperty? temperatureMin,
      @JsonKey(name: 'temperature_max') final SikomProperty? temperatureMax,
      @JsonKey(name: 'temperature_eco') final SikomProperty? temperatureEco,
      @JsonKey(name: 'temperature_eco_prlsa')
      final SikomProperty? temperatureEcoAdjustment,
      @JsonKey(name: 'temperature_comfort')
      final SikomProperty? temperatureComfort,
      @JsonKey(name: 'temperature_comfort_prlsa')
      final SikomProperty? temperatureComfortAdjustment,
      @JsonKey(name: 'ams_regulated_state') final SikomProperty? regulatedState,
      @JsonKey(name: 'ams_regulation_priority')
      final SikomProperty? regulationPriority,
      @JsonKey(name: 'estimated_reg_power')
      final SikomProperty? estimatedRegulatedPower,
      @JsonKey(name: 'estimated_unreg_power')
      final SikomProperty?
          estimatedUnregulatedPower}) = _$SikomDevicePropertiesImpl;
  const _SikomDeviceProperties._() : super._();

  factory _SikomDeviceProperties.fromJson(Map<String, dynamic> json) =
      _$SikomDevicePropertiesImpl.fromJson;

  @override
  @JsonKey(name: 'vendor_type')
  SikomProperty get vendorType;
  @override
  @JsonKey(name: 'best_effort_name')
  SikomProperty get bestEffortName;
  @override
  @JsonKey(name: 'latest_update_from_device')
  SikomProperty? get latestUpdateFromDevice;
  @override
  @JsonKey(name: 'push_update_interval_minutes')
  SikomProperty? get pushUpdateIntervalMinutes;
  @override
  @JsonKey(name: 'dummy')
  SikomProperty? get dummy;
  @override
  @JsonKey(name: 'connection')
  SikomProperty? get connection;
  @override
  @JsonKey(name: 'gprsNetname')
  SikomProperty? get gprsNetname;
  @override
  @JsonKey(name: 'product_code')
  SikomProperty? get productCode;
  @override
  @JsonKey(name: 'model_name')
  SikomProperty? get modelName;
  @override
  @JsonKey(name: 'device_type')
  SikomProperty? get deviceType;
  @override
  @JsonKey(name: 'device_model')
  SikomProperty? get deviceModel;
  @override
  @JsonKey(name: 'user_defined_name')
  SikomProperty? get userDefinedName;
  @override
  @JsonKey(name: 'device_model_readable')
  SikomProperty? get deviceModelReadable;
  @override
  @JsonKey(name: 'vendor_and_device_model_readable')
  SikomProperty? get vendorAndDeviceModelReadable;
  @override // DO NOT USE 'ams_current_power_usage', it is quite "random"
// since only given each minute according to Sikom. Use 'ams_iap_slp_avg'
// (Average Imported Active Power since last push) instead.
  @JsonKey(name: 'ams_iap_slp_avg')
  SikomProperty? get currentPowerUsage;
  @override // This is the most frequently updated total meter reading in [Wh]
// consisting of the "official" value 'ams_cumulative_imported_energy'
// (active energy) from the meter itself (updated every hour)"
  @JsonKey(name: 'ams_cumulative_plus_calculated_energy')
  SikomProperty? get cumulativeEnergy;
  @override
  @JsonKey(name: 'ams_cumulative_plus_calculated_energy_today')
  SikomProperty? get cumulativeEnergyToday;
  @override
  @JsonKey(name: 'ams_power_voltage')
  SikomProperty? get powerVoltage;
  @override // Commanded mode of a switch. May differ from switch_state (actual relay-state) for instance
// when under thermostat control. Now how (for thermostats) a value of 0 does not have a single meaning
// (it may mean either "eco", "anti_freeze" and "off"). A value of 1 on the other hand is usually precise
// (Meaning "on" if dumb switch and "comfort" if thermostat). Note that for products like
// "ProductCode.CTMmTouchOne" this value should be ignored (considered irrelevant) when
// "DeviceProperty.switch_thermostat_active" is 0. Same issues with "ProductCode.CTMmTouchDim"
// and percent level == 99. See also "DeviceProperty.switch_reduction_mode" which explains (in plain text)
// what is the precise meaning of 0 and 1.
  @JsonKey(name: 'switch_mode')
  SikomProperty? get switchMode;
  @override // Human-readable text explaining current "DeviceProperty.switch_mode" (off, eco, comfort, etc.)
  @JsonKey(name: 'switch_readable_mode')
  SikomProperty? get switchReadableMode;
  @override // The actual relay state of the switch (on / off)
  @JsonKey(name: 'switch_state')
  SikomProperty? get switchState;
  @override // The precise meaning of values 0 and 1 in "DeviceProperty.switch_mode".
  @JsonKey(name: 'switch_reduction_mode')
  SikomProperty? get switchReductionMode;
  @override // Eco / comfort active or not. If 0 then switch_mode 0 will usually mean "off" or "anti_freeze"
// and 1 will not have any meaning. If 1 then switch_mode 0 will mean "eco" and 1 will mean "comfort".
// Not relevant to set for some kind of thermostats (for instance SI-3, SI-4 or CTM mTouch One).
// Not desired to set for other thermostats (because of danger of freezing water for instance).
  @JsonKey(name: 'switch_thermostat_active')
  SikomProperty? get switchThermostatActive;
  @override // Air temperature (inside). Note that will always be the most important temperature (the one used for controlling)
// while "DeviceProperty.temperature_2" will be the secondary temperature. This is (pr Feb 2019) only relevant for
// "ProductCode.CTMmTouchOne" which can control based on either air or floor-temperature.
  @JsonKey(name: 'temperature')
  SikomProperty? get temperature;
  @override // Minimum allowed temperature (at or above this value will result in temperature_notification_triggered).
  @JsonKey(name: 'temperature_min')
  SikomProperty? get temperatureMin;
  @override // Maximum allowed temperature (at or below this value will result in temperature_notification_triggered).
  @JsonKey(name: 'temperature_max')
  SikomProperty? get temperatureMax;
  @override // Thermostat temperature in switch_mode 'eco'
  @JsonKey(name: 'temperature_eco')
  SikomProperty? get temperatureEco;
  @override // (prlsa = PowerRegulatorListenerSilentAdjustment). Number of degrees Celsius that the PowerRegulatorListener
// has silently adjusted the temperature in the background. (As of Feb 2019 will always be a negative value,
// that is, adjustment is done by lowering the temperature. But, in principle we might also adjust the temperature
// upwards, for instance heating the house extra before morning, in order for the thermostats to turn off in the
// morning). While silent adjustment is in force, temperature_eco / temperature_comfort will be adjusted with this
// value, keeping the fact of a adjustment "hidden" from BPAPI-user only relating to temperature_eco /
// temperature_comfort.
  @JsonKey(name: 'temperature_eco_prlsa')
  SikomProperty? get temperatureEcoAdjustment;
  @override // Thermostat temperature in switch_mode 'comfort'
  @JsonKey(name: 'temperature_comfort')
  SikomProperty? get temperatureComfort;
  @override // (prlsa = PowerRegulatorListenerSilentAdjustment). Number of degrees Celsius that the PowerRegulatorListener
// has silently adjusted the temperature in the background. (As of Feb 2019 will always be a negative value,
// that is, adjustment is done by lowering the temperature. But, in principle we might also adjust the temperature
// upwards, for instance heating the house extra before morning, in order for the thermostats to turn off in the
// morning). While silent adjustment is in force, temperature_eco / temperature_comfort will be adjusted with this
// value, keeping the fact of a adjustment "hidden" from BPAPI-user only relating to temperature_eco /
// temperature_comfort.
  @JsonKey(name: 'temperature_comfort_prlsa')
  SikomProperty? get temperatureComfortAdjustment;
  @override // Tells whether the device is currently being regulated
// or not (0 = not regulated 1 = import regulated 2 = export regulated)
  @JsonKey(name: 'ams_regulated_state')
  SikomProperty? get regulatedState;
  @override // The power (in W) that this device releases when regulated out, as estimated by
// the system itself, compared to when regulated in (raw value, no PWM or other partial
// regulation scheme accounted for). Will be a negative value (representing the power
// "added" when the device is regulated out. Only relevant to set for devices which have
// switch_mode (and when an ECOEnergyController is installed)
  @JsonKey(name: 'ams_regulation_priority')
  SikomProperty? get regulationPriority;
  @override
  @JsonKey(name: 'estimated_reg_power')
  SikomProperty? get estimatedRegulatedPower;
  @override // The power (in W) that this device draws when unregulated, as estimated by the system itself,
// compared to when regulated out (raw value, no PWM or other partial regulation scheme accounted for).
// Will be a positive value. Only relevant to set for devices which have
// switch_mode (and when an ECOEnergyController)
  @JsonKey(name: 'estimated_unreg_power')
  SikomProperty? get estimatedUnregulatedPower;
  @override
  @JsonKey(ignore: true)
  _$$SikomDevicePropertiesImplCopyWith<_$SikomDevicePropertiesImpl>
      get copyWith => throw _privateConstructorUsedError;
}
