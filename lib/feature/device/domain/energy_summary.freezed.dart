// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'energy_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EnergySummary _$EnergySummaryFromJson(Map<String, dynamic> json) {
  return _EnergySummary.fromJson(json);
}

/// @nodoc
mixin _$EnergySummary {
  /// Last measured power usage (watt)
  int get currentPower => throw _privateConstructorUsedError;

  /// Energy accumulated from start (in watt/h)
  int get cumulative => throw _privateConstructorUsedError;

  /// Energy accumulated from midnight (in watt/h)
  int get cumulativeToday => throw _privateConstructorUsedError;

  /// [DateTime] timestamp of when data was updated last
  DateTime get lastUpdated => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EnergySummaryCopyWith<EnergySummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EnergySummaryCopyWith<$Res> {
  factory $EnergySummaryCopyWith(
          EnergySummary value, $Res Function(EnergySummary) then) =
      _$EnergySummaryCopyWithImpl<$Res, EnergySummary>;
  @useResult
  $Res call(
      {int currentPower,
      int cumulative,
      int cumulativeToday,
      DateTime lastUpdated});
}

/// @nodoc
class _$EnergySummaryCopyWithImpl<$Res, $Val extends EnergySummary>
    implements $EnergySummaryCopyWith<$Res> {
  _$EnergySummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPower = null,
    Object? cumulative = null,
    Object? cumulativeToday = null,
    Object? lastUpdated = null,
  }) {
    return _then(_value.copyWith(
      currentPower: null == currentPower
          ? _value.currentPower
          : currentPower // ignore: cast_nullable_to_non_nullable
              as int,
      cumulative: null == cumulative
          ? _value.cumulative
          : cumulative // ignore: cast_nullable_to_non_nullable
              as int,
      cumulativeToday: null == cumulativeToday
          ? _value.cumulativeToday
          : cumulativeToday // ignore: cast_nullable_to_non_nullable
              as int,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EnergySummaryImplCopyWith<$Res>
    implements $EnergySummaryCopyWith<$Res> {
  factory _$$EnergySummaryImplCopyWith(
          _$EnergySummaryImpl value, $Res Function(_$EnergySummaryImpl) then) =
      __$$EnergySummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int currentPower,
      int cumulative,
      int cumulativeToday,
      DateTime lastUpdated});
}

/// @nodoc
class __$$EnergySummaryImplCopyWithImpl<$Res>
    extends _$EnergySummaryCopyWithImpl<$Res, _$EnergySummaryImpl>
    implements _$$EnergySummaryImplCopyWith<$Res> {
  __$$EnergySummaryImplCopyWithImpl(
      _$EnergySummaryImpl _value, $Res Function(_$EnergySummaryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPower = null,
    Object? cumulative = null,
    Object? cumulativeToday = null,
    Object? lastUpdated = null,
  }) {
    return _then(_$EnergySummaryImpl(
      currentPower: null == currentPower
          ? _value.currentPower
          : currentPower // ignore: cast_nullable_to_non_nullable
              as int,
      cumulative: null == cumulative
          ? _value.cumulative
          : cumulative // ignore: cast_nullable_to_non_nullable
              as int,
      cumulativeToday: null == cumulativeToday
          ? _value.cumulativeToday
          : cumulativeToday // ignore: cast_nullable_to_non_nullable
              as int,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EnergySummaryImpl implements _EnergySummary {
  const _$EnergySummaryImpl(
      {required this.currentPower,
      required this.cumulative,
      required this.cumulativeToday,
      required this.lastUpdated});

  factory _$EnergySummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$EnergySummaryImplFromJson(json);

  /// Last measured power usage (watt)
  @override
  final int currentPower;

  /// Energy accumulated from start (in watt/h)
  @override
  final int cumulative;

  /// Energy accumulated from midnight (in watt/h)
  @override
  final int cumulativeToday;

  /// [DateTime] timestamp of when data was updated last
  @override
  final DateTime lastUpdated;

  @override
  String toString() {
    return 'EnergySummary(currentPower: $currentPower, cumulative: $cumulative, cumulativeToday: $cumulativeToday, lastUpdated: $lastUpdated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EnergySummaryImpl &&
            (identical(other.currentPower, currentPower) ||
                other.currentPower == currentPower) &&
            (identical(other.cumulative, cumulative) ||
                other.cumulative == cumulative) &&
            (identical(other.cumulativeToday, cumulativeToday) ||
                other.cumulativeToday == cumulativeToday) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, currentPower, cumulative, cumulativeToday, lastUpdated);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EnergySummaryImplCopyWith<_$EnergySummaryImpl> get copyWith =>
      __$$EnergySummaryImplCopyWithImpl<_$EnergySummaryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EnergySummaryImplToJson(
      this,
    );
  }
}

abstract class _EnergySummary implements EnergySummary {
  const factory _EnergySummary(
      {required final int currentPower,
      required final int cumulative,
      required final int cumulativeToday,
      required final DateTime lastUpdated}) = _$EnergySummaryImpl;

  factory _EnergySummary.fromJson(Map<String, dynamic> json) =
      _$EnergySummaryImpl.fromJson;

  @override

  /// Last measured power usage (watt)
  int get currentPower;
  @override

  /// Energy accumulated from start (in watt/h)
  int get cumulative;
  @override

  /// Energy accumulated from midnight (in watt/h)
  int get cumulativeToday;
  @override

  /// [DateTime] timestamp of when data was updated last
  DateTime get lastUpdated;
  @override
  @JsonKey(ignore: true)
  _$$EnergySummaryImplCopyWith<_$EnergySummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
