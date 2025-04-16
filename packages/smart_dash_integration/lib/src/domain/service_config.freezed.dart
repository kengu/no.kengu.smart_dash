// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ServiceConfig {
  String get key;
  String get name;
  Map<IntegrationField, String> get data;

  /// Create a copy of ServiceConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ServiceConfigCopyWith<ServiceConfig> get copyWith =>
      _$ServiceConfigCopyWithImpl<ServiceConfig>(
          this as ServiceConfig, _$identity);

  /// Serializes this ServiceConfig to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ServiceConfig &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, key, name, const DeepCollectionEquality().hash(data));

  @override
  String toString() {
    return 'ServiceConfig(key: $key, name: $name, data: $data)';
  }
}

/// @nodoc
abstract mixin class $ServiceConfigCopyWith<$Res> {
  factory $ServiceConfigCopyWith(
          ServiceConfig value, $Res Function(ServiceConfig) _then) =
      _$ServiceConfigCopyWithImpl;
  @useResult
  $Res call({String key, String name, Map<IntegrationField, String> data});
}

/// @nodoc
class _$ServiceConfigCopyWithImpl<$Res>
    implements $ServiceConfigCopyWith<$Res> {
  _$ServiceConfigCopyWithImpl(this._self, this._then);

  final ServiceConfig _self;
  final $Res Function(ServiceConfig) _then;

  /// Create a copy of ServiceConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? name = null,
    Object? data = null,
  }) {
    return _then(_self.copyWith(
      key: null == key
          ? _self.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<IntegrationField, String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ServiceConfig extends ServiceConfig {
  const _ServiceConfig(
      {required this.key,
      required this.name,
      required final Map<IntegrationField, String> data})
      : _data = data,
        super._();
  factory _ServiceConfig.fromJson(Map<String, dynamic> json) =>
      _$ServiceConfigFromJson(json);

  @override
  final String key;
  @override
  final String name;
  final Map<IntegrationField, String> _data;
  @override
  Map<IntegrationField, String> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  /// Create a copy of ServiceConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ServiceConfigCopyWith<_ServiceConfig> get copyWith =>
      __$ServiceConfigCopyWithImpl<_ServiceConfig>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ServiceConfigToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ServiceConfig &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, key, name, const DeepCollectionEquality().hash(_data));

  @override
  String toString() {
    return 'ServiceConfig(key: $key, name: $name, data: $data)';
  }
}

/// @nodoc
abstract mixin class _$ServiceConfigCopyWith<$Res>
    implements $ServiceConfigCopyWith<$Res> {
  factory _$ServiceConfigCopyWith(
          _ServiceConfig value, $Res Function(_ServiceConfig) _then) =
      __$ServiceConfigCopyWithImpl;
  @override
  @useResult
  $Res call({String key, String name, Map<IntegrationField, String> data});
}

/// @nodoc
class __$ServiceConfigCopyWithImpl<$Res>
    implements _$ServiceConfigCopyWith<$Res> {
  __$ServiceConfigCopyWithImpl(this._self, this._then);

  final _ServiceConfig _self;
  final $Res Function(_ServiceConfig) _then;

  /// Create a copy of ServiceConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? key = null,
    Object? name = null,
    Object? data = null,
  }) {
    return _then(_ServiceConfig(
      key: null == key
          ? _self.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _self._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<IntegrationField, String>,
    ));
  }
}

// dart format on
