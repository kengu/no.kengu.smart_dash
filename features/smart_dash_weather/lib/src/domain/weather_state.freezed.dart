// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WeatherState {
  @JsonKey(name: 'service')
  String get service;
  @JsonKey(name: 'geometry')
  PointGeometry get geometry;
  @JsonKey(name: 'properties')
  WeatherProperties get props;
  @JsonKey(name: 'place')
  String? get place;
  @JsonKey(name: 'observedBy')
  String? get observedBy;

  /// Create a copy of WeatherState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WeatherStateCopyWith<WeatherState> get copyWith =>
      _$WeatherStateCopyWithImpl<WeatherState>(
          this as WeatherState, _$identity);

  /// Serializes this WeatherState to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WeatherState &&
            (identical(other.service, service) || other.service == service) &&
            (identical(other.geometry, geometry) ||
                other.geometry == geometry) &&
            (identical(other.props, props) || other.props == props) &&
            (identical(other.place, place) || other.place == place) &&
            (identical(other.observedBy, observedBy) ||
                other.observedBy == observedBy));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, service, geometry, props, place, observedBy);

  @override
  String toString() {
    return 'WeatherState(service: $service, geometry: $geometry, props: $props, place: $place, observedBy: $observedBy)';
  }
}

/// @nodoc
abstract mixin class $WeatherStateCopyWith<$Res> {
  factory $WeatherStateCopyWith(
          WeatherState value, $Res Function(WeatherState) _then) =
      _$WeatherStateCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'service') String service,
      @JsonKey(name: 'geometry') PointGeometry geometry,
      @JsonKey(name: 'properties') WeatherProperties props,
      @JsonKey(name: 'place') String? place,
      @JsonKey(name: 'observedBy') String? observedBy});

  $PointGeometryCopyWith<$Res> get geometry;
  $WeatherPropertiesCopyWith<$Res> get props;
}

/// @nodoc
class _$WeatherStateCopyWithImpl<$Res> implements $WeatherStateCopyWith<$Res> {
  _$WeatherStateCopyWithImpl(this._self, this._then);

  final WeatherState _self;
  final $Res Function(WeatherState) _then;

  /// Create a copy of WeatherState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? service = null,
    Object? geometry = null,
    Object? props = null,
    Object? place = freezed,
    Object? observedBy = freezed,
  }) {
    return _then(_self.copyWith(
      service: null == service
          ? _self.service
          : service // ignore: cast_nullable_to_non_nullable
              as String,
      geometry: null == geometry
          ? _self.geometry
          : geometry // ignore: cast_nullable_to_non_nullable
              as PointGeometry,
      props: null == props
          ? _self.props
          : props // ignore: cast_nullable_to_non_nullable
              as WeatherProperties,
      place: freezed == place
          ? _self.place
          : place // ignore: cast_nullable_to_non_nullable
              as String?,
      observedBy: freezed == observedBy
          ? _self.observedBy
          : observedBy // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of WeatherState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PointGeometryCopyWith<$Res> get geometry {
    return $PointGeometryCopyWith<$Res>(_self.geometry, (value) {
      return _then(_self.copyWith(geometry: value));
    });
  }

  /// Create a copy of WeatherState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WeatherPropertiesCopyWith<$Res> get props {
    return $WeatherPropertiesCopyWith<$Res>(_self.props, (value) {
      return _then(_self.copyWith(props: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _WeatherState extends WeatherState {
  const _WeatherState(
      {@JsonKey(name: 'service') required this.service,
      @JsonKey(name: 'geometry') required this.geometry,
      @JsonKey(name: 'properties') required this.props,
      @JsonKey(name: 'place') this.place,
      @JsonKey(name: 'observedBy') this.observedBy})
      : super._();
  factory _WeatherState.fromJson(Map<String, dynamic> json) =>
      _$WeatherStateFromJson(json);

  @override
  @JsonKey(name: 'service')
  final String service;
  @override
  @JsonKey(name: 'geometry')
  final PointGeometry geometry;
  @override
  @JsonKey(name: 'properties')
  final WeatherProperties props;
  @override
  @JsonKey(name: 'place')
  final String? place;
  @override
  @JsonKey(name: 'observedBy')
  final String? observedBy;

  /// Create a copy of WeatherState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WeatherStateCopyWith<_WeatherState> get copyWith =>
      __$WeatherStateCopyWithImpl<_WeatherState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$WeatherStateToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WeatherState &&
            (identical(other.service, service) || other.service == service) &&
            (identical(other.geometry, geometry) ||
                other.geometry == geometry) &&
            (identical(other.props, props) || other.props == props) &&
            (identical(other.place, place) || other.place == place) &&
            (identical(other.observedBy, observedBy) ||
                other.observedBy == observedBy));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, service, geometry, props, place, observedBy);

  @override
  String toString() {
    return 'WeatherState(service: $service, geometry: $geometry, props: $props, place: $place, observedBy: $observedBy)';
  }
}

/// @nodoc
abstract mixin class _$WeatherStateCopyWith<$Res>
    implements $WeatherStateCopyWith<$Res> {
  factory _$WeatherStateCopyWith(
          _WeatherState value, $Res Function(_WeatherState) _then) =
      __$WeatherStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'service') String service,
      @JsonKey(name: 'geometry') PointGeometry geometry,
      @JsonKey(name: 'properties') WeatherProperties props,
      @JsonKey(name: 'place') String? place,
      @JsonKey(name: 'observedBy') String? observedBy});

  @override
  $PointGeometryCopyWith<$Res> get geometry;
  @override
  $WeatherPropertiesCopyWith<$Res> get props;
}

/// @nodoc
class __$WeatherStateCopyWithImpl<$Res>
    implements _$WeatherStateCopyWith<$Res> {
  __$WeatherStateCopyWithImpl(this._self, this._then);

  final _WeatherState _self;
  final $Res Function(_WeatherState) _then;

  /// Create a copy of WeatherState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? service = null,
    Object? geometry = null,
    Object? props = null,
    Object? place = freezed,
    Object? observedBy = freezed,
  }) {
    return _then(_WeatherState(
      service: null == service
          ? _self.service
          : service // ignore: cast_nullable_to_non_nullable
              as String,
      geometry: null == geometry
          ? _self.geometry
          : geometry // ignore: cast_nullable_to_non_nullable
              as PointGeometry,
      props: null == props
          ? _self.props
          : props // ignore: cast_nullable_to_non_nullable
              as WeatherProperties,
      place: freezed == place
          ? _self.place
          : place // ignore: cast_nullable_to_non_nullable
              as String?,
      observedBy: freezed == observedBy
          ? _self.observedBy
          : observedBy // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of WeatherState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PointGeometryCopyWith<$Res> get geometry {
    return $PointGeometryCopyWith<$Res>(_self.geometry, (value) {
      return _then(_self.copyWith(geometry: value));
    });
  }

  /// Create a copy of WeatherState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WeatherPropertiesCopyWith<$Res> get props {
    return $WeatherPropertiesCopyWith<$Res>(_self.props, (value) {
      return _then(_self.copyWith(props: value));
    });
  }
}

/// @nodoc
mixin _$WeatherTimeStep {
  @JsonKey(name: 'time')
  DateTime get time;
  @JsonKey(name: 'data')
  WeatherData get data;

  /// Create a copy of WeatherTimeStep
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WeatherTimeStepCopyWith<WeatherTimeStep> get copyWith =>
      _$WeatherTimeStepCopyWithImpl<WeatherTimeStep>(
          this as WeatherTimeStep, _$identity);

  /// Serializes this WeatherTimeStep to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WeatherTimeStep &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, time, data);

  @override
  String toString() {
    return 'WeatherTimeStep(time: $time, data: $data)';
  }
}

/// @nodoc
abstract mixin class $WeatherTimeStepCopyWith<$Res> {
  factory $WeatherTimeStepCopyWith(
          WeatherTimeStep value, $Res Function(WeatherTimeStep) _then) =
      _$WeatherTimeStepCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'time') DateTime time,
      @JsonKey(name: 'data') WeatherData data});

  $WeatherDataCopyWith<$Res> get data;
}

/// @nodoc
class _$WeatherTimeStepCopyWithImpl<$Res>
    implements $WeatherTimeStepCopyWith<$Res> {
  _$WeatherTimeStepCopyWithImpl(this._self, this._then);

  final WeatherTimeStep _self;
  final $Res Function(WeatherTimeStep) _then;

  /// Create a copy of WeatherTimeStep
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? data = null,
  }) {
    return _then(_self.copyWith(
      time: null == time
          ? _self.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
      data: null == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as WeatherData,
    ));
  }

  /// Create a copy of WeatherTimeStep
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WeatherDataCopyWith<$Res> get data {
    return $WeatherDataCopyWith<$Res>(_self.data, (value) {
      return _then(_self.copyWith(data: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _WeatherTimeStep extends WeatherTimeStep {
  const _WeatherTimeStep(
      {@JsonKey(name: 'time') required this.time,
      @JsonKey(name: 'data') required this.data})
      : super._();
  factory _WeatherTimeStep.fromJson(Map<String, dynamic> json) =>
      _$WeatherTimeStepFromJson(json);

  @override
  @JsonKey(name: 'time')
  final DateTime time;
  @override
  @JsonKey(name: 'data')
  final WeatherData data;

  /// Create a copy of WeatherTimeStep
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WeatherTimeStepCopyWith<_WeatherTimeStep> get copyWith =>
      __$WeatherTimeStepCopyWithImpl<_WeatherTimeStep>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$WeatherTimeStepToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WeatherTimeStep &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, time, data);

  @override
  String toString() {
    return 'WeatherTimeStep(time: $time, data: $data)';
  }
}

/// @nodoc
abstract mixin class _$WeatherTimeStepCopyWith<$Res>
    implements $WeatherTimeStepCopyWith<$Res> {
  factory _$WeatherTimeStepCopyWith(
          _WeatherTimeStep value, $Res Function(_WeatherTimeStep) _then) =
      __$WeatherTimeStepCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'time') DateTime time,
      @JsonKey(name: 'data') WeatherData data});

  @override
  $WeatherDataCopyWith<$Res> get data;
}

/// @nodoc
class __$WeatherTimeStepCopyWithImpl<$Res>
    implements _$WeatherTimeStepCopyWith<$Res> {
  __$WeatherTimeStepCopyWithImpl(this._self, this._then);

  final _WeatherTimeStep _self;
  final $Res Function(_WeatherTimeStep) _then;

  /// Create a copy of WeatherTimeStep
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? time = null,
    Object? data = null,
  }) {
    return _then(_WeatherTimeStep(
      time: null == time
          ? _self.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
      data: null == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as WeatherData,
    ));
  }

  /// Create a copy of WeatherTimeStep
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WeatherDataCopyWith<$Res> get data {
    return $WeatherDataCopyWith<$Res>(_self.data, (value) {
      return _then(_self.copyWith(data: value));
    });
  }
}

