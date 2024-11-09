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
  List<ServiceField> get fields => throw _privateConstructorUsedError;
  int? get port => throw _privateConstructorUsedError;
  String? get host => throw _privateConstructorUsedError;
  String? get device => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;
  String? get topics => throw _privateConstructorUsedError;

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
  $Res call(
      {String key,
      String name,
      List<ServiceField> fields,
      int? port,
      String? host,
      String? device,
      String? username,
      String? password,
      String? topics});
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
    Object? fields = null,
    Object? port = freezed,
    Object? host = freezed,
    Object? device = freezed,
    Object? username = freezed,
    Object? password = freezed,
    Object? topics = freezed,
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
      fields: null == fields
          ? _value.fields
          : fields // ignore: cast_nullable_to_non_nullable
              as List<ServiceField>,
      port: freezed == port
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as int?,
      host: freezed == host
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as String?,
      device: freezed == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      topics: freezed == topics
          ? _value.topics
          : topics // ignore: cast_nullable_to_non_nullable
              as String?,
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
  $Res call(
      {String key,
      String name,
      List<ServiceField> fields,
      int? port,
      String? host,
      String? device,
      String? username,
      String? password,
      String? topics});
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
    Object? fields = null,
    Object? port = freezed,
    Object? host = freezed,
    Object? device = freezed,
    Object? username = freezed,
    Object? password = freezed,
    Object? topics = freezed,
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
      fields: null == fields
          ? _value._fields
          : fields // ignore: cast_nullable_to_non_nullable
              as List<ServiceField>,
      port: freezed == port
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as int?,
      host: freezed == host
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as String?,
      device: freezed == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      topics: freezed == topics
          ? _value.topics
          : topics // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServiceConfigImpl implements _ServiceConfig {
  const _$ServiceConfigImpl(
      {required this.key,
      required this.name,
      required final List<ServiceField> fields,
      this.port,
      this.host,
      this.device,
      this.username,
      this.password,
      this.topics})
      : _fields = fields;

  factory _$ServiceConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServiceConfigImplFromJson(json);

  @override
  final String key;
  @override
  final String name;
  final List<ServiceField> _fields;
  @override
  List<ServiceField> get fields {
    if (_fields is EqualUnmodifiableListView) return _fields;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_fields);
  }

  @override
  final int? port;
  @override
  final String? host;
  @override
  final String? device;
  @override
  final String? username;
  @override
  final String? password;
  @override
  final String? topics;

  @override
  String toString() {
    return 'ServiceConfig(key: $key, name: $name, fields: $fields, port: $port, host: $host, device: $device, username: $username, password: $password, topics: $topics)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceConfigImpl &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._fields, _fields) &&
            (identical(other.port, port) || other.port == port) &&
            (identical(other.host, host) || other.host == host) &&
            (identical(other.device, device) || other.device == device) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.topics, topics) || other.topics == topics));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      key,
      name,
      const DeepCollectionEquality().hash(_fields),
      port,
      host,
      device,
      username,
      password,
      topics);

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

abstract class _ServiceConfig implements ServiceConfig {
  const factory _ServiceConfig(
      {required final String key,
      required final String name,
      required final List<ServiceField> fields,
      final int? port,
      final String? host,
      final String? device,
      final String? username,
      final String? password,
      final String? topics}) = _$ServiceConfigImpl;

  factory _ServiceConfig.fromJson(Map<String, dynamic> json) =
      _$ServiceConfigImpl.fromJson;

  @override
  String get key;
  @override
  String get name;
  @override
  List<ServiceField> get fields;
  @override
  int? get port;
  @override
  String? get host;
  @override
  String? get device;
  @override
  String? get username;
  @override
  String? get password;
  @override
  String? get topics;

  /// Create a copy of ServiceConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServiceConfigImplCopyWith<_$ServiceConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
