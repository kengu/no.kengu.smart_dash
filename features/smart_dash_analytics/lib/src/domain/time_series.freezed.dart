// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'time_series.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TimeSeries {
  /// Get the time series's name
  String get name;

  /// Get the time series's data array
  DataArray get array;

  /// Get the time series's [DateTime] offset from epoch
  DateTime get offset;

  /// Get duration between each coordinate
  Duration get span;

  /// Create a copy of TimeSeries
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TimeSeriesCopyWith<TimeSeries> get copyWith =>
      _$TimeSeriesCopyWithImpl<TimeSeries>(this as TimeSeries, _$identity);

  /// Serializes this TimeSeries to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TimeSeries &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.array, array) || other.array == array) &&
            (identical(other.offset, offset) || other.offset == offset) &&
            (identical(other.span, span) || other.span == span));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, array, offset, span);

  @override
  String toString() {
    return 'TimeSeries(name: $name, array: $array, offset: $offset, span: $span)';
  }
}

/// @nodoc
abstract mixin class $TimeSeriesCopyWith<$Res> {
  factory $TimeSeriesCopyWith(
          TimeSeries value, $Res Function(TimeSeries) _then) =
      _$TimeSeriesCopyWithImpl;
  @useResult
  $Res call({String name, DataArray array, DateTime offset, Duration span});

  $DataArrayCopyWith<$Res> get array;
}

/// @nodoc
class _$TimeSeriesCopyWithImpl<$Res> implements $TimeSeriesCopyWith<$Res> {
  _$TimeSeriesCopyWithImpl(this._self, this._then);

  final TimeSeries _self;
  final $Res Function(TimeSeries) _then;

  /// Create a copy of TimeSeries
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? array = null,
    Object? offset = null,
    Object? span = null,
  }) {
    return _then(_self.copyWith(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      array: null == array
          ? _self.array
          : array // ignore: cast_nullable_to_non_nullable
              as DataArray,
      offset: null == offset
          ? _self.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as DateTime,
      span: null == span
          ? _self.span
          : span // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }

  /// Create a copy of TimeSeries
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DataArrayCopyWith<$Res> get array {
    return $DataArrayCopyWith<$Res>(_self.array, (value) {
      return _then(_self.copyWith(array: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _TimeSeries extends TimeSeries {
  const _TimeSeries(
      {required this.name,
      required this.array,
      required this.offset,
      required this.span})
      : super._();
  factory _TimeSeries.fromJson(Map<String, dynamic> json) =>
      _$TimeSeriesFromJson(json);

  /// Get the time series's name
  @override
  final String name;

  /// Get the time series's data array
  @override
  final DataArray array;

  /// Get the time series's [DateTime] offset from epoch
  @override
  final DateTime offset;

  /// Get duration between each coordinate
  @override
  final Duration span;

  /// Create a copy of TimeSeries
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TimeSeriesCopyWith<_TimeSeries> get copyWith =>
      __$TimeSeriesCopyWithImpl<_TimeSeries>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TimeSeriesToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TimeSeries &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.array, array) || other.array == array) &&
            (identical(other.offset, offset) || other.offset == offset) &&
            (identical(other.span, span) || other.span == span));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, array, offset, span);

  @override
  String toString() {
    return 'TimeSeries(name: $name, array: $array, offset: $offset, span: $span)';
  }
}

/// @nodoc
abstract mixin class _$TimeSeriesCopyWith<$Res>
    implements $TimeSeriesCopyWith<$Res> {
  factory _$TimeSeriesCopyWith(
          _TimeSeries value, $Res Function(_TimeSeries) _then) =
      __$TimeSeriesCopyWithImpl;
  @override
  @useResult
  $Res call({String name, DataArray array, DateTime offset, Duration span});

  @override
  $DataArrayCopyWith<$Res> get array;
}

/// @nodoc
class __$TimeSeriesCopyWithImpl<$Res> implements _$TimeSeriesCopyWith<$Res> {
  __$TimeSeriesCopyWithImpl(this._self, this._then);

  final _TimeSeries _self;
  final $Res Function(_TimeSeries) _then;

  /// Create a copy of TimeSeries
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? array = null,
    Object? offset = null,
    Object? span = null,
  }) {
    return _then(_TimeSeries(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      array: null == array
          ? _self.array
          : array // ignore: cast_nullable_to_non_nullable
              as DataArray,
      offset: null == offset
          ? _self.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as DateTime,
      span: null == span
          ? _self.span
          : span // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }

  /// Create a copy of TimeSeries
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DataArrayCopyWith<$Res> get array {
    return $DataArrayCopyWith<$Res>(_self.array, (value) {
      return _then(_self.copyWith(array: value));
    });
  }
}

// dart format on
