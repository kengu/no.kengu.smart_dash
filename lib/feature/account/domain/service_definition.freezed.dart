// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_definition.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ServiceDefinition _$ServiceDefinitionFromJson(Map<String, dynamic> json) {
  return _ServiceDefinition.fromJson(json);
}

/// @nodoc
mixin _$ServiceDefinition {
  String get key => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  List<String> get fields => throw _privateConstructorUsedError;
  int? get port => throw _privateConstructorUsedError;
  String? get host => throw _privateConstructorUsedError;
  String? get device => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServiceDefinitionCopyWith<ServiceDefinition> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceDefinitionCopyWith<$Res> {
  factory $ServiceDefinitionCopyWith(
          ServiceDefinition value, $Res Function(ServiceDefinition) then) =
      _$ServiceDefinitionCopyWithImpl<$Res, ServiceDefinition>;
  @useResult
  $Res call(
      {String key,
      String name,
      String username,
      String password,
      List<String> fields,
      int? port,
      String? host,
      String? device});
}

/// @nodoc
class _$ServiceDefinitionCopyWithImpl<$Res, $Val extends ServiceDefinition>
    implements $ServiceDefinitionCopyWith<$Res> {
  _$ServiceDefinitionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? name = null,
    Object? username = null,
    Object? password = null,
    Object? fields = null,
    Object? port = freezed,
    Object? host = freezed,
    Object? device = freezed,
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
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      fields: null == fields
          ? _value.fields
          : fields // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServiceDefinitionImplCopyWith<$Res>
    implements $ServiceDefinitionCopyWith<$Res> {
  factory _$$ServiceDefinitionImplCopyWith(_$ServiceDefinitionImpl value,
          $Res Function(_$ServiceDefinitionImpl) then) =
      __$$ServiceDefinitionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String key,
      String name,
      String username,
      String password,
      List<String> fields,
      int? port,
      String? host,
      String? device});
}

/// @nodoc
class __$$ServiceDefinitionImplCopyWithImpl<$Res>
    extends _$ServiceDefinitionCopyWithImpl<$Res, _$ServiceDefinitionImpl>
    implements _$$ServiceDefinitionImplCopyWith<$Res> {
  __$$ServiceDefinitionImplCopyWithImpl(_$ServiceDefinitionImpl _value,
      $Res Function(_$ServiceDefinitionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? name = null,
    Object? username = null,
    Object? password = null,
    Object? fields = null,
    Object? port = freezed,
    Object? host = freezed,
    Object? device = freezed,
  }) {
    return _then(_$ServiceDefinitionImpl(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      fields: null == fields
          ? _value._fields
          : fields // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServiceDefinitionImpl implements _ServiceDefinition {
  const _$ServiceDefinitionImpl(
      {required this.key,
      required this.name,
      required this.username,
      required this.password,
      required final List<String> fields,
      this.port,
      this.host,
      this.device})
      : _fields = fields;

  factory _$ServiceDefinitionImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServiceDefinitionImplFromJson(json);

  @override
  final String key;
  @override
  final String name;
  @override
  final String username;
  @override
  final String password;
  final List<String> _fields;
  @override
  List<String> get fields {
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
  String toString() {
    return 'ServiceDefinition(key: $key, name: $name, username: $username, password: $password, fields: $fields, port: $port, host: $host, device: $device)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceDefinitionImpl &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password) &&
            const DeepCollectionEquality().equals(other._fields, _fields) &&
            (identical(other.port, port) || other.port == port) &&
            (identical(other.host, host) || other.host == host) &&
            (identical(other.device, device) || other.device == device));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, key, name, username, password,
      const DeepCollectionEquality().hash(_fields), port, host, device);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceDefinitionImplCopyWith<_$ServiceDefinitionImpl> get copyWith =>
      __$$ServiceDefinitionImplCopyWithImpl<_$ServiceDefinitionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServiceDefinitionImplToJson(
      this,
    );
  }
}

abstract class _ServiceDefinition implements ServiceDefinition {
  const factory _ServiceDefinition(
      {required final String key,
      required final String name,
      required final String username,
      required final String password,
      required final List<String> fields,
      final int? port,
      final String? host,
      final String? device}) = _$ServiceDefinitionImpl;

  factory _ServiceDefinition.fromJson(Map<String, dynamic> json) =
      _$ServiceDefinitionImpl.fromJson;

  @override
  String get key;
  @override
  String get name;
  @override
  String get username;
  @override
  String get password;
  @override
  List<String> get fields;
  @override
  int? get port;
  @override
  String? get host;
  @override
  String? get device;
  @override
  @JsonKey(ignore: true)
  _$$ServiceDefinitionImplCopyWith<_$ServiceDefinitionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
