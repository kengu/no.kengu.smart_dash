// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Device _$DeviceFromJson(Map<String, dynamic> json) {
  return _Device.fromJson(json);
}

/// @nodoc
mixin _$Device {
  /// Get the device's id
  String get id => throw _privateConstructorUsedError;

  /// Get the device's name
  String get name => throw _privateConstructorUsedError;

  /// Get the device's type
  String get type => throw _privateConstructorUsedError;

  /// Get the device's data object (is unmodifiable)
  Map<String, Object?> get data => throw _privateConstructorUsedError;

  /// The device's capabilities array
  List<DeviceCapabilities> get capabilities =>
      throw _privateConstructorUsedError;

  /// Get the timestamp for when device's was last updated
  DateTime get lastUpdated => throw _privateConstructorUsedError;

  /// Get the device's energy consumption (default null)
  EnergySummary? get energy => throw _privateConstructorUsedError;

  /// Get device's measured voltage (default null)
  int? get voltage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeviceCopyWith<Device> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceCopyWith<$Res> {
  factory $DeviceCopyWith(Device value, $Res Function(Device) then) =
      _$DeviceCopyWithImpl<$Res, Device>;
  @useResult
  $Res call(
      {String id,
      String name,
      String type,
      Map<String, Object?> data,
      List<DeviceCapabilities> capabilities,
      DateTime lastUpdated,
      EnergySummary? energy,
      int? voltage});

  $EnergySummaryCopyWith<$Res>? get energy;
}

/// @nodoc
class _$DeviceCopyWithImpl<$Res, $Val extends Device>
    implements $DeviceCopyWith<$Res> {
  _$DeviceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? data = null,
    Object? capabilities = null,
    Object? lastUpdated = null,
    Object? energy = freezed,
    Object? voltage = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, Object?>,
      capabilities: null == capabilities
          ? _value.capabilities
          : capabilities // ignore: cast_nullable_to_non_nullable
              as List<DeviceCapabilities>,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
      energy: freezed == energy
          ? _value.energy
          : energy // ignore: cast_nullable_to_non_nullable
              as EnergySummary?,
      voltage: freezed == voltage
          ? _value.voltage
          : voltage // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $EnergySummaryCopyWith<$Res>? get energy {
    if (_value.energy == null) {
      return null;
    }

    return $EnergySummaryCopyWith<$Res>(_value.energy!, (value) {
      return _then(_value.copyWith(energy: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DeviceImplCopyWith<$Res> implements $DeviceCopyWith<$Res> {
  factory _$$DeviceImplCopyWith(
          _$DeviceImpl value, $Res Function(_$DeviceImpl) then) =
      __$$DeviceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String type,
      Map<String, Object?> data,
      List<DeviceCapabilities> capabilities,
      DateTime lastUpdated,
      EnergySummary? energy,
      int? voltage});

  @override
  $EnergySummaryCopyWith<$Res>? get energy;
}

/// @nodoc
class __$$DeviceImplCopyWithImpl<$Res>
    extends _$DeviceCopyWithImpl<$Res, _$DeviceImpl>
    implements _$$DeviceImplCopyWith<$Res> {
  __$$DeviceImplCopyWithImpl(
      _$DeviceImpl _value, $Res Function(_$DeviceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? data = null,
    Object? capabilities = null,
    Object? lastUpdated = null,
    Object? energy = freezed,
    Object? voltage = freezed,
  }) {
    return _then(_$DeviceImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, Object?>,
      capabilities: null == capabilities
          ? _value._capabilities
          : capabilities // ignore: cast_nullable_to_non_nullable
              as List<DeviceCapabilities>,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
      energy: freezed == energy
          ? _value.energy
          : energy // ignore: cast_nullable_to_non_nullable
              as EnergySummary?,
      voltage: freezed == voltage
          ? _value.voltage
          : voltage // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeviceImpl extends _Device {
  const _$DeviceImpl(
      {required this.id,
      required this.name,
      required this.type,
      required final Map<String, Object?> data,
      required final List<DeviceCapabilities> capabilities,
      required this.lastUpdated,
      this.energy,
      this.voltage})
      : _data = data,
        _capabilities = capabilities,
        super._();

  factory _$DeviceImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeviceImplFromJson(json);

  /// Get the device's id
  @override
  final String id;

  /// Get the device's name
  @override
  final String name;

  /// Get the device's type
  @override
  final String type;

  /// Get the device's data object (is unmodifiable)
  final Map<String, Object?> _data;

  /// Get the device's data object (is unmodifiable)
  @override
  Map<String, Object?> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  /// The device's capabilities array
  final List<DeviceCapabilities> _capabilities;

  /// The device's capabilities array
  @override
  List<DeviceCapabilities> get capabilities {
    if (_capabilities is EqualUnmodifiableListView) return _capabilities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_capabilities);
  }

  /// Get the timestamp for when device's was last updated
  @override
  final DateTime lastUpdated;

  /// Get the device's energy consumption (default null)
  @override
  final EnergySummary? energy;

  /// Get device's measured voltage (default null)
  @override
  final int? voltage;

  @override
  String toString() {
    return 'Device(id: $id, name: $name, type: $type, data: $data, capabilities: $capabilities, lastUpdated: $lastUpdated, energy: $energy, voltage: $voltage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            const DeepCollectionEquality()
                .equals(other._capabilities, _capabilities) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated) &&
            (identical(other.energy, energy) || other.energy == energy) &&
            (identical(other.voltage, voltage) || other.voltage == voltage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      type,
      const DeepCollectionEquality().hash(_data),
      const DeepCollectionEquality().hash(_capabilities),
      lastUpdated,
      energy,
      voltage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceImplCopyWith<_$DeviceImpl> get copyWith =>
      __$$DeviceImplCopyWithImpl<_$DeviceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeviceImplToJson(
      this,
    );
  }
}

abstract class _Device extends Device {
  const factory _Device(
      {required final String id,
      required final String name,
      required final String type,
      required final Map<String, Object?> data,
      required final List<DeviceCapabilities> capabilities,
      required final DateTime lastUpdated,
      final EnergySummary? energy,
      final int? voltage}) = _$DeviceImpl;
  const _Device._() : super._();

  factory _Device.fromJson(Map<String, dynamic> json) = _$DeviceImpl.fromJson;

  @override

  /// Get the device's id
  String get id;
  @override

  /// Get the device's name
  String get name;
  @override

  /// Get the device's type
  String get type;
  @override

  /// Get the device's data object (is unmodifiable)
  Map<String, Object?> get data;
  @override

  /// The device's capabilities array
  List<DeviceCapabilities> get capabilities;
  @override

  /// Get the timestamp for when device's was last updated
  DateTime get lastUpdated;
  @override

  /// Get the device's energy consumption (default null)
  EnergySummary? get energy;
  @override

  /// Get device's measured voltage (default null)
  int? get voltage;
  @override
  @JsonKey(ignore: true)
  _$$DeviceImplCopyWith<_$DeviceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
