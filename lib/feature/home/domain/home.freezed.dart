// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Home _$HomeFromJson(Map<String, dynamic> json) {
  return _Home.fromJson(json);
}

/// @nodoc
mixin _$Home {
  String get name => throw _privateConstructorUsedError;
  List<HomeMember> get members => throw _privateConstructorUsedError;
  List<ServiceConfig> get services => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HomeCopyWith<Home> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeCopyWith<$Res> {
  factory $HomeCopyWith(Home value, $Res Function(Home) then) =
      _$HomeCopyWithImpl<$Res, Home>;
  @useResult
  $Res call(
      {String name,
      List<HomeMember> members,
      List<ServiceConfig> services,
      String? address});
}

/// @nodoc
class _$HomeCopyWithImpl<$Res, $Val extends Home>
    implements $HomeCopyWith<$Res> {
  _$HomeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? members = null,
    Object? services = null,
    Object? address = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      members: null == members
          ? _value.members
          : members // ignore: cast_nullable_to_non_nullable
              as List<HomeMember>,
      services: null == services
          ? _value.services
          : services // ignore: cast_nullable_to_non_nullable
              as List<ServiceConfig>,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeImplCopyWith<$Res> implements $HomeCopyWith<$Res> {
  factory _$$HomeImplCopyWith(
          _$HomeImpl value, $Res Function(_$HomeImpl) then) =
      __$$HomeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      List<HomeMember> members,
      List<ServiceConfig> services,
      String? address});
}

/// @nodoc
class __$$HomeImplCopyWithImpl<$Res>
    extends _$HomeCopyWithImpl<$Res, _$HomeImpl>
    implements _$$HomeImplCopyWith<$Res> {
  __$$HomeImplCopyWithImpl(_$HomeImpl _value, $Res Function(_$HomeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? members = null,
    Object? services = null,
    Object? address = freezed,
  }) {
    return _then(_$HomeImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      members: null == members
          ? _value._members
          : members // ignore: cast_nullable_to_non_nullable
              as List<HomeMember>,
      services: null == services
          ? _value._services
          : services // ignore: cast_nullable_to_non_nullable
              as List<ServiceConfig>,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HomeImpl extends _Home {
  const _$HomeImpl(
      {required this.name,
      required final List<HomeMember> members,
      required final List<ServiceConfig> services,
      this.address})
      : _members = members,
        _services = services,
        super._();

  factory _$HomeImpl.fromJson(Map<String, dynamic> json) =>
      _$$HomeImplFromJson(json);

  @override
  final String name;
  final List<HomeMember> _members;
  @override
  List<HomeMember> get members {
    if (_members is EqualUnmodifiableListView) return _members;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_members);
  }

  final List<ServiceConfig> _services;
  @override
  List<ServiceConfig> get services {
    if (_services is EqualUnmodifiableListView) return _services;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_services);
  }

  @override
  final String? address;

  @override
  String toString() {
    return 'Home(name: $name, members: $members, services: $services, address: $address)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeImpl &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._members, _members) &&
            const DeepCollectionEquality().equals(other._services, _services) &&
            (identical(other.address, address) || other.address == address));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      const DeepCollectionEquality().hash(_members),
      const DeepCollectionEquality().hash(_services),
      address);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeImplCopyWith<_$HomeImpl> get copyWith =>
      __$$HomeImplCopyWithImpl<_$HomeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HomeImplToJson(
      this,
    );
  }
}

abstract class _Home extends Home {
  const factory _Home(
      {required final String name,
      required final List<HomeMember> members,
      required final List<ServiceConfig> services,
      final String? address}) = _$HomeImpl;
  const _Home._() : super._();

  factory _Home.fromJson(Map<String, dynamic> json) = _$HomeImpl.fromJson;