/// @nodoc
mixin _$WeatherData {
  @JsonKey(name: 'instant')
  WeatherInstant get instant;
  @JsonKey(name: 'next_1_hours')
  WeatherForecast? get next1h;
  @JsonKey(name: 'next_6_hours')
  WeatherForecast? get next6h;
  @JsonKey(name: 'next_12_hours')
  WeatherForecast? get next12h;

  /// Create a copy of WeatherData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WeatherDataCopyWith<WeatherData> get copyWith =>
      _$WeatherDataCopyWithImpl<WeatherData>(this as WeatherData, _$identity);

  /// Serializes this WeatherData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WeatherData &&
            (identical(other.instant, instant) || other.instant == instant) &&
            (identical(other.next1h, next1h) || other.next1h == next1h) &&
            (identical(other.next6h, next6h) || other.next6h == next6h) &&
            (identical(other.next12h, next12h) || other.next12h == next12h));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, instant, next1h, next6h, next12h);

  @override
  String toString() {
    return 'WeatherData(instant: $instant, next1h: $next1h, next6h: $next6h, next12h: $next12h)';
  }
}

/// @nodoc
abstract mixin class $WeatherDataCopyWith<$Res> {
  factory $WeatherDataCopyWith(
          WeatherData value, $Res Function(WeatherData) _then) =
      _$WeatherDataCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'instant') WeatherInstant instant,
      @JsonKey(name: 'next_1_hours') WeatherForecast? next1h,
      @JsonKey(name: 'next_6_hours') WeatherForecast? next6h,
      @JsonKey(name: 'next_12_hours') WeatherForecast? next12h});

  $WeatherInstantCopyWith<$Res> get instant;
  $WeatherForecastCopyWith<$Res>? get next1h;
  $WeatherForecastCopyWith<$Res>? get next6h;
  $WeatherForecastCopyWith<$Res>? get next12h;
}

/// @nodoc
class _$WeatherDataCopyWithImpl<$Res> implements $WeatherDataCopyWith<$Res> {
  _$WeatherDataCopyWithImpl(this._self, this._then);

  final WeatherData _self;
  final $Res Function(WeatherData) _then;

  /// Create a copy of WeatherData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? instant = null,
    Object? next1h = freezed,
    Object? next6h = freezed,
    Object? next12h = freezed,
  }) {
    return _then(_self.copyWith(
      instant: null == instant
          ? _self.instant
          : instant // ignore: cast_nullable_to_non_nullable
              as WeatherInstant,
      next1h: freezed == next1h
          ? _self.next1h
          : next1h // ignore: cast_nullable_to_non_nullable
              as WeatherForecast?,
      next6h: freezed == next6h
          ? _self.next6h
          : next6h // ignore: cast_nullable_to_non_nullable
              as WeatherForecast?,
      next12h: freezed == next12h
          ? _self.next12h
          : next12h // ignore: cast_nullable_to_non_nullable
              as WeatherForecast?,
    ));
  }

  /// Create a copy of WeatherData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WeatherInstantCopyWith<$Res> get instant {
    return $WeatherInstantCopyWith<$Res>(_self.instant, (value) {
      return _then(_self.copyWith(instant: value));
    });
  }

  /// Create a copy of WeatherData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WeatherForecastCopyWith<$Res>? get next1h {
    if (_self.next1h == null) {
      return null;
    }

    return $WeatherForecastCopyWith<$Res>(_self.next1h!, (value) {
      return _then(_self.copyWith(next1h: value));
    });
  }

  /// Create a copy of WeatherData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WeatherForecastCopyWith<$Res>? get next6h {
    if (_self.next6h == null) {
      return null;
    }

    return $WeatherForecastCopyWith<$Res>(_self.next6h!, (value) {
      return _then(_self.copyWith(next6h: value));
    });
  }

  /// Create a copy of WeatherData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WeatherForecastCopyWith<$Res>? get next12h {
    if (_self.next12h == null) {
      return null;
    }

    return $WeatherForecastCopyWith<$Res>(_self.next12h!, (value) {
      return _then(_self.copyWith(next12h: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _WeatherData extends WeatherData {
  const _WeatherData(
      {@JsonKey(name: 'instant') required this.instant,
      @JsonKey(name: 'next_1_hours') this.next1h,
      @JsonKey(name: 'next_6_hours') this.next6h,
      @JsonKey(name: 'next_12_hours') this.next12h})
      : super._();
  factory _WeatherData.fromJson(Map<String, dynamic> json) =>
      _$WeatherDataFromJson(json);

  @override
  @JsonKey(name: 'instant')
  final WeatherInstant instant;
  @override
  @JsonKey(name: 'next_1_hours')
  final WeatherForecast? next1h;
  @override
  @JsonKey(name: 'next_6_hours')
  final WeatherForecast? next6h;
  @override
  @JsonKey(name: 'next_12_hours')
  final WeatherForecast? next12h;

  /// Create a copy of WeatherData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WeatherDataCopyWith<_WeatherData> get copyWith =>
      __$WeatherDataCopyWithImpl<_WeatherData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$WeatherDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WeatherData &&
            (identical(other.instant, instant) || other.instant == instant) &&
            (identical(other.next1h, next1h) || other.next1h == next1h) &&
            (identical(other.next6h, next6h) || other.next6h == next6h) &&
            (identical(other.next12h, next12h) || other.next12h == next12h));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, instant, next1h, next6h, next12h);

  @override
  String toString() {
    return 'WeatherData(instant: $instant, next1h: $next1h, next6h: $next6h, next12h: $next12h)';
  }
}

/// @nodoc
abstract mixin class _$WeatherDataCopyWith<$Res>
    implements $WeatherDataCopyWith<$Res> {
  factory _$WeatherDataCopyWith(
          _WeatherData value, $Res Function(_WeatherData) _then) =
      __$WeatherDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'instant') WeatherInstant instant,
      @JsonKey(name: 'next_1_hours') WeatherForecast? next1h,
      @JsonKey(name: 'next_6_hours') WeatherForecast? next6h,
      @JsonKey(name: 'next_12_hours') WeatherForecast? next12h});

  @override
  $WeatherInstantCopyWith<$Res> get instant;
  @override
  $WeatherForecastCopyWith<$Res>? get next1h;
  @override
  $WeatherForecastCopyWith<$Res>? get next6h;
  @override
  $WeatherForecastCopyWith<$Res>? get next12h;
}

/// @nodoc
class __$WeatherDataCopyWithImpl<$Res> implements _$WeatherDataCopyWith<$Res> {
  __$WeatherDataCopyWithImpl(this._self, this._then);

  final _WeatherData _self;
  final $Res Function(_WeatherData) _then;

  /// Create a copy of WeatherData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? instant = null,
    Object? next1h = freezed,
    Object? next6h = freezed,
    Object? next12h = freezed,
  }) {
    return _then(_WeatherData(
      instant: null == instant
          ? _self.instant
          : instant // ignore: cast_nullable_to_non_nullable
              as WeatherInstant,
      next1h: freezed == next1h
          ? _self.next1h
          : next1h // ignore: cast_nullable_to_non_nullable
              as WeatherForecast?,
      next6h: freezed == next6h
          ? _self.next6h
          : next6h // ignore: cast_nullable_to_non_nullable
              as WeatherForecast?,
      next12h: freezed == next12h
          ? _self.next12h
          : next12h // ignore: cast_nullable_to_non_nullable
              as WeatherForecast?,
    ));
  }

  /// Create a copy of WeatherData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WeatherInstantCopyWith<$Res> get instant {
    return $WeatherInstantCopyWith<$Res>(_self.instant, (value) {
      return _then(_self.copyWith(instant: value));
    });
  }

  /// Create a copy of WeatherData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WeatherForecastCopyWith<$Res>? get next1h {
    if (_self.next1h == null) {
      return null;
    }

    return $WeatherForecastCopyWith<$Res>(_self.next1h!, (value) {
      return _then(_self.copyWith(next1h: value));
    });
  }

  /// Create a copy of WeatherData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WeatherForecastCopyWith<$Res>? get next6h {
    if (_self.next6h == null) {
      return null;
    }

    return $WeatherForecastCopyWith<$Res>(_self.next6h!, (value) {
      return _then(_self.copyWith(next6h: value));
    });
  }

  /// Create a copy of WeatherData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WeatherForecastCopyWith<$Res>? get next12h {
    if (_self.next12h == null) {
      return null;
    }

    return $WeatherForecastCopyWith<$Res>(_self.next12h!, (value) {
      return _then(_self.copyWith(next12h: value));
    });
  }
}

/// @nodoc
mixin _$WeatherInstant {
  @JsonKey(name: 'details')
  WeatherInstantDetails get details;

  /// Create a copy of WeatherInstant
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WeatherInstantCopyWith<WeatherInstant> get copyWith =>
      _$WeatherInstantCopyWithImpl<WeatherInstant>(
          this as WeatherInstant, _$identity);

  /// Serializes this WeatherInstant to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WeatherInstant &&
            (identical(other.details, details) || other.details == details));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, details);

  @override
  String toString() {
    return 'WeatherInstant(details: $details)';
  }
}

/// @nodoc
abstract mixin class $WeatherInstantCopyWith<$Res> {
  factory $WeatherInstantCopyWith(
          WeatherInstant value, $Res Function(WeatherInstant) _then) =
      _$WeatherInstantCopyWithImpl;
  @useResult
  $Res call({@JsonKey(name: 'details') WeatherInstantDetails details});

  $WeatherInstantDetailsCopyWith<$Res> get details;
}

