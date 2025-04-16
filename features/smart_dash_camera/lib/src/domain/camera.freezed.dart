// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'camera.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Camera {
// ignore: invalid_annotation_target
  @JsonKey(name: 'name')
  String get name;
  @JsonKey(name: 'service')
  String get service;
  @JsonKey(name: 'motion')
  MotionDetectConfig? get motion;

  /// Create a copy of Camera
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CameraCopyWith<Camera> get copyWith =>
      _$CameraCopyWithImpl<Camera>(this as Camera, _$identity);

  /// Serializes this Camera to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Camera &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.service, service) || other.service == service) &&
            (identical(other.motion, motion) || other.motion == motion));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, service, motion);

  @override
  String toString() {
    return 'Camera(name: $name, service: $service, motion: $motion)';
  }
}

/// @nodoc
abstract mixin class $CameraCopyWith<$Res> {
  factory $CameraCopyWith(Camera value, $Res Function(Camera) _then) =
      _$CameraCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String name,
      @JsonKey(name: 'service') String service,
      @JsonKey(name: 'motion') MotionDetectConfig? motion});

  $MotionDetectConfigCopyWith<$Res>? get motion;
}

/// @nodoc
class _$CameraCopyWithImpl<$Res> implements $CameraCopyWith<$Res> {
  _$CameraCopyWithImpl(this._self, this._then);

  final Camera _self;
  final $Res Function(Camera) _then;

  /// Create a copy of Camera
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? service = null,
    Object? motion = freezed,
  }) {
    return _then(_self.copyWith(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      service: null == service
          ? _self.service
          : service // ignore: cast_nullable_to_non_nullable
              as String,
      motion: freezed == motion
          ? _self.motion
          : motion // ignore: cast_nullable_to_non_nullable
              as MotionDetectConfig?,
    ));
  }

  /// Create a copy of Camera
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MotionDetectConfigCopyWith<$Res>? get motion {
    if (_self.motion == null) {
      return null;
    }

    return $MotionDetectConfigCopyWith<$Res>(_self.motion!, (value) {
      return _then(_self.copyWith(motion: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _Camera extends Camera {
  const _Camera(
      {@JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'service') required this.service,
      @JsonKey(name: 'motion') required this.motion})
      : super._();
  factory _Camera.fromJson(Map<String, dynamic> json) => _$CameraFromJson(json);

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

  /// Create a copy of Camera
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CameraCopyWith<_Camera> get copyWith =>
      __$CameraCopyWithImpl<_Camera>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CameraToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Camera &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.service, service) || other.service == service) &&
            (identical(other.motion, motion) || other.motion == motion));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, service, motion);

  @override
  String toString() {
    return 'Camera(name: $name, service: $service, motion: $motion)';
  }
}

/// @nodoc
abstract mixin class _$CameraCopyWith<$Res> implements $CameraCopyWith<$Res> {
  factory _$CameraCopyWith(_Camera value, $Res Function(_Camera) _then) =
      __$CameraCopyWithImpl;
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
class __$CameraCopyWithImpl<$Res> implements _$CameraCopyWith<$Res> {
  __$CameraCopyWithImpl(this._self, this._then);

  final _Camera _self;
  final $Res Function(_Camera) _then;

  /// Create a copy of Camera
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? service = null,
    Object? motion = freezed,
  }) {
    return _then(_Camera(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      service: null == service
          ? _self.service
          : service // ignore: cast_nullable_to_non_nullable
              as String,
      motion: freezed == motion
          ? _self.motion
          : motion // ignore: cast_nullable_to_non_nullable
              as MotionDetectConfig?,
    ));
  }

  /// Create a copy of Camera
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MotionDetectConfigCopyWith<$Res>? get motion {
    if (_self.motion == null) {
      return null;
    }

    return $MotionDetectConfigCopyWith<$Res>(_self.motion!, (value) {
      return _then(_self.copyWith(motion: value));
    });
  }
}

