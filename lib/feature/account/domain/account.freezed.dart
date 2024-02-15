// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Account _$AccountFromJson(Map<String, dynamic> json) {
  return _Account.fromJson(json);
}

/// @nodoc
mixin _$Account {
  String get userId => throw _privateConstructorUsedError;
  String? get fname => throw _privateConstructorUsedError;
  String? get lname => throw _privateConstructorUsedError;
  List<AccountHome>? get homes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccountCopyWith<Account> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountCopyWith<$Res> {
  factory $AccountCopyWith(Account value, $Res Function(Account) then) =
      _$AccountCopyWithImpl<$Res, Account>;
  @useResult
  $Res call(
      {String userId, String? fname, String? lname, List<AccountHome>? homes});
}

/// @nodoc
class _$AccountCopyWithImpl<$Res, $Val extends Account>
    implements $AccountCopyWith<$Res> {
  _$AccountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? fname = freezed,
    Object? lname = freezed,
    Object? homes = freezed,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      fname: freezed == fname
          ? _value.fname
          : fname // ignore: cast_nullable_to_non_nullable
              as String?,
      lname: freezed == lname
          ? _value.lname
          : lname // ignore: cast_nullable_to_non_nullable
              as String?,
      homes: freezed == homes
          ? _value.homes
          : homes // ignore: cast_nullable_to_non_nullable
              as List<AccountHome>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AccountImplCopyWith<$Res> implements $AccountCopyWith<$Res> {
  factory _$$AccountImplCopyWith(
          _$AccountImpl value, $Res Function(_$AccountImpl) then) =
      __$$AccountImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userId, String? fname, String? lname, List<AccountHome>? homes});
}

