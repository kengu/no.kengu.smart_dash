// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weather_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WeatherState _$WeatherStateFromJson(Map<String, dynamic> json) {
  return _WeatherState.fromJson(json);
}

/// @nodoc
mixin _$WeatherState {
  @JsonKey(name: 'service')
  String get service => throw _privateConstructorUsedError;
  @JsonKey(name: 'geometry')
  PointGeometry get geometry => throw _privateConstructorUsedError;
  @JsonKey(name: 'properties')
  WeatherProperties get props => throw _privateConstructorUsedError;
  @JsonKey(name: 'place')
  String? get place => throw _privateConstructorUsedError;
  @JsonKey(name: 'observedBy')
  String? get observedBy => throw _privateConstructorUsedError;

  /// Serializes this WeatherState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WeatherState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeatherStateCopyWith<WeatherState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherStateCopyWith<$Res> {
  factory $WeatherStateCopyWith(
          WeatherState value, $Res Function(WeatherState) then) =
      _$WeatherStateCopyWithImpl<$Res, WeatherState>;
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
class _$WeatherStateCopyWithImpl<$Res, $Val extends WeatherState>
    implements $WeatherStateCopyWith<$Res> {
  _$WeatherStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      service: null == service
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as String,
      geometry: null == geometry
          ? _value.geometry
          : geometry // ignore: cast_nullable_to_non_nullable
              as PointGeometry,
      props: null == props
          ? _value.props
          : props // ignore: cast_nullable_to_non_nullable
              as WeatherProperties,
      place: freezed == place
          ? _value.place
          : place // ignore: cast_nullable_to_non_nullable
              as String?,
      observedBy: freezed == observedBy
          ? _value.observedBy
          : observedBy // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of WeatherState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PointGeometryCopyWith<$Res> get geometry {
    return $PointGeometryCopyWith<$Res>(_value.geometry, (value) {
      return _then(_value.copyWith(geometry: value) as $Val);
    });
  }

  /// Create a copy of WeatherState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WeatherPropertiesCopyWith<$Res> get props {
    return $WeatherPropertiesCopyWith<$Res>(_value.props, (value) {
      return _then(_value.copyWith(props: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WeatherStateImplCopyWith<$Res>
    implements $WeatherStateCopyWith<$Res> {
  factory _$$WeatherStateImplCopyWith(
          _$WeatherStateImpl value, $Res Function(_$WeatherStateImpl) then) =
      __$$WeatherStateImplCopyWithImpl<$Res>;
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
class __$$WeatherStateImplCopyWithImpl<$Res>
    extends _$WeatherStateCopyWithImpl<$Res, _$WeatherStateImpl>
    implements _$$WeatherStateImplCopyWith<$Res> {
  __$$WeatherStateImplCopyWithImpl(
      _$WeatherStateImpl _value, $Res Function(_$WeatherStateImpl) _then)
      : super(_value, _then);

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
    return _then(_$WeatherStateImpl(
      service: null == service
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as String,
      geometry: null == geometry
          ? _value.geometry
          : geometry // ignore: cast_nullable_to_non_nullable
              as PointGeometry,
      props: null == props
          ? _value.props
          : props // ignore: cast_nullable_to_non_nullable
              as WeatherProperties,
      place: freezed == place
          ? _value.place
          : place // ignore: cast_nullable_to_non_nullable
              as String?,
      observedBy: freezed == observedBy
          ? _value.observedBy
          : observedBy // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeatherStateImpl extends _WeatherState {
  const _$WeatherStateImpl(
      {@JsonKey(name: 'service') required this.service,
      @JsonKey(name: 'geometry') required this.geometry,
      @JsonKey(name: 'properties') required this.props,
      @JsonKey(name: 'place') this.place,
      @JsonKey(name: 'observedBy') this.observedBy})
      : super._();

  factory _$WeatherStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeatherStateImplFromJson(json);

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

  @override
  String toString() {
    return 'WeatherState(service: $service, geometry: $geometry, props: $props, place: $place, observedBy: $observedBy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherStateImpl &&
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

  /// Create a copy of WeatherState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherStateImplCopyWith<_$WeatherStateImpl> get copyWith =>
      __$$WeatherStateImplCopyWithImpl<_$WeatherStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeatherStateImplToJson(
      this,
    );
  }
}

abstract class _WeatherState extends WeatherState {
  const factory _WeatherState(
          {@JsonKey(name: 'service') required final String service,
          @JsonKey(name: 'geometry') required final PointGeometry geometry,
          @JsonKey(name: 'properties') required final WeatherProperties props,
          @JsonKey(name: 'place') final String? place,
          @JsonKey(name: 'observedBy') final String? observedBy}) =
      _$WeatherStateImpl;
  const _WeatherState._() : super._();

  factory _WeatherState.fromJson(Map<String, dynamic> json) =
      _$WeatherStateImpl.fromJson;

  @override
  @JsonKey(name: 'service')
  String get service;
  @override
  @JsonKey(name: 'geometry')
  PointGeometry get geometry;
  @override
  @JsonKey(name: 'properties')
  WeatherProperties get props;
  @override
  @JsonKey(name: 'place')
  String? get place;
  @override
  @JsonKey(name: 'observedBy')
  String? get observedBy;

  /// Create a copy of WeatherState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeatherStateImplCopyWith<_$WeatherStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WeatherTimeStep _$WeatherTimeStepFromJson(Map<String, dynamic> json) {
  return _WeatherTimeStep.fromJson(json);
}

/// @nodoc
mixin _$WeatherTimeStep {
  @JsonKey(name: 'time')
  DateTime get time => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  WeatherData get data => throw _privateConstructorUsedError;

  /// Serializes this WeatherTimeStep to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WeatherTimeStep
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeatherTimeStepCopyWith<WeatherTimeStep> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherTimeStepCopyWith<$Res> {
  factory $WeatherTimeStepCopyWith(
          WeatherTimeStep value, $Res Function(WeatherTimeStep) then) =
      _$WeatherTimeStepCopyWithImpl<$Res, WeatherTimeStep>;
  @useResult
  $Res call(
      {@JsonKey(name: 'time') DateTime time,
      @JsonKey(name: 'data') WeatherData data});

  $WeatherDataCopyWith<$Res> get data;
}

/// @nodoc
class _$WeatherTimeStepCopyWithImpl<$Res, $Val extends WeatherTimeStep>
    implements $WeatherTimeStepCopyWith<$Res> {
  _$WeatherTimeStepCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WeatherTimeStep
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as WeatherData,
    ) as $Val);
  }

  /// Create a copy of WeatherTimeStep
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WeatherDataCopyWith<$Res> get data {
    return $WeatherDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WeatherTimeStepImplCopyWith<$Res>
    implements $WeatherTimeStepCopyWith<$Res> {
  factory _$$WeatherTimeStepImplCopyWith(_$WeatherTimeStepImpl value,
          $Res Function(_$WeatherTimeStepImpl) then) =
      __$$WeatherTimeStepImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'time') DateTime time,
      @JsonKey(name: 'data') WeatherData data});

  @override
  $WeatherDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$WeatherTimeStepImplCopyWithImpl<$Res>
    extends _$WeatherTimeStepCopyWithImpl<$Res, _$WeatherTimeStepImpl>
    implements _$$WeatherTimeStepImplCopyWith<$Res> {
  __$$WeatherTimeStepImplCopyWithImpl(
      _$WeatherTimeStepImpl _value, $Res Function(_$WeatherTimeStepImpl) _then)
      : super(_value, _then);

  /// Create a copy of WeatherTimeStep
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? data = null,
  }) {
    return _then(_$WeatherTimeStepImpl(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as WeatherData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeatherTimeStepImpl extends _WeatherTimeStep {
  const _$WeatherTimeStepImpl(
      {@JsonKey(name: 'time') required this.time,
      @JsonKey(name: 'data') required this.data})
      : super._();

  factory _$WeatherTimeStepImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeatherTimeStepImplFromJson(json);

  @override
  @JsonKey(name: 'time')
  final DateTime time;
  @override
  @JsonKey(name: 'data')
  final WeatherData data;

  @override
  String toString() {
    return 'WeatherTimeStep(time: $time, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherTimeStepImpl &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, time, data);

  /// Create a copy of WeatherTimeStep
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherTimeStepImplCopyWith<_$WeatherTimeStepImpl> get copyWith =>
      __$$WeatherTimeStepImplCopyWithImpl<_$WeatherTimeStepImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeatherTimeStepImplToJson(
      this,
    );
  }
}

abstract class _WeatherTimeStep extends WeatherTimeStep {
  const factory _WeatherTimeStep(
          {@JsonKey(name: 'time') required final DateTime time,
          @JsonKey(name: 'data') required final WeatherData data}) =
      _$WeatherTimeStepImpl;
  const _WeatherTimeStep._() : super._();

  factory _WeatherTimeStep.fromJson(Map<String, dynamic> json) =
      _$WeatherTimeStepImpl.fromJson;

  @override
  @JsonKey(name: 'time')
  DateTime get time;
  @override
  @JsonKey(name: 'data')
  WeatherData get data;

  /// Create a copy of WeatherTimeStep
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeatherTimeStepImplCopyWith<_$WeatherTimeStepImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WeatherData _$WeatherDataFromJson(Map<String, dynamic> json) {
  return _WeatherData.fromJson(json);
}

/// @nodoc
mixin _$WeatherData {
  @JsonKey(name: 'instant')
  WeatherInstant get instant => throw _privateConstructorUsedError;
  @JsonKey(name: 'next_1_hours')
  WeatherForecast? get next1h => throw _privateConstructorUsedError;
  @JsonKey(name: 'next_6_hours')
  WeatherForecast? get next6h => throw _privateConstructorUsedError;
  @JsonKey(name: 'next_12_hours')
  WeatherForecast? get next12h => throw _privateConstructorUsedError;

  /// Serializes this WeatherData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WeatherData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeatherDataCopyWith<WeatherData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherDataCopyWith<$Res> {
  factory $WeatherDataCopyWith(
          WeatherData value, $Res Function(WeatherData) then) =
      _$WeatherDataCopyWithImpl<$Res, WeatherData>;
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
class _$WeatherDataCopyWithImpl<$Res, $Val extends WeatherData>
    implements $WeatherDataCopyWith<$Res> {
  _$WeatherDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      instant: null == instant
          ? _value.instant
          : instant // ignore: cast_nullable_to_non_nullable
              as WeatherInstant,
      next1h: freezed == next1h
          ? _value.next1h
          : next1h // ignore: cast_nullable_to_non_nullable
              as WeatherForecast?,
      next6h: freezed == next6h
          ? _value.next6h
          : next6h // ignore: cast_nullable_to_non_nullable
              as WeatherForecast?,
      next12h: freezed == next12h
          ? _value.next12h
          : next12h // ignore: cast_nullable_to_non_nullable
              as WeatherForecast?,
    ) as $Val);
  }

  /// Create a copy of WeatherData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WeatherInstantCopyWith<$Res> get instant {
    return $WeatherInstantCopyWith<$Res>(_value.instant, (value) {
      return _then(_value.copyWith(instant: value) as $Val);
    });
  }

  /// Create a copy of WeatherData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WeatherForecastCopyWith<$Res>? get next1h {
    if (_value.next1h == null) {
      return null;
    }

    return $WeatherForecastCopyWith<$Res>(_value.next1h!, (value) {
      return _then(_value.copyWith(next1h: value) as $Val);
    });
  }

  /// Create a copy of WeatherData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WeatherForecastCopyWith<$Res>? get next6h {
    if (_value.next6h == null) {
      return null;
    }

    return $WeatherForecastCopyWith<$Res>(_value.next6h!, (value) {
      return _then(_value.copyWith(next6h: value) as $Val);
    });
  }

  /// Create a copy of WeatherData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WeatherForecastCopyWith<$Res>? get next12h {
    if (_value.next12h == null) {
      return null;
    }

    return $WeatherForecastCopyWith<$Res>(_value.next12h!, (value) {
      return _then(_value.copyWith(next12h: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WeatherDataImplCopyWith<$Res>
    implements $WeatherDataCopyWith<$Res> {
  factory _$$WeatherDataImplCopyWith(
          _$WeatherDataImpl value, $Res Function(_$WeatherDataImpl) then) =
      __$$WeatherDataImplCopyWithImpl<$Res>;
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
class __$$WeatherDataImplCopyWithImpl<$Res>
    extends _$WeatherDataCopyWithImpl<$Res, _$WeatherDataImpl>
    implements _$$WeatherDataImplCopyWith<$Res> {
  __$$WeatherDataImplCopyWithImpl(
      _$WeatherDataImpl _value, $Res Function(_$WeatherDataImpl) _then)
      : super(_value, _then);

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
    return _then(_$WeatherDataImpl(
      instant: null == instant
          ? _value.instant
          : instant // ignore: cast_nullable_to_non_nullable
              as WeatherInstant,
      next1h: freezed == next1h
          ? _value.next1h
          : next1h // ignore: cast_nullable_to_non_nullable
              as WeatherForecast?,
      next6h: freezed == next6h
          ? _value.next6h
          : next6h // ignore: cast_nullable_to_non_nullable
              as WeatherForecast?,
      next12h: freezed == next12h
          ? _value.next12h
          : next12h // ignore: cast_nullable_to_non_nullable
              as WeatherForecast?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeatherDataImpl extends _WeatherData {
  const _$WeatherDataImpl(
      {@JsonKey(name: 'instant') required this.instant,
      @JsonKey(name: 'next_1_hours') this.next1h,
      @JsonKey(name: 'next_6_hours') this.next6h,
      @JsonKey(name: 'next_12_hours') this.next12h})
      : super._();

  factory _$WeatherDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeatherDataImplFromJson(json);

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

  @override
  String toString() {
    return 'WeatherData(instant: $instant, next1h: $next1h, next6h: $next6h, next12h: $next12h)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherDataImpl &&
            (identical(other.instant, instant) || other.instant == instant) &&
            (identical(other.next1h, next1h) || other.next1h == next1h) &&
            (identical(other.next6h, next6h) || other.next6h == next6h) &&
            (identical(other.next12h, next12h) || other.next12h == next12h));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, instant, next1h, next6h, next12h);

  /// Create a copy of WeatherData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherDataImplCopyWith<_$WeatherDataImpl> get copyWith =>
      __$$WeatherDataImplCopyWithImpl<_$WeatherDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeatherDataImplToJson(
      this,
    );
  }
}

abstract class _WeatherData extends WeatherData {
  const factory _WeatherData(
          {@JsonKey(name: 'instant') required final WeatherInstant instant,
          @JsonKey(name: 'next_1_hours') final WeatherForecast? next1h,
          @JsonKey(name: 'next_6_hours') final WeatherForecast? next6h,
          @JsonKey(name: 'next_12_hours') final WeatherForecast? next12h}) =
      _$WeatherDataImpl;
  const _WeatherData._() : super._();

  factory _WeatherData.fromJson(Map<String, dynamic> json) =
      _$WeatherDataImpl.fromJson;

  @override
  @JsonKey(name: 'instant')
  WeatherInstant get instant;
  @override
  @JsonKey(name: 'next_1_hours')
  WeatherForecast? get next1h;
  @override
  @JsonKey(name: 'next_6_hours')
  WeatherForecast? get next6h;
  @override
  @JsonKey(name: 'next_12_hours')
  WeatherForecast? get next12h;

  /// Create a copy of WeatherData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeatherDataImplCopyWith<_$WeatherDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WeatherInstant _$WeatherInstantFromJson(Map<String, dynamic> json) {
  return _WeatherInstant.fromJson(json);
}

/// @nodoc
mixin _$WeatherInstant {
  @JsonKey(name: 'details')
  WeatherInstantDetails get details => throw _privateConstructorUsedError;

  /// Serializes this WeatherInstant to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WeatherInstant
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeatherInstantCopyWith<WeatherInstant> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherInstantCopyWith<$Res> {
  factory $WeatherInstantCopyWith(
          WeatherInstant value, $Res Function(WeatherInstant) then) =
      _$WeatherInstantCopyWithImpl<$Res, WeatherInstant>;
  @useResult
  $Res call({@JsonKey(name: 'details') WeatherInstantDetails details});

  $WeatherInstantDetailsCopyWith<$Res> get details;
}

/// @nodoc
class _$WeatherInstantCopyWithImpl<$Res, $Val extends WeatherInstant>
    implements $WeatherInstantCopyWith<$Res> {
  _$WeatherInstantCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WeatherInstant
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? details = null,
  }) {
    return _then(_value.copyWith(
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as WeatherInstantDetails,
    ) as $Val);
  }

  /// Create a copy of WeatherInstant
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WeatherInstantDetailsCopyWith<$Res> get details {
    return $WeatherInstantDetailsCopyWith<$Res>(_value.details, (value) {
      return _then(_value.copyWith(details: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WeatherInstantImplCopyWith<$Res>
    implements $WeatherInstantCopyWith<$Res> {
  factory _$$WeatherInstantImplCopyWith(_$WeatherInstantImpl value,
          $Res Function(_$WeatherInstantImpl) then) =
      __$$WeatherInstantImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'details') WeatherInstantDetails details});

  @override
  $WeatherInstantDetailsCopyWith<$Res> get details;
}

/// @nodoc
class __$$WeatherInstantImplCopyWithImpl<$Res>
    extends _$WeatherInstantCopyWithImpl<$Res, _$WeatherInstantImpl>
    implements _$$WeatherInstantImplCopyWith<$Res> {
  __$$WeatherInstantImplCopyWithImpl(
      _$WeatherInstantImpl _value, $Res Function(_$WeatherInstantImpl) _then)
      : super(_value, _then);

  /// Create a copy of WeatherInstant
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? details = null,
  }) {
    return _then(_$WeatherInstantImpl(
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as WeatherInstantDetails,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeatherInstantImpl extends _WeatherInstant {
  const _$WeatherInstantImpl({@JsonKey(name: 'details') required this.details})
      : super._();

  factory _$WeatherInstantImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeatherInstantImplFromJson(json);

  @override
  @JsonKey(name: 'details')
  final WeatherInstantDetails details;

  @override
  String toString() {
    return 'WeatherInstant(details: $details)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherInstantImpl &&
            (identical(other.details, details) || other.details == details));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, details);

  /// Create a copy of WeatherInstant
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherInstantImplCopyWith<_$WeatherInstantImpl> get copyWith =>
      __$$WeatherInstantImplCopyWithImpl<_$WeatherInstantImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeatherInstantImplToJson(
      this,
    );
  }
}

abstract class _WeatherInstant extends WeatherInstant {
  const factory _WeatherInstant(
      {@JsonKey(name: 'details')
      required final WeatherInstantDetails details}) = _$WeatherInstantImpl;
  const _WeatherInstant._() : super._();

  factory _WeatherInstant.fromJson(Map<String, dynamic> json) =
      _$WeatherInstantImpl.fromJson;

  @override
  @JsonKey(name: 'details')
  WeatherInstantDetails get details;

  /// Create a copy of WeatherInstant
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeatherInstantImplCopyWith<_$WeatherInstantImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WeatherInstantDetails _$WeatherInstantDetailsFromJson(
    Map<String, dynamic> json) {
  return _WeatherInstantDetails.fromJson(json);
}

/// @nodoc
mixin _$WeatherInstantDetails {
  /// Air pressure at sea level
  @JsonKey(name: 'air_pressure_at_sea_level')
  double? get airPressureAtSeaLevel => throw _privateConstructorUsedError;

  /// Air temperature
  @JsonKey(name: 'air_temperature')
  double? get airTemperature => throw _privateConstructorUsedError;

  /// Amount of sky covered by clouds.
  @JsonKey(name: 'cloud_area_fraction')
  double? get cloudAreaFraction => throw _privateConstructorUsedError;

  /// The direction which the wind moves towards
  @JsonKey(name: 'wind_from_direction')
  double? get windFromDirection => throw _privateConstructorUsedError;

  /// Speed of wind
  @JsonKey(name: 'wind_speed')
  double? get windSpeed => throw _privateConstructorUsedError;

  /// Speed of wind gust
  @JsonKey(name: 'wind_speed_of_gust')
  double? get windSpeedOfGust => throw _privateConstructorUsedError;

  /// Light luminance (in lux)
  @JsonKey(name: 'light_luminance')
  int? get lightLuminance => throw _privateConstructorUsedError;

  /// Air humidity (in percent, %)
  @JsonKey(name: 'relative_humidity')
  double? get relativeHumidity => throw _privateConstructorUsedError;

  /// Ultraviolet radiation (in UV index, UVI)
  @JsonKey(name: 'ultraviolet_radiation')
  int? get ultravioletRadiation => throw _privateConstructorUsedError;

  /// Amount of precipitation in mm water equivalents
  @JsonKey(name: 'precipitation_amount')
  double? get precipitationAmount => throw _privateConstructorUsedError;

  /// Serializes this WeatherInstantDetails to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WeatherInstantDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeatherInstantDetailsCopyWith<WeatherInstantDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherInstantDetailsCopyWith<$Res> {
  factory $WeatherInstantDetailsCopyWith(WeatherInstantDetails value,
          $Res Function(WeatherInstantDetails) then) =
      _$WeatherInstantDetailsCopyWithImpl<$Res, WeatherInstantDetails>;
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
class _$WeatherInstantDetailsCopyWithImpl<$Res,
        $Val extends WeatherInstantDetails>
    implements $WeatherInstantDetailsCopyWith<$Res> {
  _$WeatherInstantDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      airPressureAtSeaLevel: freezed == airPressureAtSeaLevel
          ? _value.airPressureAtSeaLevel
          : airPressureAtSeaLevel // ignore: cast_nullable_to_non_nullable
              as double?,
      airTemperature: freezed == airTemperature
          ? _value.airTemperature
          : airTemperature // ignore: cast_nullable_to_non_nullable
              as double?,
      cloudAreaFraction: freezed == cloudAreaFraction
          ? _value.cloudAreaFraction
          : cloudAreaFraction // ignore: cast_nullable_to_non_nullable
              as double?,
      windFromDirection: freezed == windFromDirection
          ? _value.windFromDirection
          : windFromDirection // ignore: cast_nullable_to_non_nullable
              as double?,
      windSpeed: freezed == windSpeed
          ? _value.windSpeed
          : windSpeed // ignore: cast_nullable_to_non_nullable
              as double?,
      windSpeedOfGust: freezed == windSpeedOfGust
          ? _value.windSpeedOfGust
          : windSpeedOfGust // ignore: cast_nullable_to_non_nullable
              as double?,
      lightLuminance: freezed == lightLuminance
          ? _value.lightLuminance
          : lightLuminance // ignore: cast_nullable_to_non_nullable
              as int?,
      relativeHumidity: freezed == relativeHumidity
          ? _value.relativeHumidity
          : relativeHumidity // ignore: cast_nullable_to_non_nullable
              as double?,
      ultravioletRadiation: freezed == ultravioletRadiation
          ? _value.ultravioletRadiation
          : ultravioletRadiation // ignore: cast_nullable_to_non_nullable
              as int?,
      precipitationAmount: freezed == precipitationAmount
          ? _value.precipitationAmount
          : precipitationAmount // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeatherInstantDetailsImplCopyWith<$Res>
    implements $WeatherInstantDetailsCopyWith<$Res> {
  factory _$$WeatherInstantDetailsImplCopyWith(
          _$WeatherInstantDetailsImpl value,
          $Res Function(_$WeatherInstantDetailsImpl) then) =
      __$$WeatherInstantDetailsImplCopyWithImpl<$Res>;
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
class __$$WeatherInstantDetailsImplCopyWithImpl<$Res>
    extends _$WeatherInstantDetailsCopyWithImpl<$Res,
        _$WeatherInstantDetailsImpl>
    implements _$$WeatherInstantDetailsImplCopyWith<$Res> {
  __$$WeatherInstantDetailsImplCopyWithImpl(_$WeatherInstantDetailsImpl _value,
      $Res Function(_$WeatherInstantDetailsImpl) _then)
      : super(_value, _then);

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
    return _then(_$WeatherInstantDetailsImpl(
      airPressureAtSeaLevel: freezed == airPressureAtSeaLevel
          ? _value.airPressureAtSeaLevel
          : airPressureAtSeaLevel // ignore: cast_nullable_to_non_nullable
              as double?,
      airTemperature: freezed == airTemperature
          ? _value.airTemperature
          : airTemperature // ignore: cast_nullable_to_non_nullable
              as double?,
      cloudAreaFraction: freezed == cloudAreaFraction
          ? _value.cloudAreaFraction
          : cloudAreaFraction // ignore: cast_nullable_to_non_nullable
              as double?,
      windFromDirection: freezed == windFromDirection
          ? _value.windFromDirection
          : windFromDirection // ignore: cast_nullable_to_non_nullable
              as double?,
      windSpeed: freezed == windSpeed
          ? _value.windSpeed
          : windSpeed // ignore: cast_nullable_to_non_nullable
              as double?,
      windSpeedOfGust: freezed == windSpeedOfGust
          ? _value.windSpeedOfGust
          : windSpeedOfGust // ignore: cast_nullable_to_non_nullable
              as double?,
      lightLuminance: freezed == lightLuminance
          ? _value.lightLuminance
          : lightLuminance // ignore: cast_nullable_to_non_nullable
              as int?,
      relativeHumidity: freezed == relativeHumidity
          ? _value.relativeHumidity
          : relativeHumidity // ignore: cast_nullable_to_non_nullable
              as double?,
      ultravioletRadiation: freezed == ultravioletRadiation
          ? _value.ultravioletRadiation
          : ultravioletRadiation // ignore: cast_nullable_to_non_nullable
              as int?,
      precipitationAmount: freezed == precipitationAmount
          ? _value.precipitationAmount
          : precipitationAmount // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeatherInstantDetailsImpl extends _WeatherInstantDetails {
  const _$WeatherInstantDetailsImpl(
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

  factory _$WeatherInstantDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeatherInstantDetailsImplFromJson(json);

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

  @override
  String toString() {
    return 'WeatherInstantDetails(airPressureAtSeaLevel: $airPressureAtSeaLevel, airTemperature: $airTemperature, cloudAreaFraction: $cloudAreaFraction, windFromDirection: $windFromDirection, windSpeed: $windSpeed, windSpeedOfGust: $windSpeedOfGust, lightLuminance: $lightLuminance, relativeHumidity: $relativeHumidity, ultravioletRadiation: $ultravioletRadiation, precipitationAmount: $precipitationAmount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherInstantDetailsImpl &&
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

  /// Create a copy of WeatherInstantDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherInstantDetailsImplCopyWith<_$WeatherInstantDetailsImpl>
      get copyWith => __$$WeatherInstantDetailsImplCopyWithImpl<
          _$WeatherInstantDetailsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeatherInstantDetailsImplToJson(
      this,
    );
  }
}

abstract class _WeatherInstantDetails extends WeatherInstantDetails {
  const factory _WeatherInstantDetails(
      {@JsonKey(name: 'air_pressure_at_sea_level')
      final double? airPressureAtSeaLevel,
      @JsonKey(name: 'air_temperature') final double? airTemperature,
      @JsonKey(name: 'cloud_area_fraction') final double? cloudAreaFraction,
      @JsonKey(name: 'wind_from_direction') final double? windFromDirection,
      @JsonKey(name: 'wind_speed') final double? windSpeed,
      @JsonKey(name: 'wind_speed_of_gust') final double? windSpeedOfGust,
      @JsonKey(name: 'light_luminance') final int? lightLuminance,
      @JsonKey(name: 'relative_humidity') final double? relativeHumidity,
      @JsonKey(name: 'ultraviolet_radiation') final int? ultravioletRadiation,
      @JsonKey(name: 'precipitation_amount')
      final double? precipitationAmount}) = _$WeatherInstantDetailsImpl;
  const _WeatherInstantDetails._() : super._();

  factory _WeatherInstantDetails.fromJson(Map<String, dynamic> json) =
      _$WeatherInstantDetailsImpl.fromJson;

  /// Air pressure at sea level
  @override
  @JsonKey(name: 'air_pressure_at_sea_level')
  double? get airPressureAtSeaLevel;

  /// Air temperature
  @override
  @JsonKey(name: 'air_temperature')
  double? get airTemperature;

  /// Amount of sky covered by clouds.
  @override
  @JsonKey(name: 'cloud_area_fraction')
  double? get cloudAreaFraction;

  /// The direction which the wind moves towards
  @override
  @JsonKey(name: 'wind_from_direction')
  double? get windFromDirection;

  /// Speed of wind
  @override
  @JsonKey(name: 'wind_speed')
  double? get windSpeed;

  /// Speed of wind gust
  @override
  @JsonKey(name: 'wind_speed_of_gust')
  double? get windSpeedOfGust;

  /// Light luminance (in lux)
  @override
  @JsonKey(name: 'light_luminance')
  int? get lightLuminance;

  /// Air humidity (in percent, %)
  @override
  @JsonKey(name: 'relative_humidity')
  double? get relativeHumidity;

  /// Ultraviolet radiation (in UV index, UVI)
  @override
  @JsonKey(name: 'ultraviolet_radiation')
  int? get ultravioletRadiation;

  /// Amount of precipitation in mm water equivalents
  @override
  @JsonKey(name: 'precipitation_amount')
  double? get precipitationAmount;

  /// Create a copy of WeatherInstantDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeatherInstantDetailsImplCopyWith<_$WeatherInstantDetailsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

WeatherForecast _$WeatherForecastFromJson(Map<String, dynamic> json) {
  return _WeatherForecast.fromJson(json);
}

/// @nodoc
mixin _$WeatherForecast {
  @JsonKey(name: 'summary')
  WeatherSummary get summary => throw _privateConstructorUsedError;
  @JsonKey(name: 'details')
  WeatherForecastDetails get details => throw _privateConstructorUsedError;

  /// Serializes this WeatherForecast to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WeatherForecast
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeatherForecastCopyWith<WeatherForecast> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherForecastCopyWith<$Res> {
  factory $WeatherForecastCopyWith(
          WeatherForecast value, $Res Function(WeatherForecast) then) =
      _$WeatherForecastCopyWithImpl<$Res, WeatherForecast>;
  @useResult
  $Res call(
      {@JsonKey(name: 'summary') WeatherSummary summary,
      @JsonKey(name: 'details') WeatherForecastDetails details});

  $WeatherSummaryCopyWith<$Res> get summary;
  $WeatherForecastDetailsCopyWith<$Res> get details;
}

/// @nodoc
class _$WeatherForecastCopyWithImpl<$Res, $Val extends WeatherForecast>
    implements $WeatherForecastCopyWith<$Res> {
  _$WeatherForecastCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WeatherForecast
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? summary = null,
    Object? details = null,
  }) {
    return _then(_value.copyWith(
      summary: null == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as WeatherSummary,
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as WeatherForecastDetails,
    ) as $Val);
  }

  /// Create a copy of WeatherForecast
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WeatherSummaryCopyWith<$Res> get summary {
    return $WeatherSummaryCopyWith<$Res>(_value.summary, (value) {
      return _then(_value.copyWith(summary: value) as $Val);
    });
  }

  /// Create a copy of WeatherForecast
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WeatherForecastDetailsCopyWith<$Res> get details {
    return $WeatherForecastDetailsCopyWith<$Res>(_value.details, (value) {
      return _then(_value.copyWith(details: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WeatherForecastImplCopyWith<$Res>
    implements $WeatherForecastCopyWith<$Res> {
  factory _$$WeatherForecastImplCopyWith(_$WeatherForecastImpl value,
          $Res Function(_$WeatherForecastImpl) then) =
      __$$WeatherForecastImplCopyWithImpl<$Res>;
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
class __$$WeatherForecastImplCopyWithImpl<$Res>
    extends _$WeatherForecastCopyWithImpl<$Res, _$WeatherForecastImpl>
    implements _$$WeatherForecastImplCopyWith<$Res> {
  __$$WeatherForecastImplCopyWithImpl(
      _$WeatherForecastImpl _value, $Res Function(_$WeatherForecastImpl) _then)
      : super(_value, _then);

  /// Create a copy of WeatherForecast
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? summary = null,
    Object? details = null,
  }) {
    return _then(_$WeatherForecastImpl(
      summary: null == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as WeatherSummary,
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as WeatherForecastDetails,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeatherForecastImpl extends _WeatherForecast {
  const _$WeatherForecastImpl(
      {@JsonKey(name: 'summary') required this.summary,
      @JsonKey(name: 'details') required this.details})
      : super._();

  factory _$WeatherForecastImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeatherForecastImplFromJson(json);

  @override
  @JsonKey(name: 'summary')
  final WeatherSummary summary;
  @override
  @JsonKey(name: 'details')
  final WeatherForecastDetails details;

  @override
  String toString() {
    return 'WeatherForecast(summary: $summary, details: $details)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherForecastImpl &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.details, details) || other.details == details));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, summary, details);

  /// Create a copy of WeatherForecast
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherForecastImplCopyWith<_$WeatherForecastImpl> get copyWith =>
      __$$WeatherForecastImplCopyWithImpl<_$WeatherForecastImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeatherForecastImplToJson(
      this,
    );
  }
}

abstract class _WeatherForecast extends WeatherForecast {
  const factory _WeatherForecast(
      {@JsonKey(name: 'summary') required final WeatherSummary summary,
      @JsonKey(name: 'details')
      required final WeatherForecastDetails details}) = _$WeatherForecastImpl;
  const _WeatherForecast._() : super._();

  factory _WeatherForecast.fromJson(Map<String, dynamic> json) =
      _$WeatherForecastImpl.fromJson;

  @override
  @JsonKey(name: 'summary')
  WeatherSummary get summary;
  @override
  @JsonKey(name: 'details')
  WeatherForecastDetails get details;

  /// Create a copy of WeatherForecast
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeatherForecastImplCopyWith<_$WeatherForecastImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WeatherForecastDetails _$WeatherForecastDetailsFromJson(
    Map<String, dynamic> json) {
  return _WeatherForecastDetails.fromJson(json);
}

/// @nodoc
mixin _$WeatherForecastDetails {
  @JsonKey(name: 'air_temperature_min')
  double? get airTemperatureMin => throw _privateConstructorUsedError;
  @JsonKey(name: 'air_temperature_max')
  double? get airTemperatureMax => throw _privateConstructorUsedError;
  @JsonKey(name: 'precipitation_amount')
  double? get precipitationAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'precipitation_amount_min')
  double? get precipitationAmountMin => throw _privateConstructorUsedError;
  @JsonKey(name: 'precipitation_amount_max')
  double? get precipitationAmountMax => throw _privateConstructorUsedError;
  @JsonKey(name: 'probability_of_precipitation')
  double? get probabilityOfPrecipitation => throw _privateConstructorUsedError;
  @JsonKey(name: 'probability_of_thunder')
  double? get probabilityOfThunder => throw _privateConstructorUsedError;

  /// Serializes this WeatherForecastDetails to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WeatherForecastDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeatherForecastDetailsCopyWith<WeatherForecastDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherForecastDetailsCopyWith<$Res> {
  factory $WeatherForecastDetailsCopyWith(WeatherForecastDetails value,
          $Res Function(WeatherForecastDetails) then) =
      _$WeatherForecastDetailsCopyWithImpl<$Res, WeatherForecastDetails>;
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
class _$WeatherForecastDetailsCopyWithImpl<$Res,
        $Val extends WeatherForecastDetails>
    implements $WeatherForecastDetailsCopyWith<$Res> {
  _$WeatherForecastDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      airTemperatureMin: freezed == airTemperatureMin
          ? _value.airTemperatureMin
          : airTemperatureMin // ignore: cast_nullable_to_non_nullable
              as double?,
      airTemperatureMax: freezed == airTemperatureMax
          ? _value.airTemperatureMax
          : airTemperatureMax // ignore: cast_nullable_to_non_nullable
              as double?,
      precipitationAmount: freezed == precipitationAmount
          ? _value.precipitationAmount
          : precipitationAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      precipitationAmountMin: freezed == precipitationAmountMin
          ? _value.precipitationAmountMin
          : precipitationAmountMin // ignore: cast_nullable_to_non_nullable
              as double?,
      precipitationAmountMax: freezed == precipitationAmountMax
          ? _value.precipitationAmountMax
          : precipitationAmountMax // ignore: cast_nullable_to_non_nullable
              as double?,
      probabilityOfPrecipitation: freezed == probabilityOfPrecipitation
          ? _value.probabilityOfPrecipitation
          : probabilityOfPrecipitation // ignore: cast_nullable_to_non_nullable
              as double?,
      probabilityOfThunder: freezed == probabilityOfThunder
          ? _value.probabilityOfThunder
          : probabilityOfThunder // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeatherForecastDetailsImplCopyWith<$Res>
    implements $WeatherForecastDetailsCopyWith<$Res> {
  factory _$$WeatherForecastDetailsImplCopyWith(
          _$WeatherForecastDetailsImpl value,
          $Res Function(_$WeatherForecastDetailsImpl) then) =
      __$$WeatherForecastDetailsImplCopyWithImpl<$Res>;
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
class __$$WeatherForecastDetailsImplCopyWithImpl<$Res>
    extends _$WeatherForecastDetailsCopyWithImpl<$Res,
        _$WeatherForecastDetailsImpl>
    implements _$$WeatherForecastDetailsImplCopyWith<$Res> {
  __$$WeatherForecastDetailsImplCopyWithImpl(
      _$WeatherForecastDetailsImpl _value,
      $Res Function(_$WeatherForecastDetailsImpl) _then)
      : super(_value, _then);

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
    return _then(_$WeatherForecastDetailsImpl(
      airTemperatureMin: freezed == airTemperatureMin
          ? _value.airTemperatureMin
          : airTemperatureMin // ignore: cast_nullable_to_non_nullable
              as double?,
      airTemperatureMax: freezed == airTemperatureMax
          ? _value.airTemperatureMax
          : airTemperatureMax // ignore: cast_nullable_to_non_nullable
              as double?,
      precipitationAmount: freezed == precipitationAmount
          ? _value.precipitationAmount
          : precipitationAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      precipitationAmountMin: freezed == precipitationAmountMin
          ? _value.precipitationAmountMin
          : precipitationAmountMin // ignore: cast_nullable_to_non_nullable
              as double?,
      precipitationAmountMax: freezed == precipitationAmountMax
          ? _value.precipitationAmountMax
          : precipitationAmountMax // ignore: cast_nullable_to_non_nullable
              as double?,
      probabilityOfPrecipitation: freezed == probabilityOfPrecipitation
          ? _value.probabilityOfPrecipitation
          : probabilityOfPrecipitation // ignore: cast_nullable_to_non_nullable
              as double?,
      probabilityOfThunder: freezed == probabilityOfThunder
          ? _value.probabilityOfThunder
          : probabilityOfThunder // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeatherForecastDetailsImpl extends _WeatherForecastDetails {
  const _$WeatherForecastDetailsImpl(
      {@JsonKey(name: 'air_temperature_min') this.airTemperatureMin,
      @JsonKey(name: 'air_temperature_max') this.airTemperatureMax,
      @JsonKey(name: 'precipitation_amount') this.precipitationAmount,
      @JsonKey(name: 'precipitation_amount_min') this.precipitationAmountMin,
      @JsonKey(name: 'precipitation_amount_max') this.precipitationAmountMax,
      @JsonKey(name: 'probability_of_precipitation')
      this.probabilityOfPrecipitation,
      @JsonKey(name: 'probability_of_thunder') this.probabilityOfThunder})
      : super._();

  factory _$WeatherForecastDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeatherForecastDetailsImplFromJson(json);

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

  @override
  String toString() {
    return 'WeatherForecastDetails(airTemperatureMin: $airTemperatureMin, airTemperatureMax: $airTemperatureMax, precipitationAmount: $precipitationAmount, precipitationAmountMin: $precipitationAmountMin, precipitationAmountMax: $precipitationAmountMax, probabilityOfPrecipitation: $probabilityOfPrecipitation, probabilityOfThunder: $probabilityOfThunder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherForecastDetailsImpl &&
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

  /// Create a copy of WeatherForecastDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherForecastDetailsImplCopyWith<_$WeatherForecastDetailsImpl>
      get copyWith => __$$WeatherForecastDetailsImplCopyWithImpl<
          _$WeatherForecastDetailsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeatherForecastDetailsImplToJson(
      this,
    );
  }
}

abstract class _WeatherForecastDetails extends WeatherForecastDetails {
  const factory _WeatherForecastDetails(
      {@JsonKey(name: 'air_temperature_min') final double? airTemperatureMin,
      @JsonKey(name: 'air_temperature_max') final double? airTemperatureMax,
      @JsonKey(name: 'precipitation_amount') final double? precipitationAmount,
      @JsonKey(name: 'precipitation_amount_min')
      final double? precipitationAmountMin,
      @JsonKey(name: 'precipitation_amount_max')
      final double? precipitationAmountMax,
      @JsonKey(name: 'probability_of_precipitation')
      final double? probabilityOfPrecipitation,
      @JsonKey(name: 'probability_of_thunder')
      final double? probabilityOfThunder}) = _$WeatherForecastDetailsImpl;
  const _WeatherForecastDetails._() : super._();

  factory _WeatherForecastDetails.fromJson(Map<String, dynamic> json) =
      _$WeatherForecastDetailsImpl.fromJson;

  @override
  @JsonKey(name: 'air_temperature_min')
  double? get airTemperatureMin;
  @override
  @JsonKey(name: 'air_temperature_max')
  double? get airTemperatureMax;
  @override
  @JsonKey(name: 'precipitation_amount')
  double? get precipitationAmount;
  @override
  @JsonKey(name: 'precipitation_amount_min')
  double? get precipitationAmountMin;
  @override
  @JsonKey(name: 'precipitation_amount_max')
  double? get precipitationAmountMax;
  @override
  @JsonKey(name: 'probability_of_precipitation')
  double? get probabilityOfPrecipitation;
  @override
  @JsonKey(name: 'probability_of_thunder')
  double? get probabilityOfThunder;

  /// Create a copy of WeatherForecastDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeatherForecastDetailsImplCopyWith<_$WeatherForecastDetailsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

WeatherDetails _$WeatherDetailsFromJson(Map<String, dynamic> json) {
  return _WeatherDetails.fromJson(json);
}

/// @nodoc
mixin _$WeatherDetails {
  @JsonKey(name: 'symbol_code')
  String get symbolCode => throw _privateConstructorUsedError;

  /// Serializes this WeatherDetails to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WeatherDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeatherDetailsCopyWith<WeatherDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherDetailsCopyWith<$Res> {
  factory $WeatherDetailsCopyWith(
          WeatherDetails value, $Res Function(WeatherDetails) then) =
      _$WeatherDetailsCopyWithImpl<$Res, WeatherDetails>;
  @useResult
  $Res call({@JsonKey(name: 'symbol_code') String symbolCode});
}

/// @nodoc
class _$WeatherDetailsCopyWithImpl<$Res, $Val extends WeatherDetails>
    implements $WeatherDetailsCopyWith<$Res> {
  _$WeatherDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WeatherDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? symbolCode = null,
  }) {
    return _then(_value.copyWith(
      symbolCode: null == symbolCode
          ? _value.symbolCode
          : symbolCode // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeatherDetailsImplCopyWith<$Res>
    implements $WeatherDetailsCopyWith<$Res> {
  factory _$$WeatherDetailsImplCopyWith(_$WeatherDetailsImpl value,
          $Res Function(_$WeatherDetailsImpl) then) =
      __$$WeatherDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'symbol_code') String symbolCode});
}

/// @nodoc
class __$$WeatherDetailsImplCopyWithImpl<$Res>
    extends _$WeatherDetailsCopyWithImpl<$Res, _$WeatherDetailsImpl>
    implements _$$WeatherDetailsImplCopyWith<$Res> {
  __$$WeatherDetailsImplCopyWithImpl(
      _$WeatherDetailsImpl _value, $Res Function(_$WeatherDetailsImpl) _then)
      : super(_value, _then);

  /// Create a copy of WeatherDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? symbolCode = null,
  }) {
    return _then(_$WeatherDetailsImpl(
      symbolCode: null == symbolCode
          ? _value.symbolCode
          : symbolCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeatherDetailsImpl extends _WeatherDetails {
  const _$WeatherDetailsImpl(
      {@JsonKey(name: 'symbol_code') required this.symbolCode})
      : super._();

  factory _$WeatherDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeatherDetailsImplFromJson(json);

  @override
  @JsonKey(name: 'symbol_code')
  final String symbolCode;

  @override
  String toString() {
    return 'WeatherDetails(symbolCode: $symbolCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherDetailsImpl &&
            (identical(other.symbolCode, symbolCode) ||
                other.symbolCode == symbolCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, symbolCode);

  /// Create a copy of WeatherDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherDetailsImplCopyWith<_$WeatherDetailsImpl> get copyWith =>
      __$$WeatherDetailsImplCopyWithImpl<_$WeatherDetailsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeatherDetailsImplToJson(
      this,
    );
  }
}

abstract class _WeatherDetails extends WeatherDetails {
  const factory _WeatherDetails(
          {@JsonKey(name: 'symbol_code') required final String symbolCode}) =
      _$WeatherDetailsImpl;
  const _WeatherDetails._() : super._();

  factory _WeatherDetails.fromJson(Map<String, dynamic> json) =
      _$WeatherDetailsImpl.fromJson;

  @override
  @JsonKey(name: 'symbol_code')
  String get symbolCode;

  /// Create a copy of WeatherDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeatherDetailsImplCopyWith<_$WeatherDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WeatherSummary _$WeatherSummaryFromJson(Map<String, dynamic> json) {
  return _WeatherSummary.fromJson(json);
}

/// @nodoc
mixin _$WeatherSummary {
  @JsonKey(name: 'symbol_code')
  String get symbolCode => throw _privateConstructorUsedError;

  /// Serializes this WeatherSummary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WeatherSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeatherSummaryCopyWith<WeatherSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherSummaryCopyWith<$Res> {
  factory $WeatherSummaryCopyWith(
          WeatherSummary value, $Res Function(WeatherSummary) then) =
      _$WeatherSummaryCopyWithImpl<$Res, WeatherSummary>;
  @useResult
  $Res call({@JsonKey(name: 'symbol_code') String symbolCode});
}

/// @nodoc
class _$WeatherSummaryCopyWithImpl<$Res, $Val extends WeatherSummary>
    implements $WeatherSummaryCopyWith<$Res> {
  _$WeatherSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WeatherSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? symbolCode = null,
  }) {
    return _then(_value.copyWith(
      symbolCode: null == symbolCode
          ? _value.symbolCode
          : symbolCode // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeatherSummaryImplCopyWith<$Res>
    implements $WeatherSummaryCopyWith<$Res> {
  factory _$$WeatherSummaryImplCopyWith(_$WeatherSummaryImpl value,
          $Res Function(_$WeatherSummaryImpl) then) =
      __$$WeatherSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'symbol_code') String symbolCode});
}

/// @nodoc
class __$$WeatherSummaryImplCopyWithImpl<$Res>
    extends _$WeatherSummaryCopyWithImpl<$Res, _$WeatherSummaryImpl>
    implements _$$WeatherSummaryImplCopyWith<$Res> {
  __$$WeatherSummaryImplCopyWithImpl(
      _$WeatherSummaryImpl _value, $Res Function(_$WeatherSummaryImpl) _then)
      : super(_value, _then);

  /// Create a copy of WeatherSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? symbolCode = null,
  }) {
    return _then(_$WeatherSummaryImpl(
      symbolCode: null == symbolCode
          ? _value.symbolCode
          : symbolCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeatherSummaryImpl extends _WeatherSummary {
  const _$WeatherSummaryImpl(
      {@JsonKey(name: 'symbol_code') required this.symbolCode})
      : super._();

  factory _$WeatherSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeatherSummaryImplFromJson(json);

  @override
  @JsonKey(name: 'symbol_code')
  final String symbolCode;

  @override
  String toString() {
    return 'WeatherSummary(symbolCode: $symbolCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherSummaryImpl &&
            (identical(other.symbolCode, symbolCode) ||
                other.symbolCode == symbolCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, symbolCode);

  /// Create a copy of WeatherSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherSummaryImplCopyWith<_$WeatherSummaryImpl> get copyWith =>
      __$$WeatherSummaryImplCopyWithImpl<_$WeatherSummaryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeatherSummaryImplToJson(
      this,
    );
  }
}

abstract class _WeatherSummary extends WeatherSummary {
  const factory _WeatherSummary(
          {@JsonKey(name: 'symbol_code') required final String symbolCode}) =
      _$WeatherSummaryImpl;
  const _WeatherSummary._() : super._();

  factory _WeatherSummary.fromJson(Map<String, dynamic> json) =
      _$WeatherSummaryImpl.fromJson;

  @override
  @JsonKey(name: 'symbol_code')
  String get symbolCode;

  /// Create a copy of WeatherSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeatherSummaryImplCopyWith<_$WeatherSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WeatherProperties _$WeatherPropertiesFromJson(Map<String, dynamic> json) {
  return _WeatherProperties.fromJson(json);
}

/// @nodoc
mixin _$WeatherProperties {
  @JsonKey(name: 'meta')
  WeatherMeta get meta => throw _privateConstructorUsedError;
  @JsonKey(name: 'timeseries')
  List<WeatherTimeStep> get timeseries => throw _privateConstructorUsedError;

  /// Serializes this WeatherProperties to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WeatherProperties
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeatherPropertiesCopyWith<WeatherProperties> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherPropertiesCopyWith<$Res> {
  factory $WeatherPropertiesCopyWith(
          WeatherProperties value, $Res Function(WeatherProperties) then) =
      _$WeatherPropertiesCopyWithImpl<$Res, WeatherProperties>;
  @useResult
  $Res call(
      {@JsonKey(name: 'meta') WeatherMeta meta,
      @JsonKey(name: 'timeseries') List<WeatherTimeStep> timeseries});

  $WeatherMetaCopyWith<$Res> get meta;
}

/// @nodoc
class _$WeatherPropertiesCopyWithImpl<$Res, $Val extends WeatherProperties>
    implements $WeatherPropertiesCopyWith<$Res> {
  _$WeatherPropertiesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WeatherProperties
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meta = null,
    Object? timeseries = null,
  }) {
    return _then(_value.copyWith(
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as WeatherMeta,
      timeseries: null == timeseries
          ? _value.timeseries
          : timeseries // ignore: cast_nullable_to_non_nullable
              as List<WeatherTimeStep>,
    ) as $Val);
  }

  /// Create a copy of WeatherProperties
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WeatherMetaCopyWith<$Res> get meta {
    return $WeatherMetaCopyWith<$Res>(_value.meta, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WeatherPropertiesImplCopyWith<$Res>
    implements $WeatherPropertiesCopyWith<$Res> {
  factory _$$WeatherPropertiesImplCopyWith(_$WeatherPropertiesImpl value,
          $Res Function(_$WeatherPropertiesImpl) then) =
      __$$WeatherPropertiesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'meta') WeatherMeta meta,
      @JsonKey(name: 'timeseries') List<WeatherTimeStep> timeseries});

  @override
  $WeatherMetaCopyWith<$Res> get meta;
}

/// @nodoc
class __$$WeatherPropertiesImplCopyWithImpl<$Res>
    extends _$WeatherPropertiesCopyWithImpl<$Res, _$WeatherPropertiesImpl>
    implements _$$WeatherPropertiesImplCopyWith<$Res> {
  __$$WeatherPropertiesImplCopyWithImpl(_$WeatherPropertiesImpl _value,
      $Res Function(_$WeatherPropertiesImpl) _then)
      : super(_value, _then);

  /// Create a copy of WeatherProperties
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meta = null,
    Object? timeseries = null,
  }) {
    return _then(_$WeatherPropertiesImpl(
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as WeatherMeta,
      timeseries: null == timeseries
          ? _value._timeseries
          : timeseries // ignore: cast_nullable_to_non_nullable
              as List<WeatherTimeStep>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeatherPropertiesImpl extends _WeatherProperties {
  const _$WeatherPropertiesImpl(
      {@JsonKey(name: 'meta') required this.meta,
      @JsonKey(name: 'timeseries')
      required final List<WeatherTimeStep> timeseries})
      : _timeseries = timeseries,
        super._();

  factory _$WeatherPropertiesImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeatherPropertiesImplFromJson(json);

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

  @override
  String toString() {
    return 'WeatherProperties(meta: $meta, timeseries: $timeseries)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherPropertiesImpl &&
            (identical(other.meta, meta) || other.meta == meta) &&
            const DeepCollectionEquality()
                .equals(other._timeseries, _timeseries));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, meta, const DeepCollectionEquality().hash(_timeseries));

  /// Create a copy of WeatherProperties
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherPropertiesImplCopyWith<_$WeatherPropertiesImpl> get copyWith =>
      __$$WeatherPropertiesImplCopyWithImpl<_$WeatherPropertiesImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeatherPropertiesImplToJson(
      this,
    );
  }
}

abstract class _WeatherProperties extends WeatherProperties {
  const factory _WeatherProperties(
          {@JsonKey(name: 'meta') required final WeatherMeta meta,
          @JsonKey(name: 'timeseries')
          required final List<WeatherTimeStep> timeseries}) =
      _$WeatherPropertiesImpl;
  const _WeatherProperties._() : super._();

  factory _WeatherProperties.fromJson(Map<String, dynamic> json) =
      _$WeatherPropertiesImpl.fromJson;

  @override
  @JsonKey(name: 'meta')
  WeatherMeta get meta;
  @override
  @JsonKey(name: 'timeseries')
  List<WeatherTimeStep> get timeseries;

  /// Create a copy of WeatherProperties
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeatherPropertiesImplCopyWith<_$WeatherPropertiesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WeatherMeta _$WeatherMetaFromJson(Map<String, dynamic> json) {
  return _WeatherMeta.fromJson(json);
}

/// @nodoc
mixin _$WeatherMeta {
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'units')
  WeatherUnits get units => throw _privateConstructorUsedError;

  /// Serializes this WeatherMeta to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WeatherMeta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeatherMetaCopyWith<WeatherMeta> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherMetaCopyWith<$Res> {
  factory $WeatherMetaCopyWith(
          WeatherMeta value, $Res Function(WeatherMeta) then) =
      _$WeatherMetaCopyWithImpl<$Res, WeatherMeta>;
  @useResult
  $Res call(
      {@JsonKey(name: 'updated_at') DateTime updatedAt,
      @JsonKey(name: 'units') WeatherUnits units});

  $WeatherUnitsCopyWith<$Res> get units;
}

/// @nodoc
class _$WeatherMetaCopyWithImpl<$Res, $Val extends WeatherMeta>
    implements $WeatherMetaCopyWith<$Res> {
  _$WeatherMetaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WeatherMeta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? updatedAt = null,
    Object? units = null,
  }) {
    return _then(_value.copyWith(
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      units: null == units
          ? _value.units
          : units // ignore: cast_nullable_to_non_nullable
              as WeatherUnits,
    ) as $Val);
  }

  /// Create a copy of WeatherMeta
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WeatherUnitsCopyWith<$Res> get units {
    return $WeatherUnitsCopyWith<$Res>(_value.units, (value) {
      return _then(_value.copyWith(units: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WeatherMetaImplCopyWith<$Res>
    implements $WeatherMetaCopyWith<$Res> {
  factory _$$WeatherMetaImplCopyWith(
          _$WeatherMetaImpl value, $Res Function(_$WeatherMetaImpl) then) =
      __$$WeatherMetaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'updated_at') DateTime updatedAt,
      @JsonKey(name: 'units') WeatherUnits units});

  @override
  $WeatherUnitsCopyWith<$Res> get units;
}

/// @nodoc
class __$$WeatherMetaImplCopyWithImpl<$Res>
    extends _$WeatherMetaCopyWithImpl<$Res, _$WeatherMetaImpl>
    implements _$$WeatherMetaImplCopyWith<$Res> {
  __$$WeatherMetaImplCopyWithImpl(
      _$WeatherMetaImpl _value, $Res Function(_$WeatherMetaImpl) _then)
      : super(_value, _then);

  /// Create a copy of WeatherMeta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? updatedAt = null,
    Object? units = null,
  }) {
    return _then(_$WeatherMetaImpl(
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      units: null == units
          ? _value.units
          : units // ignore: cast_nullable_to_non_nullable
              as WeatherUnits,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeatherMetaImpl extends _WeatherMeta {
  const _$WeatherMetaImpl(
      {@JsonKey(name: 'updated_at') required this.updatedAt,
      @JsonKey(name: 'units') required this.units})
      : super._();

  factory _$WeatherMetaImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeatherMetaImplFromJson(json);

  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;
  @override
  @JsonKey(name: 'units')
  final WeatherUnits units;

  @override
  String toString() {
    return 'WeatherMeta(updatedAt: $updatedAt, units: $units)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherMetaImpl &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.units, units) || other.units == units));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, updatedAt, units);

  /// Create a copy of WeatherMeta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherMetaImplCopyWith<_$WeatherMetaImpl> get copyWith =>
      __$$WeatherMetaImplCopyWithImpl<_$WeatherMetaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeatherMetaImplToJson(
      this,
    );
  }
}

abstract class _WeatherMeta extends WeatherMeta {
  const factory _WeatherMeta(
          {@JsonKey(name: 'updated_at') required final DateTime updatedAt,
          @JsonKey(name: 'units') required final WeatherUnits units}) =
      _$WeatherMetaImpl;
  const _WeatherMeta._() : super._();

  factory _WeatherMeta.fromJson(Map<String, dynamic> json) =
      _$WeatherMetaImpl.fromJson;

  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;
  @override
  @JsonKey(name: 'units')
  WeatherUnits get units;

  /// Create a copy of WeatherMeta
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeatherMetaImplCopyWith<_$WeatherMetaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WeatherUnits _$WeatherUnitsFromJson(Map<String, dynamic> json) {
  return _WeatherUnits.fromJson(json);
}

/// @nodoc
mixin _$WeatherUnits {
  @JsonKey(name: 'air_pressure_at_sea_level')
  String? get airPressureAtSeaLevel => throw _privateConstructorUsedError;
  @JsonKey(name: 'air_temperature')
  String? get airTemperature => throw _privateConstructorUsedError;
  @JsonKey(name: 'cloud_area_fraction')
  String? get cloudAreaFraction => throw _privateConstructorUsedError;
  @JsonKey(name: 'precipitation_amount')
  String? get precipitationAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'relative_humidity')
  String? get relativeHumidity => throw _privateConstructorUsedError;
  @JsonKey(name: 'wind_from_direction')
  String? get windFromDirection => throw _privateConstructorUsedError;
  @JsonKey(name: 'wind_speed')
  String? get windSpeed => throw _privateConstructorUsedError;
  @JsonKey(name: 'wind_speed_of_gust')
  String? get windSpeedOfGust => throw _privateConstructorUsedError;
  @JsonKey(name: 'light_luminance')
  String? get lightLuminance => throw _privateConstructorUsedError;
  @JsonKey(name: 'ultraviolet_radiation')
  String? get ultravioletRadiation => throw _privateConstructorUsedError;

  /// Serializes this WeatherUnits to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WeatherUnits
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeatherUnitsCopyWith<WeatherUnits> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherUnitsCopyWith<$Res> {
  factory $WeatherUnitsCopyWith(
          WeatherUnits value, $Res Function(WeatherUnits) then) =
      _$WeatherUnitsCopyWithImpl<$Res, WeatherUnits>;
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
class _$WeatherUnitsCopyWithImpl<$Res, $Val extends WeatherUnits>
    implements $WeatherUnitsCopyWith<$Res> {
  _$WeatherUnitsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      airPressureAtSeaLevel: freezed == airPressureAtSeaLevel
          ? _value.airPressureAtSeaLevel
          : airPressureAtSeaLevel // ignore: cast_nullable_to_non_nullable
              as String?,
      airTemperature: freezed == airTemperature
          ? _value.airTemperature
          : airTemperature // ignore: cast_nullable_to_non_nullable
              as String?,
      cloudAreaFraction: freezed == cloudAreaFraction
          ? _value.cloudAreaFraction
          : cloudAreaFraction // ignore: cast_nullable_to_non_nullable
              as String?,
      precipitationAmount: freezed == precipitationAmount
          ? _value.precipitationAmount
          : precipitationAmount // ignore: cast_nullable_to_non_nullable
              as String?,
      relativeHumidity: freezed == relativeHumidity
          ? _value.relativeHumidity
          : relativeHumidity // ignore: cast_nullable_to_non_nullable
              as String?,
      windFromDirection: freezed == windFromDirection
          ? _value.windFromDirection
          : windFromDirection // ignore: cast_nullable_to_non_nullable
              as String?,
      windSpeed: freezed == windSpeed
          ? _value.windSpeed
          : windSpeed // ignore: cast_nullable_to_non_nullable
              as String?,
      windSpeedOfGust: freezed == windSpeedOfGust
          ? _value.windSpeedOfGust
          : windSpeedOfGust // ignore: cast_nullable_to_non_nullable
              as String?,
      lightLuminance: freezed == lightLuminance
          ? _value.lightLuminance
          : lightLuminance // ignore: cast_nullable_to_non_nullable
              as String?,
      ultravioletRadiation: freezed == ultravioletRadiation
          ? _value.ultravioletRadiation
          : ultravioletRadiation // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeatherUnitsImplCopyWith<$Res>
    implements $WeatherUnitsCopyWith<$Res> {
  factory _$$WeatherUnitsImplCopyWith(
          _$WeatherUnitsImpl value, $Res Function(_$WeatherUnitsImpl) then) =
      __$$WeatherUnitsImplCopyWithImpl<$Res>;
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
class __$$WeatherUnitsImplCopyWithImpl<$Res>
    extends _$WeatherUnitsCopyWithImpl<$Res, _$WeatherUnitsImpl>
    implements _$$WeatherUnitsImplCopyWith<$Res> {
  __$$WeatherUnitsImplCopyWithImpl(
      _$WeatherUnitsImpl _value, $Res Function(_$WeatherUnitsImpl) _then)
      : super(_value, _then);

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
    return _then(_$WeatherUnitsImpl(
      airPressureAtSeaLevel: freezed == airPressureAtSeaLevel
          ? _value.airPressureAtSeaLevel
          : airPressureAtSeaLevel // ignore: cast_nullable_to_non_nullable
              as String?,
      airTemperature: freezed == airTemperature
          ? _value.airTemperature
          : airTemperature // ignore: cast_nullable_to_non_nullable
              as String?,
      cloudAreaFraction: freezed == cloudAreaFraction
          ? _value.cloudAreaFraction
          : cloudAreaFraction // ignore: cast_nullable_to_non_nullable
              as String?,
      precipitationAmount: freezed == precipitationAmount
          ? _value.precipitationAmount
          : precipitationAmount // ignore: cast_nullable_to_non_nullable
              as String?,
      relativeHumidity: freezed == relativeHumidity
          ? _value.relativeHumidity
          : relativeHumidity // ignore: cast_nullable_to_non_nullable
              as String?,
      windFromDirection: freezed == windFromDirection
          ? _value.windFromDirection
          : windFromDirection // ignore: cast_nullable_to_non_nullable
              as String?,
      windSpeed: freezed == windSpeed
          ? _value.windSpeed
          : windSpeed // ignore: cast_nullable_to_non_nullable
              as String?,
      windSpeedOfGust: freezed == windSpeedOfGust
          ? _value.windSpeedOfGust
          : windSpeedOfGust // ignore: cast_nullable_to_non_nullable
              as String?,
      lightLuminance: freezed == lightLuminance
          ? _value.lightLuminance
          : lightLuminance // ignore: cast_nullable_to_non_nullable
              as String?,
      ultravioletRadiation: freezed == ultravioletRadiation
          ? _value.ultravioletRadiation
          : ultravioletRadiation // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeatherUnitsImpl extends _WeatherUnits {
  const _$WeatherUnitsImpl(
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

  factory _$WeatherUnitsImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeatherUnitsImplFromJson(json);

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

  @override
  String toString() {
    return 'WeatherUnits(airPressureAtSeaLevel: $airPressureAtSeaLevel, airTemperature: $airTemperature, cloudAreaFraction: $cloudAreaFraction, precipitationAmount: $precipitationAmount, relativeHumidity: $relativeHumidity, windFromDirection: $windFromDirection, windSpeed: $windSpeed, windSpeedOfGust: $windSpeedOfGust, lightLuminance: $lightLuminance, ultravioletRadiation: $ultravioletRadiation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherUnitsImpl &&
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

  /// Create a copy of WeatherUnits
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherUnitsImplCopyWith<_$WeatherUnitsImpl> get copyWith =>
      __$$WeatherUnitsImplCopyWithImpl<_$WeatherUnitsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeatherUnitsImplToJson(
      this,
    );
  }
}

abstract class _WeatherUnits extends WeatherUnits {
  const factory _WeatherUnits(
      {@JsonKey(name: 'air_pressure_at_sea_level')
      final String? airPressureAtSeaLevel,
      @JsonKey(name: 'air_temperature') final String? airTemperature,
      @JsonKey(name: 'cloud_area_fraction') final String? cloudAreaFraction,
      @JsonKey(name: 'precipitation_amount') final String? precipitationAmount,
      @JsonKey(name: 'relative_humidity') final String? relativeHumidity,
      @JsonKey(name: 'wind_from_direction') final String? windFromDirection,
      @JsonKey(name: 'wind_speed') final String? windSpeed,
      @JsonKey(name: 'wind_speed_of_gust') final String? windSpeedOfGust,
      @JsonKey(name: 'light_luminance') final String? lightLuminance,
      @JsonKey(name: 'ultraviolet_radiation')
      final String? ultravioletRadiation}) = _$WeatherUnitsImpl;
  const _WeatherUnits._() : super._();

  factory _WeatherUnits.fromJson(Map<String, dynamic> json) =
      _$WeatherUnitsImpl.fromJson;

  @override
  @JsonKey(name: 'air_pressure_at_sea_level')
  String? get airPressureAtSeaLevel;
  @override
  @JsonKey(name: 'air_temperature')
  String? get airTemperature;
  @override
  @JsonKey(name: 'cloud_area_fraction')
  String? get cloudAreaFraction;
  @override
  @JsonKey(name: 'precipitation_amount')
  String? get precipitationAmount;
  @override
  @JsonKey(name: 'relative_humidity')
  String? get relativeHumidity;
  @override
  @JsonKey(name: 'wind_from_direction')
  String? get windFromDirection;
  @override
  @JsonKey(name: 'wind_speed')
  String? get windSpeed;
  @override
  @JsonKey(name: 'wind_speed_of_gust')
  String? get windSpeedOfGust;
  @override
  @JsonKey(name: 'light_luminance')
  String? get lightLuminance;
  @override
  @JsonKey(name: 'ultraviolet_radiation')
  String? get ultravioletRadiation;

  /// Create a copy of WeatherUnits
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeatherUnitsImplCopyWith<_$WeatherUnitsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
