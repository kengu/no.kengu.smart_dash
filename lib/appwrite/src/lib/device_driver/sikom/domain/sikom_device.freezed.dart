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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
  bool operator ==(dynamic other) {
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
  SikomProperty? get powerVoltage => throw _privateConstructorUsedError;

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
      @JsonKey(name: 'ams_power_voltage') SikomProperty? powerVoltage});
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
    Object? vendorType = freezed,
    Object? bestEffortName = freezed,
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
  }) {
    return _then(_value.copyWith(
      vendorType: freezed == vendorType
          ? _value.vendorType
          : vendorType // ignore: cast_nullable_to_non_nullable
              as SikomProperty,
      bestEffortName: freezed == bestEffortName
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
    ) as $Val);
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
      @JsonKey(name: 'ams_power_voltage') SikomProperty? powerVoltage});
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
    Object? vendorType = freezed,
    Object? bestEffortName = freezed,
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
  }) {
    return _then(_$SikomDevicePropertiesImpl(
      vendorType: freezed == vendorType
          ? _value.vendorType
          : vendorType // ignore: cast_nullable_to_non_nullable
              as SikomProperty,
      bestEffortName: freezed == bestEffortName
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
      @JsonKey(name: 'ams_power_voltage') this.powerVoltage})
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

  @override
  String toString() {
    return 'SikomDeviceProperties(vendorType: $vendorType, bestEffortName: $bestEffortName, latestUpdateFromDevice: $latestUpdateFromDevice, pushUpdateIntervalMinutes: $pushUpdateIntervalMinutes, dummy: $dummy, connection: $connection, gprsNetname: $gprsNetname, productCode: $productCode, modelName: $modelName, deviceType: $deviceType, deviceModel: $deviceModel, userDefinedName: $userDefinedName, deviceModelReadable: $deviceModelReadable, vendorAndDeviceModelReadable: $vendorAndDeviceModelReadable, currentPowerUsage: $currentPowerUsage, cumulativeEnergy: $cumulativeEnergy, cumulativeEnergyToday: $cumulativeEnergyToday, powerVoltage: $powerVoltage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SikomDevicePropertiesImpl &&
            const DeepCollectionEquality()
                .equals(other.vendorType, vendorType) &&
            const DeepCollectionEquality()
                .equals(other.bestEffortName, bestEffortName) &&
            const DeepCollectionEquality()
                .equals(other.latestUpdateFromDevice, latestUpdateFromDevice) &&
            const DeepCollectionEquality().equals(
                other.pushUpdateIntervalMinutes, pushUpdateIntervalMinutes) &&
            const DeepCollectionEquality().equals(other.dummy, dummy) &&
            const DeepCollectionEquality()
                .equals(other.connection, connection) &&
            const DeepCollectionEquality()
                .equals(other.gprsNetname, gprsNetname) &&
            const DeepCollectionEquality()
                .equals(other.productCode, productCode) &&
            const DeepCollectionEquality().equals(other.modelName, modelName) &&
            const DeepCollectionEquality()
                .equals(other.deviceType, deviceType) &&
            const DeepCollectionEquality()
                .equals(other.deviceModel, deviceModel) &&
            const DeepCollectionEquality()
                .equals(other.userDefinedName, userDefinedName) &&
            const DeepCollectionEquality()
                .equals(other.deviceModelReadable, deviceModelReadable) &&
            const DeepCollectionEquality().equals(
                other.vendorAndDeviceModelReadable,
                vendorAndDeviceModelReadable) &&
            const DeepCollectionEquality()
                .equals(other.currentPowerUsage, currentPowerUsage) &&
            const DeepCollectionEquality()
                .equals(other.cumulativeEnergy, cumulativeEnergy) &&
            const DeepCollectionEquality()
                .equals(other.cumulativeEnergyToday, cumulativeEnergyToday) &&
            const DeepCollectionEquality()
                .equals(other.powerVoltage, powerVoltage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(vendorType),
      const DeepCollectionEquality().hash(bestEffortName),
      const DeepCollectionEquality().hash(latestUpdateFromDevice),
      const DeepCollectionEquality().hash(pushUpdateIntervalMinutes),
      const DeepCollectionEquality().hash(dummy),
      const DeepCollectionEquality().hash(connection),
      const DeepCollectionEquality().hash(gprsNetname),
      const DeepCollectionEquality().hash(productCode),
      const DeepCollectionEquality().hash(modelName),
      const DeepCollectionEquality().hash(deviceType),
      const DeepCollectionEquality().hash(deviceModel),
      const DeepCollectionEquality().hash(userDefinedName),
      const DeepCollectionEquality().hash(deviceModelReadable),
      const DeepCollectionEquality().hash(vendorAndDeviceModelReadable),
      const DeepCollectionEquality().hash(currentPowerUsage),
      const DeepCollectionEquality().hash(cumulativeEnergy),
      const DeepCollectionEquality().hash(cumulativeEnergyToday),
      const DeepCollectionEquality().hash(powerVoltage));

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
      @JsonKey(name: 'ams_power_voltage')
      final SikomProperty? powerVoltage}) = _$SikomDevicePropertiesImpl;
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
  @override
  @JsonKey(ignore: true)
  _$$SikomDevicePropertiesImplCopyWith<_$SikomDevicePropertiesImpl>
      get copyWith => throw _privateConstructorUsedError;
}