/// @nodoc
mixin _$MotionDetectConfig {
  bool get enabled;
  MotionDetectSensitivityLevel get sensitivity;

  /// Create a copy of MotionDetectConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MotionDetectConfigCopyWith<MotionDetectConfig> get copyWith =>
      _$MotionDetectConfigCopyWithImpl<MotionDetectConfig>(
          this as MotionDetectConfig, _$identity);

  /// Serializes this MotionDetectConfig to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MotionDetectConfig &&
            (identical(other.enabled, enabled) || other.enabled == enabled) &&
            (identical(other.sensitivity, sensitivity) ||
                other.sensitivity == sensitivity));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, enabled, sensitivity);

  @override
  String toString() {
    return 'MotionDetectConfig(enabled: $enabled, sensitivity: $sensitivity)';
  }
}

/// @nodoc
abstract mixin class $MotionDetectConfigCopyWith<$Res> {
  factory $MotionDetectConfigCopyWith(
          MotionDetectConfig value, $Res Function(MotionDetectConfig) _then) =
      _$MotionDetectConfigCopyWithImpl;
  @useResult
  $Res call({bool enabled, MotionDetectSensitivityLevel sensitivity});
}

/// @nodoc
class _$MotionDetectConfigCopyWithImpl<$Res>
    implements $MotionDetectConfigCopyWith<$Res> {
  _$MotionDetectConfigCopyWithImpl(this._self, this._then);

  final MotionDetectConfig _self;
  final $Res Function(MotionDetectConfig) _then;

  /// Create a copy of MotionDetectConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enabled = null,
    Object? sensitivity = null,
  }) {
    return _then(_self.copyWith(
      enabled: null == enabled
          ? _self.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
      sensitivity: null == sensitivity
          ? _self.sensitivity
          : sensitivity // ignore: cast_nullable_to_non_nullable
              as MotionDetectSensitivityLevel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _MotionDetectConfig extends MotionDetectConfig {
  const _MotionDetectConfig({required this.enabled, required this.sensitivity})
      : super._();
  factory _MotionDetectConfig.fromJson(Map<String, dynamic> json) =>
      _$MotionDetectConfigFromJson(json);

  @override
  final bool enabled;
  @override
  final MotionDetectSensitivityLevel sensitivity;

  /// Create a copy of MotionDetectConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MotionDetectConfigCopyWith<_MotionDetectConfig> get copyWith =>
      __$MotionDetectConfigCopyWithImpl<_MotionDetectConfig>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MotionDetectConfigToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MotionDetectConfig &&
            (identical(other.enabled, enabled) || other.enabled == enabled) &&
            (identical(other.sensitivity, sensitivity) ||
                other.sensitivity == sensitivity));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, enabled, sensitivity);

  @override
  String toString() {
    return 'MotionDetectConfig(enabled: $enabled, sensitivity: $sensitivity)';
  }
}

/// @nodoc
abstract mixin class _$MotionDetectConfigCopyWith<$Res>
    implements $MotionDetectConfigCopyWith<$Res> {
  factory _$MotionDetectConfigCopyWith(
          _MotionDetectConfig value, $Res Function(_MotionDetectConfig) _then) =
      __$MotionDetectConfigCopyWithImpl;
  @override
  @useResult
  $Res call({bool enabled, MotionDetectSensitivityLevel sensitivity});
}

/// @nodoc
class __$MotionDetectConfigCopyWithImpl<$Res>
    implements _$MotionDetectConfigCopyWith<$Res> {
  __$MotionDetectConfigCopyWithImpl(this._self, this._then);

  final _MotionDetectConfig _self;
  final $Res Function(_MotionDetectConfig) _then;

  /// Create a copy of MotionDetectConfig
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? enabled = null,
    Object? sensitivity = null,
  }) {
    return _then(_MotionDetectConfig(
      enabled: null == enabled
          ? _self.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
      sensitivity: null == sensitivity
          ? _self.sensitivity
          : sensitivity // ignore: cast_nullable_to_non_nullable
              as MotionDetectSensitivityLevel,
    ));
  }
}

// dart format on