/// @nodoc
class _$WeatherInstantCopyWithImpl<$Res>
    implements $WeatherInstantCopyWith<$Res> {
  _$WeatherInstantCopyWithImpl(this._self, this._then);

  final WeatherInstant _self;
  final $Res Function(WeatherInstant) _then;

  /// Create a copy of WeatherInstant
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? details = null,
  }) {
    return _then(_self.copyWith(
      details: null == details
          ? _self.details
          : details // ignore: cast_nullable_to_non_nullable
              as WeatherInstantDetails,
    ));
  }

  /// Create a copy of WeatherInstant
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WeatherInstantDetailsCopyWith<$Res> get details {
    return $WeatherInstantDetailsCopyWith<$Res>(_self.details, (value) {
      return _then(_self.copyWith(details: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _WeatherInstant extends WeatherInstant {
  const _WeatherInstant({@JsonKey(name: 'details') required this.details})
      : super._();
  factory _WeatherInstant.fromJson(Map<String, dynamic> json) =>
      _$WeatherInstantFromJson(json);

  @override
  @JsonKey(name: 'details')
  final WeatherInstantDetails details;

  /// Create a copy of WeatherInstant
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WeatherInstantCopyWith<_WeatherInstant> get copyWith =>
      __$WeatherInstantCopyWithImpl<_WeatherInstant>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$WeatherInstantToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WeatherInstant &&
            (identical(other.details, details) || other.details == details));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, details);

  @override
  String toString() {
    return 'WeatherInstant(details: $details)';
  }
}

/// @nodoc
abstract mixin class _$WeatherInstantCopyWith<$Res>
    implements $WeatherInstantCopyWith<$Res> {
  factory _$WeatherInstantCopyWith(
          _WeatherInstant value, $Res Function(_WeatherInstant) _then) =
      __$WeatherInstantCopyWithImpl;
  @override
  @useResult
  $Res call({@JsonKey(name: 'details') WeatherInstantDetails details});

  @override
  $WeatherInstantDetailsCopyWith<$Res> get details;
}

/// @nodoc
class __$WeatherInstantCopyWithImpl<$Res>
    implements _$WeatherInstantCopyWith<$Res> {
  __$WeatherInstantCopyWithImpl(this._self, this._then);

  final _WeatherInstant _self;
  final $Res Function(_WeatherInstant) _then;

  /// Create a copy of WeatherInstant
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? details = null,
  }) {
    return _then(_WeatherInstant(
      details: null == details
          ? _self.details
          : details // ignore: cast_nullable_to_non_nullable
              as WeatherInstantDetails,
    ));
  }

  /// Create a copy of WeatherInstant
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WeatherInstantDetailsCopyWith<$Res> get details {
    return $WeatherInstantDetailsCopyWith<$Res>(_self.details, (value) {
      return _then(_self.copyWith(details: value));
    });
  }
}

/// @nodoc
mixin _$WeatherInstantDetails {
  /// Air pressure at sea level
  @JsonKey(name: 'air_pressure_at_sea_level')
  double? get airPressureAtSeaLevel;

  /// Air temperature
  @JsonKey(name: 'air_temperature')
  double? get airTemperature;

  /// Amount of sky covered by clouds.
  @JsonKey(name: 'cloud_area_fraction')
  double? get cloudAreaFraction;

  /// The direction which the wind moves towards
  @JsonKey(name: 'wind_from_direction')
  double? get windFromDirection;

  /// Speed of wind
  @JsonKey(name: 'wind_speed')
  double? get windSpeed;

  /// Speed of wind gust
  @JsonKey(name: 'wind_speed_of_gust')
  double? get windSpeedOfGust;

  /// Light luminance (in lux)
  @JsonKey(name: 'light_luminance')
  int? get lightLuminance;

  /// Air humidity (in percent, %)
  @JsonKey(name: 'relative_humidity')
  double? get relativeHumidity;

  /// Ultraviolet radiation (in UV index, UVI)
  @JsonKey(name: 'ultraviolet_radiation')
  int? get ultravioletRadiation;

  /// Amount of precipitation in mm water equivalents
  @JsonKey(name: 'precipitation_amount')
  double? get precipitationAmount;

  /// Create a copy of WeatherInstantDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WeatherInstantDetailsCopyWith<WeatherInstantDetails> get copyWith =>
      _$WeatherInstantDetailsCopyWithImpl<WeatherInstantDetails>(
          this as WeatherInstantDetails, _$identity);

  /// Serializes this WeatherInstantDetails to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WeatherInstantDetails &&
            (identical(other.airPressureAtSeaLevel, airPressureAtSeaLevel) ||
                other.airPressureAtSeaLevel == airPressureAtSeaLevel) &&
            (identical(other.airTemperature, airTemperature) ||
                other.airTemperature == airTemperature) &&
            (identical(other.cloudAreaFraction, cloudAreaFraction) ||
                other.cloudAreaFraction == cloudAreaFraction) &&
            (identical(other.windFromDirection, windFromDirection) ||
                other.windFromDirection == windFromDirection) &&
            (identical(other.windSpeed, windSpeed) ||
                other.windSpeed == windSpeed) &&
            (identical(other.windSpeedOfGust, windSpeedOfGust) ||
                other.windSpeedOfGust == windSpeedOfGust) &&
            (identical(other.lightLuminance, lightLuminance) ||
                other.lightLuminance == lightLuminance) &&
            (identical(other.relativeHumidity, relativeHumidity) ||
                other.relativeHumidity == relativeHumidity) &&
            (identical(other.ultravioletRadiation, ultravioletRadiation) ||
                other.ultravioletRadiation == ultravioletRadiation) &&
            (identical(other.precipitationAmount, precipitationAmount) ||
                other.precipitationAmount == precipitationAmount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      airPressureAtSeaLevel,
      airTemperature,
      cloudAreaFraction,
      windFromDirection,
      windSpeed,
      windSpeedOfGust,
      lightLuminance,
      relativeHumidity,
      ultravioletRadiation,
      precipitationAmount);

  @override
  String toString() {
    return 'WeatherInstantDetails(airPressureAtSeaLevel: $airPressureAtSeaLevel, airTemperature: $airTemperature, cloudAreaFraction: $cloudAreaFraction, windFromDirection: $windFromDirection, windSpeed: $windSpeed, windSpeedOfGust: $windSpeedOfGust, lightLuminance: $lightLuminance, relativeHumidity: $relativeHumidity, ultravioletRadiation: $ultravioletRadiation, precipitationAmount: $precipitationAmount)';
  }
}

/// @nodoc
abstract mixin class $WeatherInstantDetailsCopyWith<$Res> {
  factory $WeatherInstantDetailsCopyWith(WeatherInstantDetails value,
          $Res Function(WeatherInstantDetails) _then) =
      _$WeatherInstantDetailsCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'air_pressure_at_sea_level')
      double? airPressureAtSeaLevel,
      @JsonKey(name: 'air_temperature') double? airTemperature,
      @JsonKey(name: 'cloud_area_fraction') double? cloudAreaFraction,
      @JsonKey(name: 'wind_from_direction') double? windFromDirection,
      @JsonKey(name: 'wind_speed') double? windSpeed,
      @JsonKey(name: 'wind_speed_of_gust') double? windSpeedOfGust,
      @JsonKey(name: 'light_luminance') int? lightLuminance,
      @JsonKey(name: 'relative_humidity') double? relativeHumidity,
      @JsonKey(name: 'ultraviolet_radiation') int? ultravioletRadiation,
      @JsonKey(name: 'precipitation_amount') double? precipitationAmount});
}

