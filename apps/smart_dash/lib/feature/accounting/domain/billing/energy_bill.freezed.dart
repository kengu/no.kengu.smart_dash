// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'energy_bill.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EnergyBillMonth _$EnergyBillMonthFromJson(Map<String, dynamic> json) {
  return _EnergyBillMonth.fromJson(json);
}

/// @nodoc
mixin _$EnergyBillMonth {
  DateTime get begin => throw _privateConstructorUsedError;
  List<EnergyBillDay> get daily => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EnergyBillMonthCopyWith<EnergyBillMonth> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EnergyBillMonthCopyWith<$Res> {
  factory $EnergyBillMonthCopyWith(
          EnergyBillMonth value, $Res Function(EnergyBillMonth) then) =
      _$EnergyBillMonthCopyWithImpl<$Res, EnergyBillMonth>;
  @useResult
  $Res call({DateTime begin, List<EnergyBillDay> daily});
}

/// @nodoc
class _$EnergyBillMonthCopyWithImpl<$Res, $Val extends EnergyBillMonth>
    implements $EnergyBillMonthCopyWith<$Res> {
  _$EnergyBillMonthCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? begin = null,
    Object? daily = null,
  }) {
    return _then(_value.copyWith(
      begin: null == begin
          ? _value.begin
          : begin // ignore: cast_nullable_to_non_nullable
              as DateTime,
      daily: null == daily
          ? _value.daily
          : daily // ignore: cast_nullable_to_non_nullable
              as List<EnergyBillDay>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EnergyBillMonthImplCopyWith<$Res>
    implements $EnergyBillMonthCopyWith<$Res> {
  factory _$$EnergyBillMonthImplCopyWith(_$EnergyBillMonthImpl value,
          $Res Function(_$EnergyBillMonthImpl) then) =
      __$$EnergyBillMonthImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime begin, List<EnergyBillDay> daily});
}

/// @nodoc
class __$$EnergyBillMonthImplCopyWithImpl<$Res>
    extends _$EnergyBillMonthCopyWithImpl<$Res, _$EnergyBillMonthImpl>
    implements _$$EnergyBillMonthImplCopyWith<$Res> {
  __$$EnergyBillMonthImplCopyWithImpl(
      _$EnergyBillMonthImpl _value, $Res Function(_$EnergyBillMonthImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? begin = null,
    Object? daily = null,
  }) {
    return _then(_$EnergyBillMonthImpl(
      begin: null == begin
          ? _value.begin
          : begin // ignore: cast_nullable_to_non_nullable
              as DateTime,
      daily: null == daily
          ? _value._daily
          : daily // ignore: cast_nullable_to_non_nullable
              as List<EnergyBillDay>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EnergyBillMonthImpl extends _EnergyBillMonth {
  const _$EnergyBillMonthImpl(
      {required this.begin, required final List<EnergyBillDay> daily})
      : _daily = daily,
        super._();

  factory _$EnergyBillMonthImpl.fromJson(Map<String, dynamic> json) =>
      _$$EnergyBillMonthImplFromJson(json);

  @override
  final DateTime begin;
  final List<EnergyBillDay> _daily;
  @override
  List<EnergyBillDay> get daily {
    if (_daily is EqualUnmodifiableListView) return _daily;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_daily);
  }

  @override
  String toString() {
    return 'EnergyBillMonth(begin: $begin, daily: $daily)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EnergyBillMonthImpl &&
            (identical(other.begin, begin) || other.begin == begin) &&
            const DeepCollectionEquality().equals(other._daily, _daily));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, begin, const DeepCollectionEquality().hash(_daily));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EnergyBillMonthImplCopyWith<_$EnergyBillMonthImpl> get copyWith =>
      __$$EnergyBillMonthImplCopyWithImpl<_$EnergyBillMonthImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EnergyBillMonthImplToJson(
      this,
    );
  }
}

abstract class _EnergyBillMonth extends EnergyBillMonth {
  const factory _EnergyBillMonth(
      {required final DateTime begin,
      required final List<EnergyBillDay> daily}) = _$EnergyBillMonthImpl;
  const _EnergyBillMonth._() : super._();

  factory _EnergyBillMonth.fromJson(Map<String, dynamic> json) =
      _$EnergyBillMonthImpl.fromJson;

  @override
  DateTime get begin;
  @override
  List<EnergyBillDay> get daily;
  @override
  @JsonKey(ignore: true)
  _$$EnergyBillMonthImplCopyWith<_$EnergyBillMonthImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EnergyBillDay _$EnergyBillDayFromJson(Map<String, dynamic> json) {
  return _EnergyBillDay.fromJson(json);
}

/// @nodoc
mixin _$EnergyBillDay {
  DateTime get begin => throw _privateConstructorUsedError;
  List<EnergyBillHour> get hourly => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EnergyBillDayCopyWith<EnergyBillDay> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EnergyBillDayCopyWith<$Res> {
  factory $EnergyBillDayCopyWith(
          EnergyBillDay value, $Res Function(EnergyBillDay) then) =
      _$EnergyBillDayCopyWithImpl<$Res, EnergyBillDay>;
  @useResult
  $Res call({DateTime begin, List<EnergyBillHour> hourly});
}

/// @nodoc
class _$EnergyBillDayCopyWithImpl<$Res, $Val extends EnergyBillDay>
    implements $EnergyBillDayCopyWith<$Res> {
  _$EnergyBillDayCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? begin = null,
    Object? hourly = null,
  }) {
    return _then(_value.copyWith(
      begin: null == begin
          ? _value.begin
          : begin // ignore: cast_nullable_to_non_nullable
              as DateTime,
      hourly: null == hourly
          ? _value.hourly
          : hourly // ignore: cast_nullable_to_non_nullable
              as List<EnergyBillHour>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EnergyBillDayImplCopyWith<$Res>
    implements $EnergyBillDayCopyWith<$Res> {
  factory _$$EnergyBillDayImplCopyWith(
          _$EnergyBillDayImpl value, $Res Function(_$EnergyBillDayImpl) then) =
      __$$EnergyBillDayImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime begin, List<EnergyBillHour> hourly});
}

/// @nodoc
class __$$EnergyBillDayImplCopyWithImpl<$Res>
    extends _$EnergyBillDayCopyWithImpl<$Res, _$EnergyBillDayImpl>
    implements _$$EnergyBillDayImplCopyWith<$Res> {
  __$$EnergyBillDayImplCopyWithImpl(
      _$EnergyBillDayImpl _value, $Res Function(_$EnergyBillDayImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? begin = null,
    Object? hourly = null,
  }) {
    return _then(_$EnergyBillDayImpl(
      begin: null == begin
          ? _value.begin
          : begin // ignore: cast_nullable_to_non_nullable
              as DateTime,
      hourly: null == hourly
          ? _value._hourly
          : hourly // ignore: cast_nullable_to_non_nullable
              as List<EnergyBillHour>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EnergyBillDayImpl extends _EnergyBillDay {
  const _$EnergyBillDayImpl(
      {required this.begin, required final List<EnergyBillHour> hourly})
      : _hourly = hourly,
        super._();

  factory _$EnergyBillDayImpl.fromJson(Map<String, dynamic> json) =>
      _$$EnergyBillDayImplFromJson(json);

  @override
  final DateTime begin;
  final List<EnergyBillHour> _hourly;
  @override
  List<EnergyBillHour> get hourly {
    if (_hourly is EqualUnmodifiableListView) return _hourly;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hourly);
  }

  @override
  String toString() {
    return 'EnergyBillDay(begin: $begin, hourly: $hourly)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EnergyBillDayImpl &&
            (identical(other.begin, begin) || other.begin == begin) &&
            const DeepCollectionEquality().equals(other._hourly, _hourly));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, begin, const DeepCollectionEquality().hash(_hourly));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EnergyBillDayImplCopyWith<_$EnergyBillDayImpl> get copyWith =>
      __$$EnergyBillDayImplCopyWithImpl<_$EnergyBillDayImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EnergyBillDayImplToJson(
      this,
    );
  }
}

abstract class _EnergyBillDay extends EnergyBillDay {
  const factory _EnergyBillDay(
      {required final DateTime begin,
      required final List<EnergyBillHour> hourly}) = _$EnergyBillDayImpl;
  const _EnergyBillDay._() : super._();

  factory _EnergyBillDay.fromJson(Map<String, dynamic> json) =
      _$EnergyBillDayImpl.fromJson;

  @override
  DateTime get begin;
  @override
  List<EnergyBillHour> get hourly;
  @override
  @JsonKey(ignore: true)
  _$$EnergyBillDayImplCopyWith<_$EnergyBillDayImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EnergyBillHour _$EnergyBillHourFromJson(Map<String, dynamic> json) {
  return _EnergyBillHour.fromJson(json);
}

/// @nodoc
mixin _$EnergyBillHour {
  int get vat => throw _privateConstructorUsedError;
  DateTime get end => throw _privateConstructorUsedError;
  DateTime get begin => throw _privateConstructorUsedError;
  double get energy => throw _privateConstructorUsedError;
  ElectricityPrice get price => throw _privateConstructorUsedError;
  ElectricityTariff get tariff => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EnergyBillHourCopyWith<EnergyBillHour> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EnergyBillHourCopyWith<$Res> {
  factory $EnergyBillHourCopyWith(
          EnergyBillHour value, $Res Function(EnergyBillHour) then) =
      _$EnergyBillHourCopyWithImpl<$Res, EnergyBillHour>;
  @useResult
  $Res call(
      {int vat,
      DateTime end,
      DateTime begin,
      double energy,
      ElectricityPrice price,
      ElectricityTariff tariff});

  $ElectricityPriceCopyWith<$Res> get price;
  $ElectricityTariffCopyWith<$Res> get tariff;
}

/// @nodoc
class _$EnergyBillHourCopyWithImpl<$Res, $Val extends EnergyBillHour>
    implements $EnergyBillHourCopyWith<$Res> {
  _$EnergyBillHourCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vat = null,
    Object? end = null,
    Object? begin = null,
    Object? energy = null,
    Object? price = null,
    Object? tariff = null,
  }) {
    return _then(_value.copyWith(
      vat: null == vat
          ? _value.vat
          : vat // ignore: cast_nullable_to_non_nullable
              as int,
      end: null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as DateTime,
      begin: null == begin
          ? _value.begin
          : begin // ignore: cast_nullable_to_non_nullable
              as DateTime,
      energy: null == energy
          ? _value.energy
          : energy // ignore: cast_nullable_to_non_nullable
              as double,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as ElectricityPrice,
      tariff: null == tariff
          ? _value.tariff
          : tariff // ignore: cast_nullable_to_non_nullable
              as ElectricityTariff,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ElectricityPriceCopyWith<$Res> get price {
    return $ElectricityPriceCopyWith<$Res>(_value.price, (value) {
      return _then(_value.copyWith(price: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ElectricityTariffCopyWith<$Res> get tariff {
    return $ElectricityTariffCopyWith<$Res>(_value.tariff, (value) {
      return _then(_value.copyWith(tariff: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EnergyBillHourImplCopyWith<$Res>
    implements $EnergyBillHourCopyWith<$Res> {
  factory _$$EnergyBillHourImplCopyWith(_$EnergyBillHourImpl value,
          $Res Function(_$EnergyBillHourImpl) then) =
      __$$EnergyBillHourImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int vat,
      DateTime end,
      DateTime begin,
      double energy,
      ElectricityPrice price,
      ElectricityTariff tariff});

  @override
  $ElectricityPriceCopyWith<$Res> get price;
  @override
  $ElectricityTariffCopyWith<$Res> get tariff;
}

/// @nodoc
class __$$EnergyBillHourImplCopyWithImpl<$Res>
    extends _$EnergyBillHourCopyWithImpl<$Res, _$EnergyBillHourImpl>
    implements _$$EnergyBillHourImplCopyWith<$Res> {
  __$$EnergyBillHourImplCopyWithImpl(
      _$EnergyBillHourImpl _value, $Res Function(_$EnergyBillHourImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vat = null,
    Object? end = null,
    Object? begin = null,
    Object? energy = null,
    Object? price = null,
    Object? tariff = null,
  }) {
    return _then(_$EnergyBillHourImpl(
      vat: null == vat
          ? _value.vat
          : vat // ignore: cast_nullable_to_non_nullable
              as int,
      end: null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as DateTime,
      begin: null == begin
          ? _value.begin
          : begin // ignore: cast_nullable_to_non_nullable
              as DateTime,
      energy: null == energy
          ? _value.energy
          : energy // ignore: cast_nullable_to_non_nullable
              as double,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as ElectricityPrice,
      tariff: null == tariff
          ? _value.tariff
          : tariff // ignore: cast_nullable_to_non_nullable
              as ElectricityTariff,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EnergyBillHourImpl extends _EnergyBillHour {
  const _$EnergyBillHourImpl(
      {required this.vat,
      required this.end,
      required this.begin,
      required this.energy,
      required this.price,
      required this.tariff})
      : super._();

  factory _$EnergyBillHourImpl.fromJson(Map<String, dynamic> json) =>
      _$$EnergyBillHourImplFromJson(json);

  @override
  final int vat;
  @override
  final DateTime end;
  @override
  final DateTime begin;
  @override
  final double energy;
  @override
  final ElectricityPrice price;
  @override
  final ElectricityTariff tariff;

  @override
  String toString() {
    return 'EnergyBillHour(vat: $vat, end: $end, begin: $begin, energy: $energy, price: $price, tariff: $tariff)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EnergyBillHourImpl &&
            (identical(other.vat, vat) || other.vat == vat) &&
            (identical(other.end, end) || other.end == end) &&
            (identical(other.begin, begin) || other.begin == begin) &&
            (identical(other.energy, energy) || other.energy == energy) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.tariff, tariff) || other.tariff == tariff));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, vat, end, begin, energy, price, tariff);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EnergyBillHourImplCopyWith<_$EnergyBillHourImpl> get copyWith =>
      __$$EnergyBillHourImplCopyWithImpl<_$EnergyBillHourImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EnergyBillHourImplToJson(
      this,
    );
  }
}

abstract class _EnergyBillHour extends EnergyBillHour {
  const factory _EnergyBillHour(
      {required final int vat,
      required final DateTime end,
      required final DateTime begin,
      required final double energy,
      required final ElectricityPrice price,
      required final ElectricityTariff tariff}) = _$EnergyBillHourImpl;
  const _EnergyBillHour._() : super._();

  factory _EnergyBillHour.fromJson(Map<String, dynamic> json) =
      _$EnergyBillHourImpl.fromJson;

  @override
  int get vat;
  @override
  DateTime get end;
  @override
  DateTime get begin;
  @override
  double get energy;
  @override
  ElectricityPrice get price;
  @override
  ElectricityTariff get tariff;
  @override
  @JsonKey(ignore: true)
  _$$EnergyBillHourImplCopyWith<_$EnergyBillHourImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
