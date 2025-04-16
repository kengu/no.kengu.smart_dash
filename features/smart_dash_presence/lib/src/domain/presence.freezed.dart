// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'presence.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Presence {
  Token get token;
  bool get isHome;
  DateTime get when;
  List<Token> get members;

  /// Create a copy of Presence
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PresenceCopyWith<Presence> get copyWith =>
      _$PresenceCopyWithImpl<Presence>(this as Presence, _$identity);

  /// Serializes this Presence to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Presence &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.isHome, isHome) || other.isHome == isHome) &&
            (identical(other.when, when) || other.when == when) &&
            const DeepCollectionEquality().equals(other.members, members));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, token, isHome, when,
      const DeepCollectionEquality().hash(members));

  @override
  String toString() {
    return 'Presence(token: $token, isHome: $isHome, when: $when, members: $members)';
  }
}

/// @nodoc
abstract mixin class $PresenceCopyWith<$Res> {
  factory $PresenceCopyWith(Presence value, $Res Function(Presence) _then) =
      _$PresenceCopyWithImpl;
  @useResult
  $Res call({Token token, bool isHome, DateTime when, List<Token> members});

  $TokenCopyWith<$Res> get token;
}

/// @nodoc
class _$PresenceCopyWithImpl<$Res> implements $PresenceCopyWith<$Res> {
  _$PresenceCopyWithImpl(this._self, this._then);

  final Presence _self;
  final $Res Function(Presence) _then;

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
    return _then(_self.copyWith(
      token: null == token
          ? _self.token
          : token // ignore: cast_nullable_to_non_nullable
              as Token,
      isHome: null == isHome
          ? _self.isHome
          : isHome // ignore: cast_nullable_to_non_nullable
              as bool,
      when: null == when
          ? _self.when
          : when // ignore: cast_nullable_to_non_nullable
              as DateTime,
      members: null == members
          ? _self.members
          : members // ignore: cast_nullable_to_non_nullable
              as List<Token>,
    ));
  }

  /// Create a copy of Presence
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TokenCopyWith<$Res> get token {
    return $TokenCopyWith<$Res>(_self.token, (value) {
      return _then(_self.copyWith(token: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _Presence extends Presence {
  const _Presence(
      {required this.token,
      required this.isHome,
      required this.when,
      required final List<Token> members})
      : _members = members,
        super._();
  factory _Presence.fromJson(Map<String, dynamic> json) =>
      _$PresenceFromJson(json);

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

  /// Create a copy of Presence
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PresenceCopyWith<_Presence> get copyWith =>
      __$PresenceCopyWithImpl<_Presence>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PresenceToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Presence &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.isHome, isHome) || other.isHome == isHome) &&
            (identical(other.when, when) || other.when == when) &&
            const DeepCollectionEquality().equals(other._members, _members));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, token, isHome, when,
      const DeepCollectionEquality().hash(_members));

  @override
  String toString() {
    return 'Presence(token: $token, isHome: $isHome, when: $when, members: $members)';
  }
}

/// @nodoc
abstract mixin class _$PresenceCopyWith<$Res>
    implements $PresenceCopyWith<$Res> {
  factory _$PresenceCopyWith(_Presence value, $Res Function(_Presence) _then) =
      __$PresenceCopyWithImpl;
  @override
  @useResult
  $Res call({Token token, bool isHome, DateTime when, List<Token> members});

  @override
  $TokenCopyWith<$Res> get token;
}

/// @nodoc
class __$PresenceCopyWithImpl<$Res> implements _$PresenceCopyWith<$Res> {
  __$PresenceCopyWithImpl(this._self, this._then);

  final _Presence _self;
  final $Res Function(_Presence) _then;

  /// Create a copy of Presence
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? token = null,
    Object? isHome = null,
    Object? when = null,
    Object? members = null,
  }) {
    return _then(_Presence(
      token: null == token
          ? _self.token
          : token // ignore: cast_nullable_to_non_nullable
              as Token,
      isHome: null == isHome
          ? _self.isHome
          : isHome // ignore: cast_nullable_to_non_nullable
              as bool,
      when: null == when
          ? _self.when
          : when // ignore: cast_nullable_to_non_nullable
              as DateTime,
      members: null == members
          ? _self._members
          : members // ignore: cast_nullable_to_non_nullable
              as List<Token>,
    ));
  }

  /// Create a copy of Presence
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TokenCopyWith<$Res> get token {
    return $TokenCopyWith<$Res>(_self.token, (value) {
      return _then(_self.copyWith(token: value));
    });
  }
}

// dart format on