/// @nodoc
class _$WeatherInstantDetailsCopyWithImpl<$Res>
    implements $WeatherInstantDetailsCopyWith<$Res> {
  _$WeatherInstantDetailsCopyWithImpl(this._self, this._then);

  final WeatherInstantDetails _self;
  final $Res Function(WeatherInstantDetails) _then;

  /// Create a copy of WeatherInstantDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? airPressureAtSeaLevel = freezed,
    Object? airTemperature = freezed,
    Object? cloudAreaFraction = freezed,
    Object? windFromDirection = freezed,
    Object? windSpeed = freezed,
    Object? windSpeedOfGust = freezed,
    Object? lightLuminance = freezed,
    Object? relativeHumidity = freezed,
    Object? ultravioletRadiation = freezed,
    Object? precipitationAmount = freezed,
  }) {
    return _then(_self.copyWith(
      airPressureAtSeaLevel: freezed == airPressureAtSeaLevel
          ? _self.airPressureAtSeaLevel
          : airPressureAtSeaLevel // ignore: cast_nullable_to_non_nullable
              as double?,
      airTemperature: freezed == airTemperature
          ? _self.airTemperature
          : airTemperature // ignore: cast_nullable_to_non_nullable
              as double?,
      cloudAreaFraction: freezed == cloudAreaFraction
          ? _self.cloudAreaFraction
          : cloudAreaFraction // ignore: cast_nullable_to_non_nullable
              as double?,
      windFromDirection: freezed == windFromDirection
          ? _self.windFromDirection
          : windFromDirection // ignore: cast_nullable_to_non_nullable
              as double?,
      windSpeed: freezed == windSpeed
          ? _self.windSpeed
          : windSpeed // ignore: cast_nullable_to_non_nullable
              as double?,
      windSpeedOfGust: freezed == windSpeedOfGust
          ? _self.windSpeedOfGust
          : windSpeedOfGust // ignore: cast_nullable_to_non_nullable
              as double?,
      lightLuminance: freezed == lightLuminance
          ? _self.lightLuminance
          : lightLuminance // ignore: cast_nullable_to_non_nullable
              as int?,
      relativeHumidity: freezed == relativeHumidity
          ? _self.relativeHumidity
          : relativeHumidity // ignore: cast_nullable_to_non_nullable
              as double?,
      ultravioletRadiation: freezed == ultravioletRadiation
          ? _self.ultravioletRadiation
          : ultravioletRadiation // ignore: cast_nullable_to_non_nullable
              as int?,
      precipitationAmount: freezed == precipitationAmount
          ? _self.precipitationAmount
          : precipitationAmount // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _WeatherInstantDetails extends WeatherInstantDetails {
  const _WeatherInstantDetails(
      {@JsonKey(name: 'air_pressure_at_sea_level') this.airPressureAtSeaLevel,
      @JsonKey(name: 'air_temperature') this.airTemperature,
      @JsonKey(name: 'cloud_area_fraction') this.cloudAreaFraction,
      @JsonKey(name: 'wind_from_direction') this.windFromDirection,
      @JsonKey(name: 'wind_speed') this.windSpeed,
      @JsonKey(name: 'wind_speed_of_gust') this.windSpeedOfGust,
      @JsonKey(name: 'light_luminance') this.lightLuminance,
      @JsonKey(name: 'relative_humidity') this.relativeHumidity,
      @JsonKey(name: 'ultraviolet_radiation') this.ultravioletRadiation,
      @JsonKey(name: 'precipitation_amount') this.precipitationAmount})
      : super._();
  factory _WeatherInstantDetails.fromJson(Map<String, dynamic> json) =>
      _$WeatherInstantDetailsFromJson(json);

  /// Air pressure at sea level
  @override
  @JsonKey(name: 'air_pressure_at_sea_level')
  final double? airPressureAtSeaLevel;

  /// Air temperature
  @override
  @JsonKey(name: 'air_temperature')
  final double? airTemperature;

  /// Amount of sky covered by clouds.
  @override
  @JsonKey(name: 'cloud_area_fraction')
  final double? cloudAreaFraction;

  /// The direction which the wind moves towards
  @override
  @JsonKey(name: 'wind_from_direction')
  final double? windFromDirection;

  /// Speed of wind
  @override
  @JsonKey(name: 'wind_speed')
  final double? windSpeed;

  /// Speed of wind gust
  @override
  @JsonKey(name: 'wind_speed_of_gust')
  final double? windSpeedOfGust;

  /// Light luminance (in lux)
  @override
  @JsonKey(name: 'light_luminance')
  final int? lightLuminance;

  /// Air humidity (in percent, %)
  @override
  @JsonKey(name: 'relative_humidity')
  final double? relativeHumidity;

  /// Ultraviolet radiation (in UV index, UVI)
  @override
  @JsonKey(name: 'ultraviolet_radiation')
  final int? ultravioletRadiation;

  /// Amount of precipitation in mm water equivalents
  @override
  @JsonKey(name: 'precipitation_amount')
  final double? precipitationAmount;

  /// Create a copy of WeatherInstantDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WeatherInstantDetailsCopyWith<_WeatherInstantDetails> get copyWith =>
      __$WeatherInstantDetailsCopyWithImpl<_WeatherInstantDetails>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$WeatherInstantDetailsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WeatherInstantDetails &&
            (identical(other.airPressureAtSeaLevel, airPressureAtSeaLevel) ||
                other.airPressureAtSeaLevel == airPressureAtSeaLevel) &&
            (identical(other.airTemperature, airTemperature) ||
                other.airTemperature == airTemperature) &&
            (identical(other.cloudAreaFraction, cloudAreaFraction) ||
                other.cloudAreaFraction == cloudAreaFraction) &&
            (identical(other.windFromDirection, windFromDirection) ||
                other.windFromDirection == windFromDirection) &&
            (identical(other.windSpeed, windSpeed) ||
                other.windSpeed == windSpeed) &&
            (identical(other.windSpeedOfGust, windSpeedOfGust) ||
                other.windSpeedOfGust == windSpeedOfGust) &&
            (identical(other.lightLuminance, lightLuminance) ||
                other.lightLuminance == lightLuminance) &&
            (identical(other.relativeHumidity, relativeHumidity) ||
                other.relativeHumidity == relativeHumidity) &&
            (identical(other.ultravioletRadiation, ultravioletRadiation) ||
                other.ultravioletRadiation == ultravioletRadiation) &&
            (identical(other.precipitationAmount, precipitationAmount) ||
                other.precipitationAmount == precipitationAmount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      airPressureAtSeaLevel,
      airTemperature,
      cloudAreaFraction,
      windFromDirection,
      windSpeed,
      windSpeedOfGust,
      lightLuminance,
      relativeHumidity,
      ultravioletRadiation,
      precipitationAmount);

  @override
  String toString() {
    return 'WeatherInstantDetails(airPressureAtSeaLevel: $airPressureAtSeaLevel, airTemperature: $airTemperature, cloudAreaFraction: $cloudAreaFraction, windFromDirection: $windFromDirection, windSpeed: $windSpeed, windSpeedOfGust: $windSpeedOfGust, lightLuminance: $lightLuminance, relativeHumidity: $relativeHumidity, ultravioletRadiation: $ultravioletRadiation, precipitationAmount: $precipitationAmount)';
  }
}

/// @nodoc
abstract mixin class _$WeatherInstantDetailsCopyWith<$Res>
    implements $WeatherInstantDetailsCopyWith<$Res> {
  factory _$WeatherInstantDetailsCopyWith(_WeatherInstantDetails value,
          $Res Function(_WeatherInstantDetails) _then) =
      __$WeatherInstantDetailsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'air_pressure_at_sea_level')
      double? airPressureAtSeaLevel,
      @JsonKey(name: 'air_temperature') double? airTemperature,
      @JsonKey(name: 'cloud_area_fraction') double? cloudAreaFraction,
      @JsonKey(name: 'wind_from_direction') double? windFromDirection,
      @JsonKey(name: 'wind_speed') double? windSpeed,
      @JsonKey(name: 'wind_speed_of_gust') double? windSpeedOfGust,
      @JsonKey(name: 'light_luminance') int? lightLuminance,
      @JsonKey(name: 'relative_humidity') double? relativeHumidity,
      @JsonKey(name: 'ultraviolet_radiation') int? ultravioletRadiation,
      @JsonKey(name: 'precipitation_amount') double? precipitationAmount});
}

/// @nodoc
class __$WeatherInstantDetailsCopyWithImpl<$Res>
    implements _$WeatherInstantDetailsCopyWith<$Res> {
  __$WeatherInstantDetailsCopyWithImpl(this._self, this._then);

  final _WeatherInstantDetails _self;
  final $Res Function(_WeatherInstantDetails) _then;

  /// Create a copy of WeatherInstantDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? airPressureAtSeaLevel = freezed,
    Object? airTemperature = freezed,
    Object? cloudAreaFraction = freezed,
    Object? windFromDirection = freezed,
    Object? windSpeed = freezed,
    Object? windSpeedOfGust = freezed,
    Object? lightLuminance = freezed,
    Object? relativeHumidity = freezed,
    Object? ultravioletRadiation = freezed,
    Object? precipitationAmount = freezed,
  }) {
    return _then(_WeatherInstantDetails(
      airPressureAtSeaLevel: freezed == airPressureAtSeaLevel
          ? _self.airPressureAtSeaLevel
          : airPressureAtSeaLevel // ignore: cast_nullable_to_non_nullable
              as double?,
      airTemperature: freezed == airTemperature
          ? _self.airTemperature
          : airTemperature // ignore: cast_nullable_to_non_nullable
              as double?,
      cloudAreaFraction: freezed == cloudAreaFraction
          ? _self.cloudAreaFraction
          : cloudAreaFraction // ignore: cast_nullable_to_non_nullable
              as double?,
      windFromDirection: freezed == windFromDirection
          ? _self.windFromDirection
          : windFromDirection // ignore: cast_nullable_to_non_nullable
              as double?,
      windSpeed: freezed == windSpeed
          ? _self.windSpeed
          : windSpeed // ignore: cast_nullable_to_non_nullable
              as double?,
      windSpeedOfGust: freezed == windSpeedOfGust
          ? _self.windSpeedOfGust
          : windSpeedOfGust // ignore: cast_nullable_to_non_nullable
              as double?,
      lightLuminance: freezed == lightLuminance
          ? _self.lightLuminance
          : lightLuminance // ignore: cast_nullable_to_non_nullable
              as int?,
      relativeHumidity: freezed == relativeHumidity
          ? _self.relativeHumidity
          : relativeHumidity // ignore: cast_nullable_to_non_nullable
              as double?,
      ultravioletRadiation: freezed == ultravioletRadiation
          ? _self.ultravioletRadiation
          : ultravioletRadiation // ignore: cast_nullable_to_non_nullable
              as int?,
      precipitationAmount: freezed == precipitationAmount
          ? _self.precipitationAmount
          : precipitationAmount // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
mixin _$WeatherForecast {
  @JsonKey(name: 'summary')
  WeatherSummary get summary;
  @JsonKey(name: 'details')
  WeatherForecastDetails get details;

  /// Create a copy of WeatherForecast
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WeatherForecastCopyWith<WeatherForecast> get copyWith =>
      _$WeatherForecastCopyWithImpl<WeatherForecast>(
          this as WeatherForecast, _$identity);

  /// Serializes this WeatherForecast to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WeatherForecast &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.details, details) || other.details == details));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, summary, details);

  @override
  String toString() {
    return 'WeatherForecast(summary: $summary, details: $details)';
  }
}

/// @nodoc
abstract mixin class $WeatherForecastCopyWith<$Res> {
  factory $WeatherForecastCopyWith(
          WeatherForecast value, $Res Function(WeatherForecast) _then) =
      _$WeatherForecastCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'summary') WeatherSummary summary,
      @JsonKey(name: 'details') WeatherForecastDetails details});

  $WeatherSummaryCopyWith<$Res> get summary;
  $WeatherForecastDetailsCopyWith<$Res> get details;
}

/// @nodoc
class _$WeatherForecastCopyWithImpl<$Res>
    implements $WeatherForecastCopyWith<$Res> {
  _$WeatherForecastCopyWithImpl(this._self, this._then);

  final WeatherForecast _self;
  final $Res Function(WeatherForecast) _then;

  /// Create a copy of WeatherForecast
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? summary = null,
    Object? details = null,
  }) {
    return _then(_self.copyWith(
      summary: null == summary
          ? _self.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as WeatherSummary,
      details: null == details
          ? _self.details
          : details // ignore: cast_nullable_to_non_nullable
              as WeatherForecastDetails,
    ));
  }

  /// Create a copy of WeatherForecast
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WeatherSummaryCopyWith<$Res> get summary {
    return $WeatherSummaryCopyWith<$Res>(_self.summary, (value) {
      return _then(_self.copyWith(summary: value));
    });
  }

  /// Create a copy of WeatherForecast
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WeatherForecastDetailsCopyWith<$Res> get details {
    return $WeatherForecastDetailsCopyWith<$Res>(_self.details, (value) {
      return _then(_self.copyWith(details: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _WeatherForecast extends WeatherForecast {
  const _WeatherForecast(
      {@JsonKey(name: 'summary') required this.summary,
      @JsonKey(name: 'details') required this.details})
      : super._();
  factory _WeatherForecast.fromJson(Map<String, dynamic> json) =>
      _$WeatherForecastFromJson(json);

  @override
  @JsonKey(name: 'summary')
  final WeatherSummary summary;
  @override
  @JsonKey(name: 'details')
  final WeatherForecastDetails details;

  /// Create a copy of WeatherForecast
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WeatherForecastCopyWith<_WeatherForecast> get copyWith =>
      __$WeatherForecastCopyWithImpl<_WeatherForecast>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$WeatherForecastToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WeatherForecast &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.details, details) || other.details == details));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, summary, details);

  @override
  String toString() {
    return 'WeatherForecast(summary: $summary, details: $details)';
  }
}

/// @nodoc
abstract mixin class _$WeatherForecastCopyWith<$Res>
    implements $WeatherForecastCopyWith<$Res> {
  factory _$WeatherForecastCopyWith(
          _WeatherForecast value, $Res Function(_WeatherForecast) _then) =
      __$WeatherForecastCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'summary') WeatherSummary summary,
      @JsonKey(name: 'details') WeatherForecastDetails details});

  @override
  $WeatherSummaryCopyWith<$Res> get summary;
  @override
  $WeatherForecastDetailsCopyWith<$Res> get details;
}

