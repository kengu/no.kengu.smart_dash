// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'camera.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Camera _$CameraFromJson(Map<String, dynamic> json) {
  return _Camera.fromJson(json);
}

/// @nodoc
mixin _$Camera {
// ignore: invalid_annotation_target
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'service')
  String get service => throw _privateConstructorUsedError;
  @JsonKey(name: 'motion')
  MotionDetectConfig? get motion => throw _privateConstructorUsedError;

  /// Serializes this Camera to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Camera
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CameraCopyWith<Camera> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CameraCopyWith<$Res> {
  factory $CameraCopyWith(Camera value, $Res Function(Camera) then) =
      _$CameraCopyWithImpl<$Res, Camera>;
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String name,
      @JsonKey(name: 'service') String service,
      @JsonKey(name: 'motion') MotionDetectConfig? motion});

  $MotionDetectConfigCopyWith<$Res>? get motion;
}

/// @nodoc
class _$CameraCopyWithImpl<$Res, $Val extends Camera>
    implements $CameraCopyWith<$Res> {
  _$CameraCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Camera
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? service = null,
    Object? motion = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      service: null == service
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as String,
      motion: freezed == motion
          ? _value.motion
          : motion // ignore: cast_nullable_to_non_nullable
              as MotionDetectConfig?,
    ) as $Val);
  }

  /// Create a copy of Camera
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MotionDetectConfigCopyWith<$Res>? get motion {
    if (_value.motion == null) {
      return null;
    }

    return $MotionDetectConfigCopyWith<$Res>(_value.motion!, (value) {
      return _then(_value.copyWith(motion: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CameraImplCopyWith<$Res> implements $CameraCopyWith<$Res> {
  factory _$$CameraImplCopyWith(
          _$CameraImpl value, $Res Function(_$CameraImpl) then) =
      __$$CameraImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String name,
      @JsonKey(name: 'service') String service,
      @JsonKey(name: 'motion') MotionDetectConfig? motion});

  @override
  $MotionDetectConfigCopyWith<$Res>? get motion;
}

/// @nodoc
class __$$CameraImplCopyWithImpl<$Res>
    extends _$CameraCopyWithImpl<$Res, _$CameraImpl>
    implements _$$CameraImplCopyWith<$Res> {
  __$$CameraImplCopyWithImpl(
      _$CameraImpl _value, $Res Function(_$CameraImpl) _then)
      : super(_value, _then);

  /// Create a copy of Camera
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? service = null,
    Object? motion = freezed,
  }) {
    return _then(_$CameraImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      service: null == service
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as String,
      motion: freezed == motion
          ? _value.motion
          : motion // ignore: cast_nullable_to_non_nullable
              as MotionDetectConfig?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CameraImpl extends _Camera {
  const _$CameraImpl(
      {@JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'service') required this.service,
      @JsonKey(name: 'motion') required this.motion})
      : super._();

  factory _$CameraImpl.fromJson(Map<String, dynamic> json) =>
      _$$CameraImplFromJson(json);

// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'service')
  final String service;
  @override
  @JsonKey(name: 'motion')
  final MotionDetectConfig? motion;

  @override
  String toString() {
    return 'Camera(name: $name, service: $service, motion: $motion)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CameraImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.service, service) || other.service == service) &&
            (identical(other.motion, motion) || other.motion == motion));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, service, motion);

  /// Create a copy of Camera
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CameraImplCopyWith<_$CameraImpl> get copyWith =>
      __$$CameraImplCopyWithImpl<_$CameraImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CameraImplToJson(
      this,
    );
  }
}

abstract class _Camera extends Camera {
  const factory _Camera(
          {@JsonKey(name: 'name') required final String name,
          @JsonKey(name: 'service') required final String service,
          @JsonKey(name: 'motion') required final MotionDetectConfig? motion}) =
      _$CameraImpl;
  const _Camera._() : super._();

  factory _Camera.fromJson(Map<String, dynamic> json) = _$CameraImpl.fromJson;

// ignore: invalid_annotation_target
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'service')
  String get service;
  @override
  @JsonKey(name: 'motion')
  MotionDetectConfig? get motion;

  /// Create a copy of Camera
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CameraImplCopyWith<_$CameraImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MotionDetectConfig _$MotionDetectConfigFromJson(Map<String, dynamic> json) {
  return _MotionDetectConfig.fromJson(json);
}

/// @nodoc
mixin _$MotionDetectConfig {
  bool get enabled => throw _privateConstructorUsedError;
  MotionDetectSensitivityLevel get sensitivity =>
      throw _privateConstructorUsedError;

  /// Serializes this MotionDetectConfig to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MotionDetectConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MotionDetectConfigCopyWith<MotionDetectConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MotionDetectConfigCopyWith<$Res> {
  factory $MotionDetectConfigCopyWith(
          MotionDetectConfig value, $Res Function(MotionDetectConfig) then) =
      _$MotionDetectConfigCopyWithImpl<$Res, MotionDetectConfig>;
  @useResult
  $Res call({bool enabled, MotionDetectSensitivityLevel sensitivity});
}

/// @nodoc
class _$MotionDetectConfigCopyWithImpl<$Res, $Val extends MotionDetectConfig>
    implements $MotionDetectConfigCopyWith<$Res> {
  _$MotionDetectConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MotionDetectConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enabled = null,
    Object? sensitivity = null,
  }) {
    return _then(_value.copyWith(
      enabled: null == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
      sensitivity: null == sensitivity
          ? _value.sensitivity
          : sensitivity // ignore: cast_nullable_to_non_nullable
              as MotionDetectSensitivityLevel,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MotionDetectConfigImplCopyWith<$Res>
    implements $MotionDetectConfigCopyWith<$Res> {
  factory _$$MotionDetectConfigImplCopyWith(_$MotionDetectConfigImpl value,
          $Res Function(_$MotionDetectConfigImpl) then) =
      __$$MotionDetectConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool enabled, MotionDetectSensitivityLevel sensitivity});
}

/// @nodoc
class __$$MotionDetectConfigImplCopyWithImpl<$Res>
    extends _$MotionDetectConfigCopyWithImpl<$Res, _$MotionDetectConfigImpl>
    implements _$$MotionDetectConfigImplCopyWith<$Res> {
  __$$MotionDetectConfigImplCopyWithImpl(_$MotionDetectConfigImpl _value,
      $Res Function(_$MotionDetectConfigImpl) _then)
      : super(_value, _then);

  /// Create a copy of MotionDetectConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enabled = null,
    Object? sensitivity = null,
  }) {
    return _then(_$MotionDetectConfigImpl(
      enabled: null == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
      sensitivity: null == sensitivity
          ? _value.sensitivity
          : sensitivity // ignore: cast_nullable_to_non_nullable
              as MotionDetectSensitivityLevel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MotionDetectConfigImpl extends _MotionDetectConfig {
  const _$MotionDetectConfigImpl(
      {required this.enabled, required this.sensitivity})
      : super._();

  factory _$MotionDetectConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$MotionDetectConfigImplFromJson(json);

  @override
  final bool enabled;
  @override
  final MotionDetectSensitivityLevel sensitivity;

  @override
  String toString() {
    return 'MotionDetectConfig(enabled: $enabled, sensitivity: $sensitivity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MotionDetectConfigImpl &&
            (identical(other.enabled, enabled) || other.enabled == enabled) &&
            (identical(other.sensitivity, sensitivity) ||
                other.sensitivity == sensitivity));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, enabled, sensitivity);

  /// Create a copy of MotionDetectConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MotionDetectConfigImplCopyWith<_$MotionDetectConfigImpl> get copyWith =>
      __$$MotionDetectConfigImplCopyWithImpl<_$MotionDetectConfigImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MotionDetectConfigImplToJson(
      this,
    );
  }
}

abstract class _MotionDetectConfig extends MotionDetectConfig {
  const factory _MotionDetectConfig(
          {required final bool enabled,
          required final MotionDetectSensitivityLevel sensitivity}) =
      _$MotionDetectConfigImpl;
  const _MotionDetectConfig._() : super._();

  factory _MotionDetectConfig.fromJson(Map<String, dynamic> json) =
      _$MotionDetectConfigImpl.fromJson;

  @override
  bool get enabled;
  @override
  MotionDetectSensitivityLevel get sensitivity;

  /// Create a copy of MotionDetectConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MotionDetectConfigImplCopyWith<_$MotionDetectConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
