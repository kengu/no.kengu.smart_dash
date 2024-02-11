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
  Set<ServiceConfig> get services => throw _privateConstructorUsedError;
  String? get fname => throw _privateConstructorUsedError;
  String? get lname => throw _privateConstructorUsedError;
  Presence? get presence => throw _privateConstructorUsedError;

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
      {String userId,
      Set<ServiceConfig> services,
      String? fname,
      String? lname,
      Presence? presence});

  $PresenceCopyWith<$Res>? get presence;
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
    Object? services = null,
    Object? fname = freezed,
    Object? lname = freezed,
    Object? presence = freezed,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      services: null == services
          ? _value.services
          : services // ignore: cast_nullable_to_non_nullable
              as Set<ServiceConfig>,
      fname: freezed == fname
          ? _value.fname
          : fname // ignore: cast_nullable_to_non_nullable
              as String?,
      lname: freezed == lname
          ? _value.lname
          : lname // ignore: cast_nullable_to_non_nullable
              as String?,
      presence: freezed == presence
          ? _value.presence
          : presence // ignore: cast_nullable_to_non_nullable
              as Presence?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PresenceCopyWith<$Res>? get presence {
    if (_value.presence == null) {
      return null;
    }

    return $PresenceCopyWith<$Res>(_value.presence!, (value) {
      return _then(_value.copyWith(presence: value) as $Val);
    });
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
      {String userId,
      Set<ServiceConfig> services,
      String? fname,
      String? lname,
      Presence? presence});

  @override
  $PresenceCopyWith<$Res>? get presence;
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
    Object? services = null,
    Object? fname = freezed,
    Object? lname = freezed,
    Object? presence = freezed,
  }) {
    return _then(_$AccountImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      services: null == services
          ? _value._services
          : services // ignore: cast_nullable_to_non_nullable
              as Set<ServiceConfig>,
      fname: freezed == fname
          ? _value.fname
          : fname // ignore: cast_nullable_to_non_nullable
              as String?,
      lname: freezed == lname
          ? _value.lname
          : lname // ignore: cast_nullable_to_non_nullable
              as String?,
      presence: freezed == presence
          ? _value.presence
          : presence // ignore: cast_nullable_to_non_nullable
              as Presence?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AccountImpl extends _Account {
  const _$AccountImpl(
      {required this.userId,
      required final Set<ServiceConfig> services,
      this.fname,
      this.lname,
      this.presence})
      : _services = services,
        super._();

  factory _$AccountImpl.fromJson(Map<String, dynamic> json) =>
      _$$AccountImplFromJson(json);

  @override
  final String userId;
  final Set<ServiceConfig> _services;
  @override
  Set<ServiceConfig> get services {
    if (_services is EqualUnmodifiableSetView) return _services;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_services);
  }

  @override
  final String? fname;
  @override
  final String? lname;
  @override
  final Presence? presence;

  @override
  String toString() {
    return 'Account(userId: $userId, services: $services, fname: $fname, lname: $lname, presence: $presence)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            const DeepCollectionEquality().equals(other._services, _services) &&
            (identical(other.fname, fname) || other.fname == fname) &&
            (identical(other.lname, lname) || other.lname == lname) &&
            (identical(other.presence, presence) ||
                other.presence == presence));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userId,
      const DeepCollectionEquality().hash(_services), fname, lname, presence);

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
      required final Set<ServiceConfig> services,
      final String? fname,
      final String? lname,
      final Presence? presence}) = _$AccountImpl;
  const _Account._() : super._();

  factory _Account.fromJson(Map<String, dynamic> json) = _$AccountImpl.fromJson;

  @override
  String get userId;
  @override
  Set<ServiceConfig> get services;
  @override
  String? get fname;
  @override
  String? get lname;
  @override
  Presence? get presence;
  @override
  @JsonKey(ignore: true)
  _$$AccountImplCopyWith<_$AccountImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Presence _$PresenceFromJson(Map<String, dynamic> json) {
  return _Presence.fromJson(json);
}