/// @nodoc
class __$WeatherForecastCopyWithImpl<$Res>
    implements _$WeatherForecastCopyWith<$Res> {
  __$WeatherForecastCopyWithImpl(this._self, this._then);

  final _WeatherForecast _self;
  final $Res Function(_WeatherForecast) _then;

  /// Create a copy of WeatherForecast
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? summary = null,
    Object? details = null,
  }) {
    return _then(_WeatherForecast(
      summary: null == summary
          ? _self.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as WeatherSummary,
      details: null == details
          ? _self.details
          : details // ignore: cast_nullable_to_non_nullable
              as WeatherForecastDetails,
    ));
  }

  /// Create a copy of WeatherForecast
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WeatherSummaryCopyWith<$Res> get summary {
    return $WeatherSummaryCopyWith<$Res>(_self.summary, (value) {
      return _then(_self.copyWith(summary: value));
    });
  }

  /// Create a copy of WeatherForecast
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WeatherForecastDetailsCopyWith<$Res> get details {
    return $WeatherForecastDetailsCopyWith<$Res>(_self.details, (value) {
      return _then(_self.copyWith(details: value));
    });
  }
}

/// @nodoc
mixin _$WeatherForecastDetails {
  @JsonKey(name: 'air_temperature_min')
  double? get airTemperatureMin;
  @JsonKey(name: 'air_temperature_max')
  double? get airTemperatureMax;
  @JsonKey(name: 'precipitation_amount')
  double? get precipitationAmount;
  @JsonKey(name: 'precipitation_amount_min')
  double? get precipitationAmountMin;
  @JsonKey(name: 'precipitation_amount_max')
  double? get precipitationAmountMax;
  @JsonKey(name: 'probability_of_precipitation')
  double? get probabilityOfPrecipitation;
  @JsonKey(name: 'probability_of_thunder')
  double? get probabilityOfThunder;

  /// Create a copy of WeatherForecastDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WeatherForecastDetailsCopyWith<WeatherForecastDetails> get copyWith =>
      _$WeatherForecastDetailsCopyWithImpl<WeatherForecastDetails>(
          this as WeatherForecastDetails, _$identity);

  /// Serializes this WeatherForecastDetails to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WeatherForecastDetails &&
            (identical(other.airTemperatureMin, airTemperatureMin) ||
                other.airTemperatureMin == airTemperatureMin) &&
            (identical(other.airTemperatureMax, airTemperatureMax) ||
                other.airTemperatureMax == airTemperatureMax) &&
            (identical(other.precipitationAmount, precipitationAmount) ||
                other.precipitationAmount == precipitationAmount) &&
            (identical(other.precipitationAmountMin, precipitationAmountMin) ||
                other.precipitationAmountMin == precipitationAmountMin) &&
            (identical(other.precipitationAmountMax, precipitationAmountMax) ||
                other.precipitationAmountMax == precipitationAmountMax) &&
            (identical(other.probabilityOfPrecipitation,
                    probabilityOfPrecipitation) ||
                other.probabilityOfPrecipitation ==
                    probabilityOfPrecipitation) &&
            (identical(other.probabilityOfThunder, probabilityOfThunder) ||
                other.probabilityOfThunder == probabilityOfThunder));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      airTemperatureMin,
      airTemperatureMax,
      precipitationAmount,
      precipitationAmountMin,
      precipitationAmountMax,
      probabilityOfPrecipitation,
      probabilityOfThunder);

  @override
  String toString() {
    return 'WeatherForecastDetails(airTemperatureMin: $airTemperatureMin, airTemperatureMax: $airTemperatureMax, precipitationAmount: $precipitationAmount, precipitationAmountMin: $precipitationAmountMin, precipitationAmountMax: $precipitationAmountMax, probabilityOfPrecipitation: $probabilityOfPrecipitation, probabilityOfThunder: $probabilityOfThunder)';
  }
}

/// @nodoc
abstract mixin class $WeatherForecastDetailsCopyWith<$Res> {
  factory $WeatherForecastDetailsCopyWith(WeatherForecastDetails value,
          $Res Function(WeatherForecastDetails) _then) =
      _$WeatherForecastDetailsCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'air_temperature_min') double? airTemperatureMin,
      @JsonKey(name: 'air_temperature_max') double? airTemperatureMax,
      @JsonKey(name: 'precipitation_amount') double? precipitationAmount,
      @JsonKey(name: 'precipitation_amount_min') double? precipitationAmountMin,
      @JsonKey(name: 'precipitation_amount_max') double? precipitationAmountMax,
      @JsonKey(name: 'probability_of_precipitation')
      double? probabilityOfPrecipitation,
      @JsonKey(name: 'probability_of_thunder') double? probabilityOfThunder});
}

/// @nodoc
class _$WeatherForecastDetailsCopyWithImpl<$Res>
    implements $WeatherForecastDetailsCopyWith<$Res> {
  _$WeatherForecastDetailsCopyWithImpl(this._self, this._then);

  final WeatherForecastDetails _self;
  final $Res Function(WeatherForecastDetails) _then;

  /// Create a copy of WeatherForecastDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? airTemperatureMin = freezed,
    Object? airTemperatureMax = freezed,
    Object? precipitationAmount = freezed,
    Object? precipitationAmountMin = freezed,
    Object? precipitationAmountMax = freezed,
    Object? probabilityOfPrecipitation = freezed,
    Object? probabilityOfThunder = freezed,
  }) {
    return _then(_self.copyWith(
      airTemperatureMin: freezed == airTemperatureMin
          ? _self.airTemperatureMin
          : airTemperatureMin // ignore: cast_nullable_to_non_nullable
              as double?,
      airTemperatureMax: freezed == airTemperatureMax
          ? _self.airTemperatureMax
          : airTemperatureMax // ignore: cast_nullable_to_non_nullable
              as double?,
      precipitationAmount: freezed == precipitationAmount
          ? _self.precipitationAmount
          : precipitationAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      precipitationAmountMin: freezed == precipitationAmountMin
          ? _self.precipitationAmountMin
          : precipitationAmountMin // ignore: cast_nullable_to_non_nullable
              as double?,
      precipitationAmountMax: freezed == precipitationAmountMax
          ? _self.precipitationAmountMax
          : precipitationAmountMax // ignore: cast_nullable_to_non_nullable
              as double?,
      probabilityOfPrecipitation: freezed == probabilityOfPrecipitation
          ? _self.probabilityOfPrecipitation
          : probabilityOfPrecipitation // ignore: cast_nullable_to_non_nullable
              as double?,
      probabilityOfThunder: freezed == probabilityOfThunder
          ? _self.probabilityOfThunder
          : probabilityOfThunder // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _WeatherForecastDetails extends WeatherForecastDetails {
  const _WeatherForecastDetails(
      {@JsonKey(name: 'air_temperature_min') this.airTemperatureMin,
      @JsonKey(name: 'air_temperature_max') this.airTemperatureMax,
      @JsonKey(name: 'precipitation_amount') this.precipitationAmount,
      @JsonKey(name: 'precipitation_amount_min') this.precipitationAmountMin,
      @JsonKey(name: 'precipitation_amount_max') this.precipitationAmountMax,
      @JsonKey(name: 'probability_of_precipitation')
      this.probabilityOfPrecipitation,
      @JsonKey(name: 'probability_of_thunder') this.probabilityOfThunder})
      : super._();
  factory _WeatherForecastDetails.fromJson(Map<String, dynamic> json) =>
      _$WeatherForecastDetailsFromJson(json);

  @override
  @JsonKey(name: 'air_temperature_min')
  final double? airTemperatureMin;
  @override
  @JsonKey(name: 'air_temperature_max')
  final double? airTemperatureMax;
  @override
  @JsonKey(name: 'precipitation_amount')
  final double? precipitationAmount;
  @override
  @JsonKey(name: 'precipitation_amount_min')
  final double? precipitationAmountMin;
  @override
  @JsonKey(name: 'precipitation_amount_max')
  final double? precipitationAmountMax;
  @override
  @JsonKey(name: 'probability_of_precipitation')
  final double? probabilityOfPrecipitation;
  @override
  @JsonKey(name: 'probability_of_thunder')
  final double? probabilityOfThunder;

  /// Create a copy of WeatherForecastDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WeatherForecastDetailsCopyWith<_WeatherForecastDetails> get copyWith =>
      __$WeatherForecastDetailsCopyWithImpl<_WeatherForecastDetails>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$WeatherForecastDetailsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WeatherForecastDetails &&
            (identical(other.airTemperatureMin, airTemperatureMin) ||
                other.airTemperatureMin == airTemperatureMin) &&
            (identical(other.airTemperatureMax, airTemperatureMax) ||
                other.airTemperatureMax == airTemperatureMax) &&
            (identical(other.precipitationAmount, precipitationAmount) ||
                other.precipitationAmount == precipitationAmount) &&
            (identical(other.precipitationAmountMin, precipitationAmountMin) ||
                other.precipitationAmountMin == precipitationAmountMin) &&
            (identical(other.precipitationAmountMax, precipitationAmountMax) ||
                other.precipitationAmountMax == precipitationAmountMax) &&
            (identical(other.probabilityOfPrecipitation,
                    probabilityOfPrecipitation) ||
                other.probabilityOfPrecipitation ==
                    probabilityOfPrecipitation) &&
            (identical(other.probabilityOfThunder, probabilityOfThunder) ||
                other.probabilityOfThunder == probabilityOfThunder));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      airTemperatureMin,
      airTemperatureMax,
      precipitationAmount,
      precipitationAmountMin,
      precipitationAmountMax,
      probabilityOfPrecipitation,
      probabilityOfThunder);

  @override
  String toString() {
    return 'WeatherForecastDetails(airTemperatureMin: $airTemperatureMin, airTemperatureMax: $airTemperatureMax, precipitationAmount: $precipitationAmount, precipitationAmountMin: $precipitationAmountMin, precipitationAmountMax: $precipitationAmountMax, probabilityOfPrecipitation: $probabilityOfPrecipitation, probabilityOfThunder: $probabilityOfThunder)';
  }
}

/// @nodoc
abstract mixin class _$WeatherForecastDetailsCopyWith<$Res>
    implements $WeatherForecastDetailsCopyWith<$Res> {
  factory _$WeatherForecastDetailsCopyWith(_WeatherForecastDetails value,
          $Res Function(_WeatherForecastDetails) _then) =
      __$WeatherForecastDetailsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'air_temperature_min') double? airTemperatureMin,
      @JsonKey(name: 'air_temperature_max') double? airTemperatureMax,
      @JsonKey(name: 'precipitation_amount') double? precipitationAmount,
      @JsonKey(name: 'precipitation_amount_min') double? precipitationAmountMin,
      @JsonKey(name: 'precipitation_amount_max') double? precipitationAmountMax,
      @JsonKey(name: 'probability_of_precipitation')
      double? probabilityOfPrecipitation,
      @JsonKey(name: 'probability_of_thunder') double? probabilityOfThunder});
}