/// @nodoc
class __$$AccountImplCopyWithImpl<$Res>
    extends _$AccountCopyWithImpl<$Res, _$AccountImpl>
    implements _$$AccountImplCopyWith<$Res> {
  __$$AccountImplCopyWithImpl(
      _$AccountImpl _value, $Res Function(_$AccountImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? fname = freezed,
    Object? lname = freezed,
    Object? homes = freezed,
  }) {
    return _then(_$AccountImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      fname: freezed == fname
          ? _value.fname
          : fname // ignore: cast_nullable_to_non_nullable
              as String?,
      lname: freezed == lname
          ? _value.lname
          : lname // ignore: cast_nullable_to_non_nullable
              as String?,
      homes: freezed == homes
          ? _value._homes
          : homes // ignore: cast_nullable_to_non_nullable
              as List<AccountHome>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AccountImpl extends _Account {
  const _$AccountImpl(
      {required this.userId,
      this.fname,
      this.lname,
      final List<AccountHome>? homes})
      : _homes = homes,
        super._();

  factory _$AccountImpl.fromJson(Map<String, dynamic> json) =>
      _$$AccountImplFromJson(json);

  @override
  final String userId;
  @override
  final String? fname;
  @override
  final String? lname;
  final List<AccountHome>? _homes;
  @override
  List<AccountHome>? get homes {
    final value = _homes;
    if (value == null) return null;
    if (_homes is EqualUnmodifiableListView) return _homes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Account(userId: $userId, fname: $fname, lname: $lname, homes: $homes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.fname, fname) || other.fname == fname) &&
            (identical(other.lname, lname) || other.lname == lname) &&
            const DeepCollectionEquality().equals(other._homes, _homes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userId, fname, lname,
      const DeepCollectionEquality().hash(_homes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountImplCopyWith<_$AccountImpl> get copyWith =>
      __$$AccountImplCopyWithImpl<_$AccountImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AccountImplToJson(
      this,
    );
  }
}

abstract class _Account extends Account {
  const factory _Account(
      {required final String userId,
      final String? fname,
      final String? lname,
      final List<AccountHome>? homes}) = _$AccountImpl;
  const _Account._() : super._();

  factory _Account.fromJson(Map<String, dynamic> json) = _$AccountImpl.fromJson;

  @override
  String get userId;
  @override
  String? get fname;
  @override
  String? get lname;
  @override
  List<AccountHome>? get homes;
  @override
  @JsonKey(ignore: true)
  _$$AccountImplCopyWith<_$AccountImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AccountHome _$AccountHomeFromJson(Map<String, dynamic> json) {
  return _AccountHome.fromJson(json);
}

/// @nodoc
mixin _$AccountHome {
  String get name => throw _privateConstructorUsedError;
  List<ServiceConfig> get services => throw _privateConstructorUsedError;
  List<AccountHomeMember> get members => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccountHomeCopyWith<AccountHome> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountHomeCopyWith<$Res> {
  factory $AccountHomeCopyWith(
          AccountHome value, $Res Function(AccountHome) then) =
      _$AccountHomeCopyWithImpl<$Res, AccountHome>;
  @useResult
  $Res call(
      {String name,
      List<ServiceConfig> services,
      List<AccountHomeMember> members,
      String? address});
}

/// @nodoc
class _$AccountHomeCopyWithImpl<$Res, $Val extends AccountHome>
    implements $AccountHomeCopyWith<$Res> {
  _$AccountHomeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? services = null,
    Object? members = null,
    Object? address = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      services: null == services
          ? _value.services
          : services // ignore: cast_nullable_to_non_nullable
              as List<ServiceConfig>,
      members: null == members
          ? _value.members
          : members // ignore: cast_nullable_to_non_nullable
              as List<AccountHomeMember>,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AccountHomeImplCopyWith<$Res>
    implements $AccountHomeCopyWith<$Res> {
  factory _$$AccountHomeImplCopyWith(
          _$AccountHomeImpl value, $Res Function(_$AccountHomeImpl) then) =
      __$$AccountHomeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      List<ServiceConfig> services,
      List<AccountHomeMember> members,
      String? address});
}

/// @nodoc
class __$$AccountHomeImplCopyWithImpl<$Res>
    extends _$AccountHomeCopyWithImpl<$Res, _$AccountHomeImpl>
    implements _$$AccountHomeImplCopyWith<$Res> {
  __$$AccountHomeImplCopyWithImpl(
      _$AccountHomeImpl _value, $Res Function(_$AccountHomeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? services = null,
    Object? members = null,
    Object? address = freezed,
  }) {
    return _then(_$AccountHomeImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      services: null == services
          ? _value._services
          : services // ignore: cast_nullable_to_non_nullable
              as List<ServiceConfig>,
      members: null == members
          ? _value._members
          : members // ignore: cast_nullable_to_non_nullable
              as List<AccountHomeMember>,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AccountHomeImpl extends _AccountHome {
  const _$AccountHomeImpl(
      {required this.name,
      required final List<ServiceConfig> services,
      required final List<AccountHomeMember> members,
      this.address})
      : _services = services,
        _members = members,
        super._();

  factory _$AccountHomeImpl.fromJson(Map<String, dynamic> json) =>
      _$$AccountHomeImplFromJson(json);

  @override
  final String name;
  final List<ServiceConfig> _services;
  @override
  List<ServiceConfig> get services {
    if (_services is EqualUnmodifiableListView) return _services;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_services);
  }

  final List<AccountHomeMember> _members;
  @override
  List<AccountHomeMember> get members {
    if (_members is EqualUnmodifiableListView) return _members;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_members);
  }

  @override
  final String? address;

  @override
  String toString() {
    return 'AccountHome(name: $name, services: $services, members: $members, address: $address)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountHomeImpl &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._services, _services) &&
            const DeepCollectionEquality().equals(other._members, _members) &&
            (identical(other.address, address) || other.address == address));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      const DeepCollectionEquality().hash(_services),
      const DeepCollectionEquality().hash(_members),
      address);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountHomeImplCopyWith<_$AccountHomeImpl> get copyWith =>
      __$$AccountHomeImplCopyWithImpl<_$AccountHomeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AccountHomeImplToJson(
      this,
    );
  }
}

abstract class _AccountHome extends AccountHome {
  const factory _AccountHome(
      {required final String name,
      required final List<ServiceConfig> services,
      required final List<AccountHomeMember> members,
      final String? address}) = _$AccountHomeImpl;
  const _AccountHome._() : super._();

  factory _AccountHome.fromJson(Map<String, dynamic> json) =
      _$AccountHomeImpl.fromJson;

  @override
  String get name;
  @override
  List<ServiceConfig> get services;
  @override
  List<AccountHomeMember> get members;
  @override
  String? get address;
  @override
  @JsonKey(ignore: true)
  _$$AccountHomeImplCopyWith<_$AccountHomeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AccountHomeMember _$AccountHomeMemberFromJson(Map<String, dynamic> json) {
  return _AccountHomeMember.fromJson(json);
}

/// @nodoc
mixin _$AccountHomeMember {
  String get key => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccountHomeMemberCopyWith<AccountHomeMember> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountHomeMemberCopyWith<$Res> {
  factory $AccountHomeMemberCopyWith(
          AccountHomeMember value, $Res Function(AccountHomeMember) then) =
      _$AccountHomeMemberCopyWithImpl<$Res, AccountHomeMember>;
  @useResult
  $Res call({String key, String name});
}

/// @nodoc
class _$AccountHomeMemberCopyWithImpl<$Res, $Val extends AccountHomeMember>
    implements $AccountHomeMemberCopyWith<$Res> {
  _$AccountHomeMemberCopyWithImpl(this._value, this._then);

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
abstract class _$$AccountHomeMemberImplCopyWith<$Res>
    implements $AccountHomeMemberCopyWith<$Res> {
  factory _$$AccountHomeMemberImplCopyWith(_$AccountHomeMemberImpl value,
          $Res Function(_$AccountHomeMemberImpl) then) =
      __$$AccountHomeMemberImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String key, String name});
}

/// @nodoc
class __$$AccountHomeMemberImplCopyWithImpl<$Res>
    extends _$AccountHomeMemberCopyWithImpl<$Res, _$AccountHomeMemberImpl>
    implements _$$AccountHomeMemberImplCopyWith<$Res> {
  __$$AccountHomeMemberImplCopyWithImpl(_$AccountHomeMemberImpl _value,
      $Res Function(_$AccountHomeMemberImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? name = null,
  }) {
    return _then(_$AccountHomeMemberImpl(
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
class _$AccountHomeMemberImpl extends _AccountHomeMember {
  const _$AccountHomeMemberImpl({required this.key, required this.name})
      : super._();

  factory _$AccountHomeMemberImpl.fromJson(Map<String, dynamic> json) =>
      _$$AccountHomeMemberImplFromJson(json);

  @override
  final String key;
  @override
  final String name;

  @override
  String toString() {
    return 'AccountHomeMember(key: $key, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountHomeMemberImpl &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, key, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountHomeMemberImplCopyWith<_$AccountHomeMemberImpl> get copyWith =>
      __$$AccountHomeMemberImplCopyWithImpl<_$AccountHomeMemberImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AccountHomeMemberImplToJson(
      this,
    );
  }
}

abstract class _AccountHomeMember extends AccountHomeMember {
  const factory _AccountHomeMember(
      {required final String key,
      required final String name}) = _$AccountHomeMemberImpl;
  const _AccountHomeMember._() : super._();

  factory _AccountHomeMember.fromJson(Map<String, dynamic> json) =
      _$AccountHomeMemberImpl.fromJson;

  @override
  String get key;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$AccountHomeMemberImplCopyWith<_$AccountHomeMemberImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