/// @nodoc
mixin _$Presence {
  String get ipAddress => throw _privateConstructorUsedError;
  String get deviceName => throw _privateConstructorUsedError;
  String? get macAddress => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PresenceCopyWith<Presence> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PresenceCopyWith<$Res> {
  factory $PresenceCopyWith(Presence value, $Res Function(Presence) then) =
      _$PresenceCopyWithImpl<$Res, Presence>;
  @useResult
  $Res call({String ipAddress, String deviceName, String? macAddress});
}

/// @nodoc
class _$PresenceCopyWithImpl<$Res, $Val extends Presence>
    implements $PresenceCopyWith<$Res> {
  _$PresenceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ipAddress = null,
    Object? deviceName = null,
    Object? macAddress = freezed,
  }) {
    return _then(_value.copyWith(
      ipAddress: null == ipAddress
          ? _value.ipAddress
          : ipAddress // ignore: cast_nullable_to_non_nullable
              as String,
      deviceName: null == deviceName
          ? _value.deviceName
          : deviceName // ignore: cast_nullable_to_non_nullable
              as String,
      macAddress: freezed == macAddress
          ? _value.macAddress
          : macAddress // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PresenceImplCopyWith<$Res>
    implements $PresenceCopyWith<$Res> {
  factory _$$PresenceImplCopyWith(
          _$PresenceImpl value, $Res Function(_$PresenceImpl) then) =
      __$$PresenceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String ipAddress, String deviceName, String? macAddress});
}

/// @nodoc
class __$$PresenceImplCopyWithImpl<$Res>
    extends _$PresenceCopyWithImpl<$Res, _$PresenceImpl>
    implements _$$PresenceImplCopyWith<$Res> {
  __$$PresenceImplCopyWithImpl(
      _$PresenceImpl _value, $Res Function(_$PresenceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ipAddress = null,
    Object? deviceName = null,
    Object? macAddress = freezed,
  }) {
    return _then(_$PresenceImpl(
      ipAddress: null == ipAddress
          ? _value.ipAddress
          : ipAddress // ignore: cast_nullable_to_non_nullable
              as String,
      deviceName: null == deviceName
          ? _value.deviceName
          : deviceName // ignore: cast_nullable_to_non_nullable
              as String,
      macAddress: freezed == macAddress
          ? _value.macAddress
          : macAddress // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PresenceImpl extends _Presence {
  const _$PresenceImpl(
      {required this.ipAddress, required this.deviceName, this.macAddress})
      : super._();

  factory _$PresenceImpl.fromJson(Map<String, dynamic> json) =>
      _$$PresenceImplFromJson(json);

  @override
  final String ipAddress;
  @override
  final String deviceName;
  @override
  final String? macAddress;

  @override
  String toString() {
    return 'Presence(ipAddress: $ipAddress, deviceName: $deviceName, macAddress: $macAddress)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PresenceImpl &&
            (identical(other.ipAddress, ipAddress) ||
                other.ipAddress == ipAddress) &&
            (identical(other.deviceName, deviceName) ||
                other.deviceName == deviceName) &&
            (identical(other.macAddress, macAddress) ||
                other.macAddress == macAddress));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, ipAddress, deviceName, macAddress);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PresenceImplCopyWith<_$PresenceImpl> get copyWith =>
      __$$PresenceImplCopyWithImpl<_$PresenceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PresenceImplToJson(
      this,
    );
  }
}

abstract class _Presence extends Presence {
  const factory _Presence(
      {required final String ipAddress,
      required final String deviceName,
      final String? macAddress}) = _$PresenceImpl;
  const _Presence._() : super._();

  factory _Presence.fromJson(Map<String, dynamic> json) =
      _$PresenceImpl.fromJson;

  @override
  String get ipAddress;
  @override
  String get deviceName;
  @override
  String? get macAddress;
  @override
  @JsonKey(ignore: true)
  _$$PresenceImplCopyWith<_$PresenceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
