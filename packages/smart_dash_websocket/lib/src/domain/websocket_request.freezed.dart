// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'websocket_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WebSocketRequest {
  WebSocketAction get action;
  WebSocketMessage get message;

  /// Create a copy of WebSocketRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WebSocketRequestCopyWith<WebSocketRequest> get copyWith =>
      _$WebSocketRequestCopyWithImpl<WebSocketRequest>(
          this as WebSocketRequest, _$identity);

  /// Serializes this WebSocketRequest to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WebSocketRequest &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, action, message);

  @override
  String toString() {
    return 'WebSocketRequest(action: $action, message: $message)';
  }
}

/// @nodoc
abstract mixin class $WebSocketRequestCopyWith<$Res> {
  factory $WebSocketRequestCopyWith(
          WebSocketRequest value, $Res Function(WebSocketRequest) _then) =
      _$WebSocketRequestCopyWithImpl;
  @useResult
  $Res call({WebSocketAction action, WebSocketMessage message});

  $WebSocketMessageCopyWith<$Res> get message;
}

/// @nodoc
class _$WebSocketRequestCopyWithImpl<$Res>
    implements $WebSocketRequestCopyWith<$Res> {
  _$WebSocketRequestCopyWithImpl(this._self, this._then);

  final WebSocketRequest _self;
  final $Res Function(WebSocketRequest) _then;

  /// Create a copy of WebSocketRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? action = null,
    Object? message = null,
  }) {
    return _then(_self.copyWith(
      action: null == action
          ? _self.action
          : action // ignore: cast_nullable_to_non_nullable
              as WebSocketAction,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as WebSocketMessage,
    ));
  }

  /// Create a copy of WebSocketRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WebSocketMessageCopyWith<$Res> get message {
    return $WebSocketMessageCopyWith<$Res>(_self.message, (value) {
      return _then(_self.copyWith(message: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _WebSocketRequest extends WebSocketRequest {
  const _WebSocketRequest({required this.action, required this.message})
      : super._();
  factory _WebSocketRequest.fromJson(Map<String, dynamic> json) =>
      _$WebSocketRequestFromJson(json);

  @override
  final WebSocketAction action;
  @override
  final WebSocketMessage message;

  /// Create a copy of WebSocketRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WebSocketRequestCopyWith<_WebSocketRequest> get copyWith =>
      __$WebSocketRequestCopyWithImpl<_WebSocketRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$WebSocketRequestToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WebSocketRequest &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, action, message);

  @override
  String toString() {
    return 'WebSocketRequest(action: $action, message: $message)';
  }
}

/// @nodoc
abstract mixin class _$WebSocketRequestCopyWith<$Res>
    implements $WebSocketRequestCopyWith<$Res> {
  factory _$WebSocketRequestCopyWith(
          _WebSocketRequest value, $Res Function(_WebSocketRequest) _then) =
      __$WebSocketRequestCopyWithImpl;
  @override
  @useResult
  $Res call({WebSocketAction action, WebSocketMessage message});

  @override
  $WebSocketMessageCopyWith<$Res> get message;
}

/// @nodoc
class __$WebSocketRequestCopyWithImpl<$Res>
    implements _$WebSocketRequestCopyWith<$Res> {
  __$WebSocketRequestCopyWithImpl(this._self, this._then);

  final _WebSocketRequest _self;
  final $Res Function(_WebSocketRequest) _then;

  /// Create a copy of WebSocketRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? action = null,
    Object? message = null,
  }) {
    return _then(_WebSocketRequest(
      action: null == action
          ? _self.action
          : action // ignore: cast_nullable_to_non_nullable
              as WebSocketAction,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as WebSocketMessage,
    ));
  }

  /// Create a copy of WebSocketRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WebSocketMessageCopyWith<$Res> get message {
    return $WebSocketMessageCopyWith<$Res>(_self.message, (value) {
      return _then(_self.copyWith(message: value));
    });
  }
}

// dart format on