/// @nodoc
class __$WeatherForecastDetailsCopyWithImpl<$Res>
    implements _$WeatherForecastDetailsCopyWith<$Res> {
  __$WeatherForecastDetailsCopyWithImpl(this._self, this._then);

  final _WeatherForecastDetails _self;
  final $Res Function(_WeatherForecastDetails) _then;

  /// Create a copy of WeatherForecastDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? airTemperatureMin = freezed,
    Object? airTemperatureMax = freezed,
    Object? precipitationAmount = freezed,
    Object? precipitationAmountMin = freezed,
    Object? precipitationAmountMax = freezed,
    Object? probabilityOfPrecipitation = freezed,
    Object? probabilityOfThunder = freezed,
  }) {
    return _then(_WeatherForecastDetails(
      airTemperatureMin: freezed == airTemperatureMin
          ? _self.airTemperatureMin
          : airTemperatureMin // ignore: cast_nullable_to_non_nullable
              as double?,
      airTemperatureMax: freezed == airTemperatureMax
          ? _self.airTemperatureMax
          : airTemperatureMax // ignore: cast_nullable_to_non_nullable
              as double?,
      precipitationAmount: freezed == precipitationAmount
          ? _self.precipitationAmount
          : precipitationAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      precipitationAmountMin: freezed == precipitationAmountMin
          ? _self.precipitationAmountMin
          : precipitationAmountMin // ignore: cast_nullable_to_non_nullable
              as double?,
      precipitationAmountMax: freezed == precipitationAmountMax
          ? _self.precipitationAmountMax
          : precipitationAmountMax // ignore: cast_nullable_to_non_nullable
              as double?,
      probabilityOfPrecipitation: freezed == probabilityOfPrecipitation
          ? _self.probabilityOfPrecipitation
          : probabilityOfPrecipitation // ignore: cast_nullable_to_non_nullable
              as double?,
      probabilityOfThunder: freezed == probabilityOfThunder
          ? _self.probabilityOfThunder
          : probabilityOfThunder // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
mixin _$WeatherDetails {
  @JsonKey(name: 'symbol_code')
  String get symbolCode;

  /// Create a copy of WeatherDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WeatherDetailsCopyWith<WeatherDetails> get copyWith =>
      _$WeatherDetailsCopyWithImpl<WeatherDetails>(
          this as WeatherDetails, _$identity);

  /// Serializes this WeatherDetails to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WeatherDetails &&
            (identical(other.symbolCode, symbolCode) ||
                other.symbolCode == symbolCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, symbolCode);

  @override
  String toString() {
    return 'WeatherDetails(symbolCode: $symbolCode)';
  }
}

/// @nodoc
abstract mixin class $WeatherDetailsCopyWith<$Res> {
  factory $WeatherDetailsCopyWith(
          WeatherDetails value, $Res Function(WeatherDetails) _then) =
      _$WeatherDetailsCopyWithImpl;
  @useResult
  $Res call({@JsonKey(name: 'symbol_code') String symbolCode});
}

/// @nodoc
class _$WeatherDetailsCopyWithImpl<$Res>
    implements $WeatherDetailsCopyWith<$Res> {
  _$WeatherDetailsCopyWithImpl(this._self, this._then);

  final WeatherDetails _self;
  final $Res Function(WeatherDetails) _then;

  /// Create a copy of WeatherDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? symbolCode = null,
  }) {
    return _then(_self.copyWith(
      symbolCode: null == symbolCode
          ? _self.symbolCode
          : symbolCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _WeatherDetails extends WeatherDetails {
  const _WeatherDetails(
      {@JsonKey(name: 'symbol_code') required this.symbolCode})
      : super._();
  factory _WeatherDetails.fromJson(Map<String, dynamic> json) =>
      _$WeatherDetailsFromJson(json);

  @override
  @JsonKey(name: 'symbol_code')
  final String symbolCode;

  /// Create a copy of WeatherDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WeatherDetailsCopyWith<_WeatherDetails> get copyWith =>
      __$WeatherDetailsCopyWithImpl<_WeatherDetails>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$WeatherDetailsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WeatherDetails &&
            (identical(other.symbolCode, symbolCode) ||
                other.symbolCode == symbolCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, symbolCode);

  @override
  String toString() {
    return 'WeatherDetails(symbolCode: $symbolCode)';
  }
}

/// @nodoc
abstract mixin class _$WeatherDetailsCopyWith<$Res>
    implements $WeatherDetailsCopyWith<$Res> {
  factory _$WeatherDetailsCopyWith(
          _WeatherDetails value, $Res Function(_WeatherDetails) _then) =
      __$WeatherDetailsCopyWithImpl;
  @override
  @useResult
  $Res call({@JsonKey(name: 'symbol_code') String symbolCode});
}

/// @nodoc
class __$WeatherDetailsCopyWithImpl<$Res>
    implements _$WeatherDetailsCopyWith<$Res> {
  __$WeatherDetailsCopyWithImpl(this._self, this._then);

  final _WeatherDetails _self;
  final $Res Function(_WeatherDetails) _then;

  /// Create a copy of WeatherDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? symbolCode = null,
  }) {
    return _then(_WeatherDetails(
      symbolCode: null == symbolCode
          ? _self.symbolCode
          : symbolCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$WeatherSummary {
  @JsonKey(name: 'symbol_code')
  String get symbolCode;

  /// Create a copy of WeatherSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WeatherSummaryCopyWith<WeatherSummary> get copyWith =>
      _$WeatherSummaryCopyWithImpl<WeatherSummary>(
          this as WeatherSummary, _$identity);

  /// Serializes this WeatherSummary to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WeatherSummary &&
            (identical(other.symbolCode, symbolCode) ||
                other.symbolCode == symbolCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, symbolCode);

  @override
  String toString() {
    return 'WeatherSummary(symbolCode: $symbolCode)';
  }
}

/// @nodoc
abstract mixin class $WeatherSummaryCopyWith<$Res> {
  factory $WeatherSummaryCopyWith(
          WeatherSummary value, $Res Function(WeatherSummary) _then) =
      _$WeatherSummaryCopyWithImpl;
  @useResult
  $Res call({@JsonKey(name: 'symbol_code') String symbolCode});
}

/// @nodoc
class _$WeatherSummaryCopyWithImpl<$Res>
    implements $WeatherSummaryCopyWith<$Res> {
  _$WeatherSummaryCopyWithImpl(this._self, this._then);

  final WeatherSummary _self;
  final $Res Function(WeatherSummary) _then;

  /// Create a copy of WeatherSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? symbolCode = null,
  }) {
    return _then(_self.copyWith(
      symbolCode: null == symbolCode
          ? _self.symbolCode
          : symbolCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _WeatherSummary extends WeatherSummary {
  const _WeatherSummary(
      {@JsonKey(name: 'symbol_code') required this.symbolCode})
      : super._();
  factory _WeatherSummary.fromJson(Map<String, dynamic> json) =>
      _$WeatherSummaryFromJson(json);

  @override
  @JsonKey(name: 'symbol_code')
  final String symbolCode;

  /// Create a copy of WeatherSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WeatherSummaryCopyWith<_WeatherSummary> get copyWith =>
      __$WeatherSummaryCopyWithImpl<_WeatherSummary>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$WeatherSummaryToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WeatherSummary &&
            (identical(other.symbolCode, symbolCode) ||
                other.symbolCode == symbolCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, symbolCode);

  @override
  String toString() {
    return 'WeatherSummary(symbolCode: $symbolCode)';
  }
}

/// @nodoc
abstract mixin class _$WeatherSummaryCopyWith<$Res>
    implements $WeatherSummaryCopyWith<$Res> {
  factory _$WeatherSummaryCopyWith(
          _WeatherSummary value, $Res Function(_WeatherSummary) _then) =
      __$WeatherSummaryCopyWithImpl;
  @override
  @useResult
  $Res call({@JsonKey(name: 'symbol_code') String symbolCode});
}

/// @nodoc
class __$WeatherSummaryCopyWithImpl<$Res>
    implements _$WeatherSummaryCopyWith<$Res> {
  __$WeatherSummaryCopyWithImpl(this._self, this._then);

  final _WeatherSummary _self;
  final $Res Function(_WeatherSummary) _then;

  /// Create a copy of WeatherSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? symbolCode = null,
  }) {
    return _then(_WeatherSummary(
      symbolCode: null == symbolCode
          ? _self.symbolCode
          : symbolCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$WeatherProperties {
  @JsonKey(name: 'meta')
  WeatherMeta get meta;
  @JsonKey(name: 'timeseries')
  List<WeatherTimeStep> get timeseries;

  /// Create a copy of WeatherProperties
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WeatherPropertiesCopyWith<WeatherProperties> get copyWith =>
      _$WeatherPropertiesCopyWithImpl<WeatherProperties>(
          this as WeatherProperties, _$identity);

  /// Serializes this WeatherProperties to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WeatherProperties &&
            (identical(other.meta, meta) || other.meta == meta) &&
            const DeepCollectionEquality()
                .equals(other.timeseries, timeseries));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, meta, const DeepCollectionEquality().hash(timeseries));

  @override
  String toString() {
    return 'WeatherProperties(meta: $meta, timeseries: $timeseries)';
  }
}

/// @nodoc
abstract mixin class $WeatherPropertiesCopyWith<$Res> {
  factory $WeatherPropertiesCopyWith(
          WeatherProperties value, $Res Function(WeatherProperties) _then) =
      _$WeatherPropertiesCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'meta') WeatherMeta meta,
      @JsonKey(name: 'timeseries') List<WeatherTimeStep> timeseries});

  $WeatherMetaCopyWith<$Res> get meta;
}

/// @nodoc
class _$WeatherPropertiesCopyWithImpl<$Res>
    implements $WeatherPropertiesCopyWith<$Res> {
  _$WeatherPropertiesCopyWithImpl(this._self, this._then);

  final WeatherProperties _self;
  final $Res Function(WeatherProperties) _then;

  /// Create a copy of WeatherProperties
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meta = null,
    Object? timeseries = null,
  }) {
    return _then(_self.copyWith(
      meta: null == meta
          ? _self.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as WeatherMeta,
      timeseries: null == timeseries
          ? _self.timeseries
          : timeseries // ignore: cast_nullable_to_non_nullable
              as List<WeatherTimeStep>,
    ));
  }

  /// Create a copy of WeatherProperties
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WeatherMetaCopyWith<$Res> get meta {
    return $WeatherMetaCopyWith<$Res>(_self.meta, (value) {
      return _then(_self.copyWith(meta: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _WeatherProperties extends WeatherProperties {
  const _WeatherProperties(
      {@JsonKey(name: 'meta') required this.meta,
      @JsonKey(name: 'timeseries')
      required final List<WeatherTimeStep> timeseries})
      : _timeseries = timeseries,
        super._();
  factory _WeatherProperties.fromJson(Map<String, dynamic> json) =>
      _$WeatherPropertiesFromJson(json);

  @override
  @JsonKey(name: 'meta')
  final WeatherMeta meta;
  final List<WeatherTimeStep> _timeseries;
  @override
  @JsonKey(name: 'timeseries')
  List<WeatherTimeStep> get timeseries {
    if (_timeseries is EqualUnmodifiableListView) return _timeseries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_timeseries);
  }

  /// Create a copy of WeatherProperties
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WeatherPropertiesCopyWith<_WeatherProperties> get copyWith =>
      __$WeatherPropertiesCopyWithImpl<_WeatherProperties>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$WeatherPropertiesToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WeatherProperties &&
            (identical(other.meta, meta) || other.meta == meta) &&
            const DeepCollectionEquality()
                .equals(other._timeseries, _timeseries));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, meta, const DeepCollectionEquality().hash(_timeseries));

  @override
  String toString() {
    return 'WeatherProperties(meta: $meta, timeseries: $timeseries)';
  }
}

/// @nodoc
abstract mixin class _$WeatherPropertiesCopyWith<$Res>
    implements $WeatherPropertiesCopyWith<$Res> {
  factory _$WeatherPropertiesCopyWith(
          _WeatherProperties value, $Res Function(_WeatherProperties) _then) =
      __$WeatherPropertiesCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'meta') WeatherMeta meta,
      @JsonKey(name: 'timeseries') List<WeatherTimeStep> timeseries});

  @override
  $WeatherMetaCopyWith<$Res> get meta;
}

/// @nodoc
class __$WeatherPropertiesCopyWithImpl<$Res>
    implements _$WeatherPropertiesCopyWith<$Res> {
  __$WeatherPropertiesCopyWithImpl(this._self, this._then);

  final _WeatherProperties _self;
  final $Res Function(_WeatherProperties) _then;

  /// Create a copy of WeatherProperties
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? meta = null,
    Object? timeseries = null,
  }) {
    return _then(_WeatherProperties(
      meta: null == meta
          ? _self.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as WeatherMeta,
      timeseries: null == timeseries
          ? _self._timeseries
          : timeseries // ignore: cast_nullable_to_non_nullable
              as List<WeatherTimeStep>,
    ));
  }

  /// Create a copy of WeatherProperties
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WeatherMetaCopyWith<$Res> get meta {
    return $WeatherMetaCopyWith<$Res>(_self.meta, (value) {
      return _then(_self.copyWith(meta: value));
    });
  }
}

/// @nodoc
mixin _$WeatherMeta {
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;
  @JsonKey(name: 'units')
  WeatherUnits get units;

  /// Create a copy of WeatherMeta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WeatherMetaCopyWith<WeatherMeta> get copyWith =>
      _$WeatherMetaCopyWithImpl<WeatherMeta>(this as WeatherMeta, _$identity);

  /// Serializes this WeatherMeta to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WeatherMeta &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.units, units) || other.units == units));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, updatedAt, units);

  @override
  String toString() {
    return 'WeatherMeta(updatedAt: $updatedAt, units: $units)';
  }
}

/// @nodoc
abstract mixin class $WeatherMetaCopyWith<$Res> {
  factory $WeatherMetaCopyWith(
          WeatherMeta value, $Res Function(WeatherMeta) _then) =
      _$WeatherMetaCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'updated_at') DateTime updatedAt,
      @JsonKey(name: 'units') WeatherUnits units});

  $WeatherUnitsCopyWith<$Res> get units;
}

