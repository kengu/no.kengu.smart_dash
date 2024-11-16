// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ServiceConfig _$ServiceConfigFromJson(Map<String, dynamic> json) {
  return _ServiceConfig.fromJson(json);
}

/// @nodoc
mixin _$ServiceConfig {
  String get key => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  Map<IntegrationField, String> get data => throw _privateConstructorUsedError;

  /// Serializes this ServiceConfig to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ServiceConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ServiceConfigCopyWith<ServiceConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceConfigCopyWith<$Res> {
  factory $ServiceConfigCopyWith(
          ServiceConfig value, $Res Function(ServiceConfig) then) =
      _$ServiceConfigCopyWithImpl<$Res, ServiceConfig>;
  @useResult
  $Res call({String key, String name, Map<IntegrationField, String> data});
}

/// @nodoc
class _$ServiceConfigCopyWithImpl<$Res, $Val extends ServiceConfig>
    implements $ServiceConfigCopyWith<$Res> {
  _$ServiceConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ServiceConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? name = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<IntegrationField, String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServiceConfigImplCopyWith<$Res>
    implements $ServiceConfigCopyWith<$Res> {
  factory _$$ServiceConfigImplCopyWith(
          _$ServiceConfigImpl value, $Res Function(_$ServiceConfigImpl) then) =
      __$$ServiceConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String key, String name, Map<IntegrationField, String> data});
}

/// @nodoc
class __$$ServiceConfigImplCopyWithImpl<$Res>
    extends _$ServiceConfigCopyWithImpl<$Res, _$ServiceConfigImpl>
    implements _$$ServiceConfigImplCopyWith<$Res> {
  __$$ServiceConfigImplCopyWithImpl(
      _$ServiceConfigImpl _value, $Res Function(_$ServiceConfigImpl) _then)
      : super(_value, _then);

  /// Create a copy of ServiceConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? name = null,
    Object? data = null,
  }) {
    return _then(_$ServiceConfigImpl(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<IntegrationField, String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServiceConfigImpl extends _ServiceConfig {
  const _$ServiceConfigImpl(
      {required this.key,
      required this.name,
      required final Map<IntegrationField, String> data})
      : _data = data,
        super._();

  factory _$ServiceConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServiceConfigImplFromJson(json);

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

  @override
  String toString() {
    return 'ServiceConfig(key: $key, name: $name, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceConfigImpl &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, key, name, const DeepCollectionEquality().hash(_data));

  /// Create a copy of ServiceConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceConfigImplCopyWith<_$ServiceConfigImpl> get copyWith =>
      __$$ServiceConfigImplCopyWithImpl<_$ServiceConfigImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServiceConfigImplToJson(
      this,
    );
  }
}

abstract class _ServiceConfig extends ServiceConfig {
  const factory _ServiceConfig(
      {required final String key,
      required final String name,
      required final Map<IntegrationField, String> data}) = _$ServiceConfigImpl;
  const _ServiceConfig._() : super._();

  factory _ServiceConfig.fromJson(Map<String, dynamic> json) =
      _$ServiceConfigImpl.fromJson;

  @override
  String get key;
  @override
  String get name;
  @override
  Map<IntegrationField, String> get data;

  /// Create a copy of ServiceConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServiceConfigImplCopyWith<_$ServiceConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
