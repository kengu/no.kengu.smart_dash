// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'presence.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Presence _$PresenceFromJson(Map<String, dynamic> json) {
  return _Presence.fromJson(json);
}

/// @nodoc
mixin _$Presence {
  Token get token => throw _privateConstructorUsedError;
  bool get isHome => throw _privateConstructorUsedError;
  DateTime get when => throw _privateConstructorUsedError;
  List<Token> get members => throw _privateConstructorUsedError;

  /// Serializes this Presence to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Presence
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PresenceCopyWith<Presence> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PresenceCopyWith<$Res> {
  factory $PresenceCopyWith(Presence value, $Res Function(Presence) then) =
      _$PresenceCopyWithImpl<$Res, Presence>;
  @useResult
  $Res call({Token token, bool isHome, DateTime when, List<Token> members});

  $TokenCopyWith<$Res> get token;
}

/// @nodoc
class _$PresenceCopyWithImpl<$Res, $Val extends Presence>
    implements $PresenceCopyWith<$Res> {
  _$PresenceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Presence
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? isHome = null,
    Object? when = null,
    Object? members = null,
  }) {
    return _then(_value.copyWith(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as Token,
      isHome: null == isHome
          ? _value.isHome
          : isHome // ignore: cast_nullable_to_non_nullable
              as bool,
      when: null == when
          ? _value.when
          : when // ignore: cast_nullable_to_non_nullable
              as DateTime,
      members: null == members
          ? _value.members
          : members // ignore: cast_nullable_to_non_nullable
              as List<Token>,
    ) as $Val);
  }

  /// Create a copy of Presence
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TokenCopyWith<$Res> get token {
    return $TokenCopyWith<$Res>(_value.token, (value) {
      return _then(_value.copyWith(token: value) as $Val);
    });
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
  $Res call({Token token, bool isHome, DateTime when, List<Token> members});

  @override
  $TokenCopyWith<$Res> get token;
}

/// @nodoc
class __$$PresenceImplCopyWithImpl<$Res>
    extends _$PresenceCopyWithImpl<$Res, _$PresenceImpl>
    implements _$$PresenceImplCopyWith<$Res> {
  __$$PresenceImplCopyWithImpl(
      _$PresenceImpl _value, $Res Function(_$PresenceImpl) _then)
      : super(_value, _then);

  /// Create a copy of Presence
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? isHome = null,
    Object? when = null,
    Object? members = null,
  }) {
    return _then(_$PresenceImpl(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as Token,
      isHome: null == isHome
          ? _value.isHome
          : isHome // ignore: cast_nullable_to_non_nullable
              as bool,
      when: null == when
          ? _value.when
          : when // ignore: cast_nullable_to_non_nullable
              as DateTime,
      members: null == members
          ? _value._members
          : members // ignore: cast_nullable_to_non_nullable
              as List<Token>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PresenceImpl extends _Presence {
  const _$PresenceImpl(
      {required this.token,
      required this.isHome,
      required this.when,
      required final List<Token> members})
      : _members = members,
        super._();

  factory _$PresenceImpl.fromJson(Map<String, dynamic> json) =>
      _$$PresenceImplFromJson(json);

  @override
  final Token token;
  @override
  final bool isHome;
  @override
  final DateTime when;
  final List<Token> _members;
  @override
  List<Token> get members {
    if (_members is EqualUnmodifiableListView) return _members;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_members);
  }

  @override
  String toString() {
    return 'Presence(token: $token, isHome: $isHome, when: $when, members: $members)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PresenceImpl &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.isHome, isHome) || other.isHome == isHome) &&
            (identical(other.when, when) || other.when == when) &&
            const DeepCollectionEquality().equals(other._members, _members));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, token, isHome, when,
      const DeepCollectionEquality().hash(_members));

  /// Create a copy of Presence
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
      {required final Token token,
      required final bool isHome,
      required final DateTime when,
      required final List<Token> members}) = _$PresenceImpl;
  const _Presence._() : super._();

  factory _Presence.fromJson(Map<String, dynamic> json) =
      _$PresenceImpl.fromJson;

  @override
  Token get token;
  @override
  bool get isHome;
  @override
  DateTime get when;
  @override
  List<Token> get members;

  /// Create a copy of Presence
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PresenceImplCopyWith<_$PresenceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