/// @nodoc
class _$WeatherMetaCopyWithImpl<$Res> implements $WeatherMetaCopyWith<$Res> {
  _$WeatherMetaCopyWithImpl(this._self, this._then);

  final WeatherMeta _self;
  final $Res Function(WeatherMeta) _then;

  /// Create a copy of WeatherMeta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? updatedAt = null,
    Object? units = null,
  }) {
    return _then(_self.copyWith(
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      units: null == units
          ? _self.units
          : units // ignore: cast_nullable_to_non_nullable
              as WeatherUnits,
    ));
  }

  /// Create a copy of WeatherMeta
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WeatherUnitsCopyWith<$Res> get units {
    return $WeatherUnitsCopyWith<$Res>(_self.units, (value) {
      return _then(_self.copyWith(units: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _WeatherMeta extends WeatherMeta {
  const _WeatherMeta(
      {@JsonKey(name: 'updated_at') required this.updatedAt,
      @JsonKey(name: 'units') required this.units})
      : super._();
  factory _WeatherMeta.fromJson(Map<String, dynamic> json) =>
      _$WeatherMetaFromJson(json);

  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;
  @override
  @JsonKey(name: 'units')
  final WeatherUnits units;

  /// Create a copy of WeatherMeta
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WeatherMetaCopyWith<_WeatherMeta> get copyWith =>
      __$WeatherMetaCopyWithImpl<_WeatherMeta>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$WeatherMetaToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WeatherMeta &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.units, units) || other.units == units));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, updatedAt, units);

  @override
  String toString() {
    return 'WeatherMeta(updatedAt: $updatedAt, units: $units)';
  }
}

/// @nodoc
abstract mixin class _$WeatherMetaCopyWith<$Res>
    implements $WeatherMetaCopyWith<$Res> {
  factory _$WeatherMetaCopyWith(
          _WeatherMeta value, $Res Function(_WeatherMeta) _then) =
      __$WeatherMetaCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'updated_at') DateTime updatedAt,
      @JsonKey(name: 'units') WeatherUnits units});

  @override
  $WeatherUnitsCopyWith<$Res> get units;
}

/// @nodoc
class __$WeatherMetaCopyWithImpl<$Res> implements _$WeatherMetaCopyWith<$Res> {
  __$WeatherMetaCopyWithImpl(this._self, this._then);

  final _WeatherMeta _self;
  final $Res Function(_WeatherMeta) _then;

  /// Create a copy of WeatherMeta
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? updatedAt = null,
    Object? units = null,
  }) {
    return _then(_WeatherMeta(
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      units: null == units
          ? _self.units
          : units // ignore: cast_nullable_to_non_nullable
              as WeatherUnits,
    ));
  }

  /// Create a copy of WeatherMeta
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WeatherUnitsCopyWith<$Res> get units {
    return $WeatherUnitsCopyWith<$Res>(_self.units, (value) {
      return _then(_self.copyWith(units: value));
    });
  }
}

/// @nodoc
mixin _$WeatherUnits {
  @JsonKey(name: 'air_pressure_at_sea_level')
  String? get airPressureAtSeaLevel;
  @JsonKey(name: 'air_temperature')
  String? get airTemperature;
  @JsonKey(name: 'cloud_area_fraction')
  String? get cloudAreaFraction;
  @JsonKey(name: 'precipitation_amount')
  String? get precipitationAmount;
  @JsonKey(name: 'relative_humidity')
  String? get relativeHumidity;
  @JsonKey(name: 'wind_from_direction')
  String? get windFromDirection;
  @JsonKey(name: 'wind_speed')
  String? get windSpeed;
  @JsonKey(name: 'wind_speed_of_gust')
  String? get windSpeedOfGust;
  @JsonKey(name: 'light_luminance')
  String? get lightLuminance;
  @JsonKey(name: 'ultraviolet_radiation')
  String? get ultravioletRadiation;

  /// Create a copy of WeatherUnits
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WeatherUnitsCopyWith<WeatherUnits> get copyWith =>
      _$WeatherUnitsCopyWithImpl<WeatherUnits>(
          this as WeatherUnits, _$identity);

  /// Serializes this WeatherUnits to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WeatherUnits &&
            (identical(other.airPressureAtSeaLevel, airPressureAtSeaLevel) ||
                other.airPressureAtSeaLevel == airPressureAtSeaLevel) &&
            (identical(other.airTemperature, airTemperature) ||
                other.airTemperature == airTemperature) &&
            (identical(other.cloudAreaFraction, cloudAreaFraction) ||
                other.cloudAreaFraction == cloudAreaFraction) &&
            (identical(other.precipitationAmount, precipitationAmount) ||
                other.precipitationAmount == precipitationAmount) &&
            (identical(other.relativeHumidity, relativeHumidity) ||
                other.relativeHumidity == relativeHumidity) &&
            (identical(other.windFromDirection, windFromDirection) ||
                other.windFromDirection == windFromDirection) &&
            (identical(other.windSpeed, windSpeed) ||
                other.windSpeed == windSpeed) &&
            (identical(other.windSpeedOfGust, windSpeedOfGust) ||
                other.windSpeedOfGust == windSpeedOfGust) &&
            (identical(other.lightLuminance, lightLuminance) ||
                other.lightLuminance == lightLuminance) &&
            (identical(other.ultravioletRadiation, ultravioletRadiation) ||
                other.ultravioletRadiation == ultravioletRadiation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      airPressureAtSeaLevel,
      airTemperature,
      cloudAreaFraction,
      precipitationAmount,
      relativeHumidity,
      windFromDirection,
      windSpeed,
      windSpeedOfGust,
      lightLuminance,
      ultravioletRadiation);

  @override
  String toString() {
    return 'WeatherUnits(airPressureAtSeaLevel: $airPressureAtSeaLevel, airTemperature: $airTemperature, cloudAreaFraction: $cloudAreaFraction, precipitationAmount: $precipitationAmount, relativeHumidity: $relativeHumidity, windFromDirection: $windFromDirection, windSpeed: $windSpeed, windSpeedOfGust: $windSpeedOfGust, lightLuminance: $lightLuminance, ultravioletRadiation: $ultravioletRadiation)';
  }
}

/// @nodoc
abstract mixin class $WeatherUnitsCopyWith<$Res> {
  factory $WeatherUnitsCopyWith(
          WeatherUnits value, $Res Function(WeatherUnits) _then) =
      _$WeatherUnitsCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'air_pressure_at_sea_level')
      String? airPressureAtSeaLevel,
      @JsonKey(name: 'air_temperature') String? airTemperature,
      @JsonKey(name: 'cloud_area_fraction') String? cloudAreaFraction,
      @JsonKey(name: 'precipitation_amount') String? precipitationAmount,
      @JsonKey(name: 'relative_humidity') String? relativeHumidity,
      @JsonKey(name: 'wind_from_direction') String? windFromDirection,
      @JsonKey(name: 'wind_speed') String? windSpeed,
      @JsonKey(name: 'wind_speed_of_gust') String? windSpeedOfGust,
      @JsonKey(name: 'light_luminance') String? lightLuminance,
      @JsonKey(name: 'ultraviolet_radiation') String? ultravioletRadiation});
}

