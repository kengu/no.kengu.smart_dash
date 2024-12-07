// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'websocket_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WebSocketRequest _$WebSocketRequestFromJson(Map<String, dynamic> json) {
  return _WebSocketRequest.fromJson(json);
}

/// @nodoc
mixin _$WebSocketRequest {
  WebSocketAction get action => throw _privateConstructorUsedError;
  WebSocketMessage get message => throw _privateConstructorUsedError;

  /// Serializes this WebSocketRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WebSocketRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WebSocketRequestCopyWith<WebSocketRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WebSocketRequestCopyWith<$Res> {
  factory $WebSocketRequestCopyWith(
          WebSocketRequest value, $Res Function(WebSocketRequest) then) =
      _$WebSocketRequestCopyWithImpl<$Res, WebSocketRequest>;
  @useResult
  $Res call({WebSocketAction action, WebSocketMessage message});

  $WebSocketMessageCopyWith<$Res> get message;
}

/// @nodoc
class _$WebSocketRequestCopyWithImpl<$Res, $Val extends WebSocketRequest>
    implements $WebSocketRequestCopyWith<$Res> {
  _$WebSocketRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WebSocketRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? action = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as WebSocketAction,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as WebSocketMessage,
    ) as $Val);
  }

  /// Create a copy of WebSocketRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WebSocketMessageCopyWith<$Res> get message {
    return $WebSocketMessageCopyWith<$Res>(_value.message, (value) {
      return _then(_value.copyWith(message: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WebSocketRequestImplCopyWith<$Res>
    implements $WebSocketRequestCopyWith<$Res> {
  factory _$$WebSocketRequestImplCopyWith(_$WebSocketRequestImpl value,
          $Res Function(_$WebSocketRequestImpl) then) =
      __$$WebSocketRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({WebSocketAction action, WebSocketMessage message});

  @override
  $WebSocketMessageCopyWith<$Res> get message;
}

/// @nodoc
class __$$WebSocketRequestImplCopyWithImpl<$Res>
    extends _$WebSocketRequestCopyWithImpl<$Res, _$WebSocketRequestImpl>
    implements _$$WebSocketRequestImplCopyWith<$Res> {
  __$$WebSocketRequestImplCopyWithImpl(_$WebSocketRequestImpl _value,
      $Res Function(_$WebSocketRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of WebSocketRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? action = null,
    Object? message = null,
  }) {
    return _then(_$WebSocketRequestImpl(
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as WebSocketAction,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as WebSocketMessage,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WebSocketRequestImpl extends _WebSocketRequest {
  const _$WebSocketRequestImpl({required this.action, required this.message})
      : super._();

  factory _$WebSocketRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$WebSocketRequestImplFromJson(json);

  @override
  final WebSocketAction action;
  @override
  final WebSocketMessage message;

  @override
  String toString() {
    return 'WebSocketRequest(action: $action, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WebSocketRequestImpl &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, action, message);

  /// Create a copy of WebSocketRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WebSocketRequestImplCopyWith<_$WebSocketRequestImpl> get copyWith =>
      __$$WebSocketRequestImplCopyWithImpl<_$WebSocketRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WebSocketRequestImplToJson(
      this,
    );
  }
}

abstract class _WebSocketRequest extends WebSocketRequest {
  const factory _WebSocketRequest(
      {required final WebSocketAction action,
      required final WebSocketMessage message}) = _$WebSocketRequestImpl;
  const _WebSocketRequest._() : super._();

  factory _WebSocketRequest.fromJson(Map<String, dynamic> json) =
      _$WebSocketRequestImpl.fromJson;

  @override
  WebSocketAction get action;
  @override
  WebSocketMessage get message;

  /// Create a copy of WebSocketRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WebSocketRequestImplCopyWith<_$WebSocketRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
