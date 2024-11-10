// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'switch_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SwitchState _$SwitchStateFromJson(Map<String, dynamic> json) {
  return _SwitchState.fromJson(json);
}

/// @nodoc
mixin _$SwitchState {
  /// Device switch state (true:on/false:off)
  bool get state => throw _privateConstructorUsedError;

  /// Current switch mode
  SwitchMode get mode => throw _privateConstructorUsedError;

  /// Switch mode when on
  SwitchMode get onMode => throw _privateConstructorUsedError;

  /// Switch mode when off
  SwitchMode get offMode => throw _privateConstructorUsedError;

  /// [DateTime] timestamp of when data was updated last
  DateTime get lastUpdated => throw _privateConstructorUsedError;

  /// Serializes this SwitchState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SwitchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SwitchStateCopyWith<SwitchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SwitchStateCopyWith<$Res> {
  factory $SwitchStateCopyWith(
          SwitchState value, $Res Function(SwitchState) then) =
      _$SwitchStateCopyWithImpl<$Res, SwitchState>;
  @useResult
  $Res call(
      {bool state,
      SwitchMode mode,
      SwitchMode onMode,
      SwitchMode offMode,
      DateTime lastUpdated});
}

/// @nodoc
class _$SwitchStateCopyWithImpl<$Res, $Val extends SwitchState>
    implements $SwitchStateCopyWith<$Res> {
  _$SwitchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SwitchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? mode = null,
    Object? onMode = null,
    Object? offMode = null,
    Object? lastUpdated = null,
  }) {
    return _then(_value.copyWith(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as bool,
      mode: null == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as SwitchMode,
      onMode: null == onMode
          ? _value.onMode
          : onMode // ignore: cast_nullable_to_non_nullable
              as SwitchMode,
      offMode: null == offMode
          ? _value.offMode
          : offMode // ignore: cast_nullable_to_non_nullable
              as SwitchMode,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SwitchStateImplCopyWith<$Res>
    implements $SwitchStateCopyWith<$Res> {
  factory _$$SwitchStateImplCopyWith(
          _$SwitchStateImpl value, $Res Function(_$SwitchStateImpl) then) =
      __$$SwitchStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool state,
      SwitchMode mode,
      SwitchMode onMode,
      SwitchMode offMode,
      DateTime lastUpdated});
}

/// @nodoc
class __$$SwitchStateImplCopyWithImpl<$Res>
    extends _$SwitchStateCopyWithImpl<$Res, _$SwitchStateImpl>
    implements _$$SwitchStateImplCopyWith<$Res> {
  __$$SwitchStateImplCopyWithImpl(
      _$SwitchStateImpl _value, $Res Function(_$SwitchStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SwitchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? mode = null,
    Object? onMode = null,
    Object? offMode = null,
    Object? lastUpdated = null,
  }) {
    return _then(_$SwitchStateImpl(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as bool,
      mode: null == mode
          ? _value.mode
          : mode // ignore: cast_nullable_to_non_nullable
              as SwitchMode,
      onMode: null == onMode
          ? _value.onMode
          : onMode // ignore: cast_nullable_to_non_nullable
              as SwitchMode,
      offMode: null == offMode
          ? _value.offMode
          : offMode // ignore: cast_nullable_to_non_nullable
              as SwitchMode,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SwitchStateImpl extends _SwitchState {
  const _$SwitchStateImpl(
      {required this.state,
      required this.mode,
      required this.onMode,
      required this.offMode,
      required this.lastUpdated})
      : super._();

  factory _$SwitchStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$SwitchStateImplFromJson(json);

  /// Device switch state (true:on/false:off)
  @override
  final bool state;

  /// Current switch mode
  @override
  final SwitchMode mode;

  /// Switch mode when on
  @override
  final SwitchMode onMode;

  /// Switch mode when off
  @override
  final SwitchMode offMode;

  /// [DateTime] timestamp of when data was updated last
  @override
  final DateTime lastUpdated;

  @override
  String toString() {
    return 'SwitchState(state: $state, mode: $mode, onMode: $onMode, offMode: $offMode, lastUpdated: $lastUpdated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SwitchStateImpl &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.mode, mode) || other.mode == mode) &&
            (identical(other.onMode, onMode) || other.onMode == onMode) &&
            (identical(other.offMode, offMode) || other.offMode == offMode) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, state, mode, onMode, offMode, lastUpdated);

  /// Create a copy of SwitchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SwitchStateImplCopyWith<_$SwitchStateImpl> get copyWith =>
      __$$SwitchStateImplCopyWithImpl<_$SwitchStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SwitchStateImplToJson(
      this,
    );
  }
}

abstract class _SwitchState extends SwitchState {
  const factory _SwitchState(
      {required final bool state,
      required final SwitchMode mode,
      required final SwitchMode onMode,
      required final SwitchMode offMode,
      required final DateTime lastUpdated}) = _$SwitchStateImpl;
  const _SwitchState._() : super._();

  factory _SwitchState.fromJson(Map<String, dynamic> json) =
      _$SwitchStateImpl.fromJson;

  /// Device switch state (true:on/false:off)
  @override
  bool get state;

  /// Current switch mode
  @override
  SwitchMode get mode;

  /// Switch mode when on
  @override
  SwitchMode get onMode;

  /// Switch mode when off
  @override
  SwitchMode get offMode;

  /// [DateTime] timestamp of when data was updated last
  @override
  DateTime get lastUpdated;

  /// Create a copy of SwitchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SwitchStateImplCopyWith<_$SwitchStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