  @override
  String get name;
  @override
  List<HomeMember> get members;
  @override
  List<ServiceConfig> get services;
  @override
  String? get address;
  @override
  @JsonKey(ignore: true)
  _$$HomeImplCopyWith<_$HomeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CurrentHome _$CurrentHomeFromJson(Map<String, dynamic> json) {
  return _CurrentHome.fromJson(json);
}

/// @nodoc
mixin _$CurrentHome {
  String get name => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CurrentHomeCopyWith<CurrentHome> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrentHomeCopyWith<$Res> {
  factory $CurrentHomeCopyWith(
          CurrentHome value, $Res Function(CurrentHome) then) =
      _$CurrentHomeCopyWithImpl<$Res, CurrentHome>;
  @useResult
  $Res call({String name, String userId});
}

/// @nodoc
class _$CurrentHomeCopyWithImpl<$Res, $Val extends CurrentHome>
    implements $CurrentHomeCopyWith<$Res> {
  _$CurrentHomeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? userId = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CurrentHomeImplCopyWith<$Res>
    implements $CurrentHomeCopyWith<$Res> {
  factory _$$CurrentHomeImplCopyWith(
          _$CurrentHomeImpl value, $Res Function(_$CurrentHomeImpl) then) =
      __$$CurrentHomeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String userId});
}

/// @nodoc
class __$$CurrentHomeImplCopyWithImpl<$Res>
    extends _$CurrentHomeCopyWithImpl<$Res, _$CurrentHomeImpl>
    implements _$$CurrentHomeImplCopyWith<$Res> {
  __$$CurrentHomeImplCopyWithImpl(
      _$CurrentHomeImpl _value, $Res Function(_$CurrentHomeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? userId = null,
  }) {
    return _then(_$CurrentHomeImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CurrentHomeImpl extends _CurrentHome {
  const _$CurrentHomeImpl({required this.name, required this.userId})
      : super._();

  factory _$CurrentHomeImpl.fromJson(Map<String, dynamic> json) =>
      _$$CurrentHomeImplFromJson(json);

  @override
  final String name;
  @override
  final String userId;

  @override
  String toString() {
    return 'CurrentHome(name: $name, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrentHomeImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CurrentHomeImplCopyWith<_$CurrentHomeImpl> get copyWith =>
      __$$CurrentHomeImplCopyWithImpl<_$CurrentHomeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CurrentHomeImplToJson(
      this,
    );
  }
}

abstract class _CurrentHome extends CurrentHome {
  const factory _CurrentHome(
      {required final String name,
      required final String userId}) = _$CurrentHomeImpl;
  const _CurrentHome._() : super._();

  factory _CurrentHome.fromJson(Map<String, dynamic> json) =
      _$CurrentHomeImpl.fromJson;

  @override
  String get name;
  @override
  String get userId;
  @override
  @JsonKey(ignore: true)
  _$$CurrentHomeImplCopyWith<_$CurrentHomeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

HomeMember _$HomeMemberFromJson(Map<String, dynamic> json) {
  return _HomeMember.fromJson(json);
}

/// @nodoc
mixin _$HomeMember {
  String get key => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HomeMemberCopyWith<HomeMember> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeMemberCopyWith<$Res> {
  factory $HomeMemberCopyWith(
          HomeMember value, $Res Function(HomeMember) then) =
      _$HomeMemberCopyWithImpl<$Res, HomeMember>;
  @useResult
  $Res call({String key, String name});
}

/// @nodoc
class _$HomeMemberCopyWithImpl<$Res, $Val extends HomeMember>
    implements $HomeMemberCopyWith<$Res> {
  _$HomeMemberCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? name = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeMemberImplCopyWith<$Res>
    implements $HomeMemberCopyWith<$Res> {
  factory _$$HomeMemberImplCopyWith(
          _$HomeMemberImpl value, $Res Function(_$HomeMemberImpl) then) =
      __$$HomeMemberImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String key, String name});
}

/// @nodoc
class __$$HomeMemberImplCopyWithImpl<$Res>
    extends _$HomeMemberCopyWithImpl<$Res, _$HomeMemberImpl>
    implements _$$HomeMemberImplCopyWith<$Res> {
  __$$HomeMemberImplCopyWithImpl(
      _$HomeMemberImpl _value, $Res Function(_$HomeMemberImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? name = null,
  }) {
    return _then(_$HomeMemberImpl(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HomeMemberImpl extends _HomeMember {
  const _$HomeMemberImpl({required this.key, required this.name}) : super._();

  factory _$HomeMemberImpl.fromJson(Map<String, dynamic> json) =>
      _$$HomeMemberImplFromJson(json);

  @override
  final String key;
  @override
  final String name;

  @override
  String toString() {
    return 'HomeMember(key: $key, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeMemberImpl &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, key, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeMemberImplCopyWith<_$HomeMemberImpl> get copyWith =>
      __$$HomeMemberImplCopyWithImpl<_$HomeMemberImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HomeMemberImplToJson(
      this,
    );
  }
}

abstract class _HomeMember extends HomeMember {
  const factory _HomeMember(
      {required final String key,
      required final String name}) = _$HomeMemberImpl;
  const _HomeMember._() : super._();

  factory _HomeMember.fromJson(Map<String, dynamic> json) =
      _$HomeMemberImpl.fromJson;

  @override
  String get key;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$HomeMemberImplCopyWith<_$HomeMemberImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
