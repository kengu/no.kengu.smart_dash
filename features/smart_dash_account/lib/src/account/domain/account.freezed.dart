// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Account {
  String get userId;
  List<Home> get homes;
  String? get fname;
  String? get lname;

  /// Create a copy of Account
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AccountCopyWith<Account> get copyWith =>
      _$AccountCopyWithImpl<Account>(this as Account, _$identity);

  /// Serializes this Account to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Account &&
            (identical(other.userId, userId) || other.userId == userId) &&
            const DeepCollectionEquality().equals(other.homes, homes) &&
            (identical(other.fname, fname) || other.fname == fname) &&
            (identical(other.lname, lname) || other.lname == lname));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userId,
      const DeepCollectionEquality().hash(homes), fname, lname);

  @override
  String toString() {
    return 'Account(userId: $userId, homes: $homes, fname: $fname, lname: $lname)';
  }
}

/// @nodoc
abstract mixin class $AccountCopyWith<$Res> {
  factory $AccountCopyWith(Account value, $Res Function(Account) _then) =
      _$AccountCopyWithImpl;
  @useResult
  $Res call({String userId, List<Home> homes, String? fname, String? lname});
}

/// @nodoc
class _$AccountCopyWithImpl<$Res> implements $AccountCopyWith<$Res> {
  _$AccountCopyWithImpl(this._self, this._then);

  final Account _self;
  final $Res Function(Account) _then;

  /// Create a copy of Account
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? homes = null,
    Object? fname = freezed,
    Object? lname = freezed,
  }) {
    return _then(_self.copyWith(
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      homes: null == homes
          ? _self.homes
          : homes // ignore: cast_nullable_to_non_nullable
              as List<Home>,
      fname: freezed == fname
          ? _self.fname
          : fname // ignore: cast_nullable_to_non_nullable
              as String?,
      lname: freezed == lname
          ? _self.lname
          : lname // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Account extends Account {
  const _Account(
      {required this.userId,
      required final List<Home> homes,
      this.fname,
      this.lname})
      : _homes = homes,
        super._();
  factory _Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);

  @override
  final String userId;
  final List<Home> _homes;
  @override
  List<Home> get homes {
    if (_homes is EqualUnmodifiableListView) return _homes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_homes);
  }

  @override
  final String? fname;
  @override
  final String? lname;

  /// Create a copy of Account
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AccountCopyWith<_Account> get copyWith =>
      __$AccountCopyWithImpl<_Account>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AccountToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Account &&
            (identical(other.userId, userId) || other.userId == userId) &&
            const DeepCollectionEquality().equals(other._homes, _homes) &&
            (identical(other.fname, fname) || other.fname == fname) &&
            (identical(other.lname, lname) || other.lname == lname));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userId,
      const DeepCollectionEquality().hash(_homes), fname, lname);

  @override
  String toString() {
    return 'Account(userId: $userId, homes: $homes, fname: $fname, lname: $lname)';
  }
}

/// @nodoc
abstract mixin class _$AccountCopyWith<$Res> implements $AccountCopyWith<$Res> {
  factory _$AccountCopyWith(_Account value, $Res Function(_Account) _then) =
      __$AccountCopyWithImpl;
  @override
  @useResult
  $Res call({String userId, List<Home> homes, String? fname, String? lname});
}

/// @nodoc
class __$AccountCopyWithImpl<$Res> implements _$AccountCopyWith<$Res> {
  __$AccountCopyWithImpl(this._self, this._then);

  final _Account _self;
  final $Res Function(_Account) _then;

  /// Create a copy of Account
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? userId = null,
    Object? homes = null,
    Object? fname = freezed,
    Object? lname = freezed,
  }) {
    return _then(_Account(
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      homes: null == homes
          ? _self._homes
          : homes // ignore: cast_nullable_to_non_nullable
              as List<Home>,
      fname: freezed == fname
          ? _self.fname
          : fname // ignore: cast_nullable_to_non_nullable
              as String?,
      lname: freezed == lname
          ? _self.lname
          : lname // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