/// @nodoc
class _$WeatherUnitsCopyWithImpl<$Res> implements $WeatherUnitsCopyWith<$Res> {
  _$WeatherUnitsCopyWithImpl(this._self, this._then);

  final WeatherUnits _self;
  final $Res Function(WeatherUnits) _then;

  /// Create a copy of WeatherUnits
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? airPressureAtSeaLevel = freezed,
    Object? airTemperature = freezed,
    Object? cloudAreaFraction = freezed,
    Object? precipitationAmount = freezed,
    Object? relativeHumidity = freezed,
    Object? windFromDirection = freezed,
    Object? windSpeed = freezed,
    Object? windSpeedOfGust = freezed,
    Object? lightLuminance = freezed,
    Object? ultravioletRadiation = freezed,
  }) {
    return _then(_self.copyWith(
      airPressureAtSeaLevel: freezed == airPressureAtSeaLevel
          ? _self.airPressureAtSeaLevel
          : airPressureAtSeaLevel // ignore: cast_nullable_to_non_nullable
              as String?,
      airTemperature: freezed == airTemperature
          ? _self.airTemperature
          : airTemperature // ignore: cast_nullable_to_non_nullable
              as String?,
      cloudAreaFraction: freezed == cloudAreaFraction
          ? _self.cloudAreaFraction
          : cloudAreaFraction // ignore: cast_nullable_to_non_nullable
              as String?,
      precipitationAmount: freezed == precipitationAmount
          ? _self.precipitationAmount
          : precipitationAmount // ignore: cast_nullable_to_non_nullable
              as String?,
      relativeHumidity: freezed == relativeHumidity
          ? _self.relativeHumidity
          : relativeHumidity // ignore: cast_nullable_to_non_nullable
              as String?,
      windFromDirection: freezed == windFromDirection
          ? _self.windFromDirection
          : windFromDirection // ignore: cast_nullable_to_non_nullable
              as String?,
      windSpeed: freezed == windSpeed
          ? _self.windSpeed
          : windSpeed // ignore: cast_nullable_to_non_nullable
              as String?,
      windSpeedOfGust: freezed == windSpeedOfGust
          ? _self.windSpeedOfGust
          : windSpeedOfGust // ignore: cast_nullable_to_non_nullable
              as String?,
      lightLuminance: freezed == lightLuminance
          ? _self.lightLuminance
          : lightLuminance // ignore: cast_nullable_to_non_nullable
              as String?,
      ultravioletRadiation: freezed == ultravioletRadiation
          ? _self.ultravioletRadiation
          : ultravioletRadiation // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _WeatherUnits extends WeatherUnits {
  const _WeatherUnits(
      {@JsonKey(name: 'air_pressure_at_sea_level') this.airPressureAtSeaLevel,
      @JsonKey(name: 'air_temperature') this.airTemperature,
      @JsonKey(name: 'cloud_area_fraction') this.cloudAreaFraction,
      @JsonKey(name: 'precipitation_amount') this.precipitationAmount,
      @JsonKey(name: 'relative_humidity') this.relativeHumidity,
      @JsonKey(name: 'wind_from_direction') this.windFromDirection,
      @JsonKey(name: 'wind_speed') this.windSpeed,
      @JsonKey(name: 'wind_speed_of_gust') this.windSpeedOfGust,
      @JsonKey(name: 'light_luminance') this.lightLuminance,
      @JsonKey(name: 'ultraviolet_radiation') this.ultravioletRadiation})
      : super._();
  factory _WeatherUnits.fromJson(Map<String, dynamic> json) =>
      _$WeatherUnitsFromJson(json);

  @override
  @JsonKey(name: 'air_pressure_at_sea_level')
  final String? airPressureAtSeaLevel;
  @override
  @JsonKey(name: 'air_temperature')
  final String? airTemperature;
  @override
  @JsonKey(name: 'cloud_area_fraction')
  final String? cloudAreaFraction;
  @override
  @JsonKey(name: 'precipitation_amount')
  final String? precipitationAmount;
  @override
  @JsonKey(name: 'relative_humidity')
  final String? relativeHumidity;
  @override
  @JsonKey(name: 'wind_from_direction')
  final String? windFromDirection;
  @override
  @JsonKey(name: 'wind_speed')
  final String? windSpeed;
  @override
  @JsonKey(name: 'wind_speed_of_gust')
  final String? windSpeedOfGust;
  @override
  @JsonKey(name: 'light_luminance')
  final String? lightLuminance;
  @override
  @JsonKey(name: 'ultraviolet_radiation')
  final String? ultravioletRadiation;

  /// Create a copy of WeatherUnits
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WeatherUnitsCopyWith<_WeatherUnits> get copyWith =>
      __$WeatherUnitsCopyWithImpl<_WeatherUnits>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$WeatherUnitsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WeatherUnits &&
            (identical(other.airPressureAtSeaLevel, airPressureAtSeaLevel) ||
                other.airPressureAtSeaLevel == airPressureAtSeaLevel) &&
            (identical(other.airTemperature, airTemperature) ||
                other.airTemperature == airTemperature) &&
            (identical(other.cloudAreaFraction, cloudAreaFraction) ||
                other.cloudAreaFraction == cloudAreaFraction) &&
            (identical(other.precipitationAmount, precipitationAmount) ||
                other.precipitationAmount == precipitationAmount) &&
            (identical(other.relativeHumidity, relativeHumidity) ||
                other.relativeHumidity == relativeHumidity) &&
            (identical(other.windFromDirection, windFromDirection) ||
                other.windFromDirection == windFromDirection) &&
            (identical(other.windSpeed, windSpeed) ||
                other.windSpeed == windSpeed) &&
            (identical(other.windSpeedOfGust, windSpeedOfGust) ||
                other.windSpeedOfGust == windSpeedOfGust) &&
            (identical(other.lightLuminance, lightLuminance) ||
                other.lightLuminance == lightLuminance) &&
            (identical(other.ultravioletRadiation, ultravioletRadiation) ||
                other.ultravioletRadiation == ultravioletRadiation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      airPressureAtSeaLevel,
      airTemperature,
      cloudAreaFraction,
      precipitationAmount,
      relativeHumidity,
      windFromDirection,
      windSpeed,
      windSpeedOfGust,
      lightLuminance,
      ultravioletRadiation);

  @override
  String toString() {
    return 'WeatherUnits(airPressureAtSeaLevel: $airPressureAtSeaLevel, airTemperature: $airTemperature, cloudAreaFraction: $cloudAreaFraction, precipitationAmount: $precipitationAmount, relativeHumidity: $relativeHumidity, windFromDirection: $windFromDirection, windSpeed: $windSpeed, windSpeedOfGust: $windSpeedOfGust, lightLuminance: $lightLuminance, ultravioletRadiation: $ultravioletRadiation)';
  }
}

/// @nodoc
abstract mixin class _$WeatherUnitsCopyWith<$Res>
    implements $WeatherUnitsCopyWith<$Res> {
  factory _$WeatherUnitsCopyWith(
          _WeatherUnits value, $Res Function(_WeatherUnits) _then) =
      __$WeatherUnitsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'air_pressure_at_sea_level')
      String? airPressureAtSeaLevel,
      @JsonKey(name: 'air_temperature') String? airTemperature,
      @JsonKey(name: 'cloud_area_fraction') String? cloudAreaFraction,
      @JsonKey(name: 'precipitation_amount') String? precipitationAmount,
      @JsonKey(name: 'relative_humidity') String? relativeHumidity,
      @JsonKey(name: 'wind_from_direction') String? windFromDirection,
      @JsonKey(name: 'wind_speed') String? windSpeed,
      @JsonKey(name: 'wind_speed_of_gust') String? windSpeedOfGust,
      @JsonKey(name: 'light_luminance') String? lightLuminance,
      @JsonKey(name: 'ultraviolet_radiation') String? ultravioletRadiation});
}

/// @nodoc
class __$WeatherUnitsCopyWithImpl<$Res>
    implements _$WeatherUnitsCopyWith<$Res> {
  __$WeatherUnitsCopyWithImpl(this._self, this._then);

  final _WeatherUnits _self;
  final $Res Function(_WeatherUnits) _then;

  /// Create a copy of WeatherUnits
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? airPressureAtSeaLevel = freezed,
    Object? airTemperature = freezed,
    Object? cloudAreaFraction = freezed,
    Object? precipitationAmount = freezed,
    Object? relativeHumidity = freezed,
    Object? windFromDirection = freezed,
    Object? windSpeed = freezed,
    Object? windSpeedOfGust = freezed,
    Object? lightLuminance = freezed,
    Object? ultravioletRadiation = freezed,
  }) {
    return _then(_WeatherUnits(
      airPressureAtSeaLevel: freezed == airPressureAtSeaLevel
          ? _self.airPressureAtSeaLevel
          : airPressureAtSeaLevel // ignore: cast_nullable_to_non_nullable
              as String?,
      airTemperature: freezed == airTemperature
          ? _self.airTemperature
          : airTemperature // ignore: cast_nullable_to_non_nullable
              as String?,
      cloudAreaFraction: freezed == cloudAreaFraction
          ? _self.cloudAreaFraction
          : cloudAreaFraction // ignore: cast_nullable_to_non_nullable
              as String?,
      precipitationAmount: freezed == precipitationAmount
          ? _self.precipitationAmount
          : precipitationAmount // ignore: cast_nullable_to_non_nullable
              as String?,
      relativeHumidity: freezed == relativeHumidity
          ? _self.relativeHumidity
          : relativeHumidity // ignore: cast_nullable_to_non_nullable
              as String?,
      windFromDirection: freezed == windFromDirection
          ? _self.windFromDirection
          : windFromDirection // ignore: cast_nullable_to_non_nullable
              as String?,
      windSpeed: freezed == windSpeed
          ? _self.windSpeed
          : windSpeed // ignore: cast_nullable_to_non_nullable
              as String?,
      windSpeedOfGust: freezed == windSpeedOfGust
          ? _self.windSpeedOfGust
          : windSpeedOfGust // ignore: cast_nullable_to_non_nullable
              as String?,
      lightLuminance: freezed == lightLuminance
          ? _self.lightLuminance
          : lightLuminance // ignore: cast_nullable_to_non_nullable
              as String?,
      ultravioletRadiation: freezed == ultravioletRadiation
          ? _self.ultravioletRadiation
          : ultravioletRadiation // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
