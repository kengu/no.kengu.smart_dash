// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'time_series.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TimeSeries _$TimeSeriesFromJson(Map<String, dynamic> json) {
  return _TimeSeries.fromJson(json);
}

/// @nodoc
mixin _$TimeSeries {
  /// Get the time series's name
  String get name => throw _privateConstructorUsedError;

  /// Get the time series's data array
  DataArray get array => throw _privateConstructorUsedError;

  /// Get the time series's [DateTime] offset from epoch
  DateTime get offset => throw _privateConstructorUsedError;

  /// Get duration between each coordinate
  Duration get span => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TimeSeriesCopyWith<TimeSeries> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimeSeriesCopyWith<$Res> {
  factory $TimeSeriesCopyWith(
          TimeSeries value, $Res Function(TimeSeries) then) =
      _$TimeSeriesCopyWithImpl<$Res, TimeSeries>;
  @useResult
  $Res call({String name, DataArray array, DateTime offset, Duration span});

  $DataArrayCopyWith<$Res> get array;
}

/// @nodoc
class _$TimeSeriesCopyWithImpl<$Res, $Val extends TimeSeries>
    implements $TimeSeriesCopyWith<$Res> {
  _$TimeSeriesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? array = null,
    Object? offset = null,
    Object? span = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      array: null == array
          ? _value.array
          : array // ignore: cast_nullable_to_non_nullable
              as DataArray,
      offset: null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as DateTime,
      span: null == span
          ? _value.span
          : span // ignore: cast_nullable_to_non_nullable
              as Duration,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DataArrayCopyWith<$Res> get array {
    return $DataArrayCopyWith<$Res>(_value.array, (value) {
      return _then(_value.copyWith(array: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TimeSeriesImplCopyWith<$Res>
    implements $TimeSeriesCopyWith<$Res> {
  factory _$$TimeSeriesImplCopyWith(
          _$TimeSeriesImpl value, $Res Function(_$TimeSeriesImpl) then) =
      __$$TimeSeriesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, DataArray array, DateTime offset, Duration span});

  @override
  $DataArrayCopyWith<$Res> get array;
}

/// @nodoc
class __$$TimeSeriesImplCopyWithImpl<$Res>
    extends _$TimeSeriesCopyWithImpl<$Res, _$TimeSeriesImpl>
    implements _$$TimeSeriesImplCopyWith<$Res> {
  __$$TimeSeriesImplCopyWithImpl(
      _$TimeSeriesImpl _value, $Res Function(_$TimeSeriesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? array = null,
    Object? offset = null,
    Object? span = null,
  }) {
    return _then(_$TimeSeriesImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      array: null == array
          ? _value.array
          : array // ignore: cast_nullable_to_non_nullable
              as DataArray,
      offset: null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as DateTime,
      span: null == span
          ? _value.span
          : span // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TimeSeriesImpl extends _TimeSeries {
  const _$TimeSeriesImpl(
      {required this.name,
      required this.array,
      required this.offset,
      required this.span})
      : super._();

  factory _$TimeSeriesImpl.fromJson(Map<String, dynamic> json) =>
      _$$TimeSeriesImplFromJson(json);

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

  @override
  String toString() {
    return 'TimeSeries(name: $name, array: $array, offset: $offset, span: $span)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimeSeriesImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.array, array) || other.array == array) &&
            (identical(other.offset, offset) || other.offset == offset) &&
            (identical(other.span, span) || other.span == span));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, array, offset, span);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TimeSeriesImplCopyWith<_$TimeSeriesImpl> get copyWith =>
      __$$TimeSeriesImplCopyWithImpl<_$TimeSeriesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TimeSeriesImplToJson(
      this,
    );
  }
}

abstract class _TimeSeries extends TimeSeries {
  const factory _TimeSeries(
      {required final String name,
      required final DataArray array,
      required final DateTime offset,
      required final Duration span}) = _$TimeSeriesImpl;
  const _TimeSeries._() : super._();

  factory _TimeSeries.fromJson(Map<String, dynamic> json) =
      _$TimeSeriesImpl.fromJson;

  @override

  /// Get the time series's name
  String get name;
  @override

  /// Get the time series's data array
  DataArray get array;
  @override

  /// Get the time series's [DateTime] offset from epoch
  DateTime get offset;
  @override

  /// Get duration between each coordinate
  Duration get span;
  @override
  @JsonKey(ignore: true)
  _$$TimeSeriesImplCopyWith<_$TimeSeriesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
