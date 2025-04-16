// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'energy_bill.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EnergyBillMonth {
  DateTime get begin;
  List<EnergyBillDay> get daily;

  /// Create a copy of EnergyBillMonth
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EnergyBillMonthCopyWith<EnergyBillMonth> get copyWith =>
      _$EnergyBillMonthCopyWithImpl<EnergyBillMonth>(
          this as EnergyBillMonth, _$identity);

  /// Serializes this EnergyBillMonth to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EnergyBillMonth &&
            (identical(other.begin, begin) || other.begin == begin) &&
            const DeepCollectionEquality().equals(other.daily, daily));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, begin, const DeepCollectionEquality().hash(daily));

  @override
  String toString() {
    return 'EnergyBillMonth(begin: $begin, daily: $daily)';
  }
}

/// @nodoc
abstract mixin class $EnergyBillMonthCopyWith<$Res> {
  factory $EnergyBillMonthCopyWith(
          EnergyBillMonth value, $Res Function(EnergyBillMonth) _then) =
      _$EnergyBillMonthCopyWithImpl;
  @useResult
  $Res call({DateTime begin, List<EnergyBillDay> daily});
}

/// @nodoc
class _$EnergyBillMonthCopyWithImpl<$Res>
    implements $EnergyBillMonthCopyWith<$Res> {
  _$EnergyBillMonthCopyWithImpl(this._self, this._then);

  final EnergyBillMonth _self;
  final $Res Function(EnergyBillMonth) _then;

  /// Create a copy of EnergyBillMonth
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? begin = null,
    Object? daily = null,
  }) {
    return _then(_self.copyWith(
      begin: null == begin
          ? _self.begin
          : begin // ignore: cast_nullable_to_non_nullable
              as DateTime,
      daily: null == daily
          ? _self.daily
          : daily // ignore: cast_nullable_to_non_nullable
              as List<EnergyBillDay>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _EnergyBillMonth extends EnergyBillMonth {
  const _EnergyBillMonth(
      {required this.begin, required final List<EnergyBillDay> daily})
      : _daily = daily,
        super._();
  factory _EnergyBillMonth.fromJson(Map<String, dynamic> json) =>
      _$EnergyBillMonthFromJson(json);

  @override
  final DateTime begin;
  final List<EnergyBillDay> _daily;
  @override
  List<EnergyBillDay> get daily {
    if (_daily is EqualUnmodifiableListView) return _daily;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_daily);
  }

  /// Create a copy of EnergyBillMonth
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$EnergyBillMonthCopyWith<_EnergyBillMonth> get copyWith =>
      __$EnergyBillMonthCopyWithImpl<_EnergyBillMonth>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$EnergyBillMonthToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EnergyBillMonth &&
            (identical(other.begin, begin) || other.begin == begin) &&
            const DeepCollectionEquality().equals(other._daily, _daily));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, begin, const DeepCollectionEquality().hash(_daily));

  @override
  String toString() {
    return 'EnergyBillMonth(begin: $begin, daily: $daily)';
  }
}

/// @nodoc
abstract mixin class _$EnergyBillMonthCopyWith<$Res>
    implements $EnergyBillMonthCopyWith<$Res> {
  factory _$EnergyBillMonthCopyWith(
          _EnergyBillMonth value, $Res Function(_EnergyBillMonth) _then) =
      __$EnergyBillMonthCopyWithImpl;
  @override
  @useResult
  $Res call({DateTime begin, List<EnergyBillDay> daily});
}

/// @nodoc
class __$EnergyBillMonthCopyWithImpl<$Res>
    implements _$EnergyBillMonthCopyWith<$Res> {
  __$EnergyBillMonthCopyWithImpl(this._self, this._then);

  final _EnergyBillMonth _self;
  final $Res Function(_EnergyBillMonth) _then;

  /// Create a copy of EnergyBillMonth
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? begin = null,
    Object? daily = null,
  }) {
    return _then(_EnergyBillMonth(
      begin: null == begin
          ? _self.begin
          : begin // ignore: cast_nullable_to_non_nullable
              as DateTime,
      daily: null == daily
          ? _self._daily
          : daily // ignore: cast_nullable_to_non_nullable
              as List<EnergyBillDay>,
    ));
  }
}

/// @nodoc
mixin _$EnergyBillDay {
  DateTime get begin;
  List<EnergyBillHour> get hourly;

  /// Create a copy of EnergyBillDay
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EnergyBillDayCopyWith<EnergyBillDay> get copyWith =>
      _$EnergyBillDayCopyWithImpl<EnergyBillDay>(
          this as EnergyBillDay, _$identity);

  /// Serializes this EnergyBillDay to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EnergyBillDay &&
            (identical(other.begin, begin) || other.begin == begin) &&
            const DeepCollectionEquality().equals(other.hourly, hourly));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, begin, const DeepCollectionEquality().hash(hourly));

  @override
  String toString() {
    return 'EnergyBillDay(begin: $begin, hourly: $hourly)';
  }
}

/// @nodoc
abstract mixin class $EnergyBillDayCopyWith<$Res> {
  factory $EnergyBillDayCopyWith(
          EnergyBillDay value, $Res Function(EnergyBillDay) _then) =
      _$EnergyBillDayCopyWithImpl;
  @useResult
  $Res call({DateTime begin, List<EnergyBillHour> hourly});
}

/// @nodoc
class _$EnergyBillDayCopyWithImpl<$Res>
    implements $EnergyBillDayCopyWith<$Res> {
  _$EnergyBillDayCopyWithImpl(this._self, this._then);

  final EnergyBillDay _self;
  final $Res Function(EnergyBillDay) _then;

  /// Create a copy of EnergyBillDay
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? begin = null,
    Object? hourly = null,
  }) {
    return _then(_self.copyWith(
      begin: null == begin
          ? _self.begin
          : begin // ignore: cast_nullable_to_non_nullable
              as DateTime,
      hourly: null == hourly
          ? _self.hourly
          : hourly // ignore: cast_nullable_to_non_nullable
              as List<EnergyBillHour>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _EnergyBillDay extends EnergyBillDay {
  const _EnergyBillDay(
      {required this.begin, required final List<EnergyBillHour> hourly})
      : _hourly = hourly,
        super._();
  factory _EnergyBillDay.fromJson(Map<String, dynamic> json) =>
      _$EnergyBillDayFromJson(json);

  @override
  final DateTime begin;
  final List<EnergyBillHour> _hourly;
  @override
  List<EnergyBillHour> get hourly {
    if (_hourly is EqualUnmodifiableListView) return _hourly;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hourly);
  }

  /// Create a copy of EnergyBillDay
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$EnergyBillDayCopyWith<_EnergyBillDay> get copyWith =>
      __$EnergyBillDayCopyWithImpl<_EnergyBillDay>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$EnergyBillDayToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EnergyBillDay &&
            (identical(other.begin, begin) || other.begin == begin) &&
            const DeepCollectionEquality().equals(other._hourly, _hourly));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, begin, const DeepCollectionEquality().hash(_hourly));

  @override
  String toString() {
    return 'EnergyBillDay(begin: $begin, hourly: $hourly)';
  }
}

/// @nodoc
abstract mixin class _$EnergyBillDayCopyWith<$Res>
    implements $EnergyBillDayCopyWith<$Res> {
  factory _$EnergyBillDayCopyWith(
          _EnergyBillDay value, $Res Function(_EnergyBillDay) _then) =
      __$EnergyBillDayCopyWithImpl;
  @override
  @useResult
  $Res call({DateTime begin, List<EnergyBillHour> hourly});
}

/// @nodoc
class __$EnergyBillDayCopyWithImpl<$Res>
    implements _$EnergyBillDayCopyWith<$Res> {
  __$EnergyBillDayCopyWithImpl(this._self, this._then);

  final _EnergyBillDay _self;
  final $Res Function(_EnergyBillDay) _then;

  /// Create a copy of EnergyBillDay
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? begin = null,
    Object? hourly = null,
  }) {
    return _then(_EnergyBillDay(
      begin: null == begin
          ? _self.begin
          : begin // ignore: cast_nullable_to_non_nullable
              as DateTime,
      hourly: null == hourly
          ? _self._hourly
          : hourly // ignore: cast_nullable_to_non_nullable
              as List<EnergyBillHour>,
    ));
  }
}

/// @nodoc
mixin _$EnergyBillHour {
  int get vat;
  DateTime get end;
  DateTime get begin;
  double get energy;
  ElectricityPrice get price;
  ElectricityTariff get tariff;

  /// Create a copy of EnergyBillHour
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EnergyBillHourCopyWith<EnergyBillHour> get copyWith =>
      _$EnergyBillHourCopyWithImpl<EnergyBillHour>(
          this as EnergyBillHour, _$identity);

  /// Serializes this EnergyBillHour to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EnergyBillHour &&
            (identical(other.vat, vat) || other.vat == vat) &&
            (identical(other.end, end) || other.end == end) &&
            (identical(other.begin, begin) || other.begin == begin) &&
            (identical(other.energy, energy) || other.energy == energy) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.tariff, tariff) || other.tariff == tariff));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, vat, end, begin, energy, price, tariff);

  @override
  String toString() {
    return 'EnergyBillHour(vat: $vat, end: $end, begin: $begin, energy: $energy, price: $price, tariff: $tariff)';
  }
}

/// @nodoc
abstract mixin class $EnergyBillHourCopyWith<$Res> {
  factory $EnergyBillHourCopyWith(
          EnergyBillHour value, $Res Function(EnergyBillHour) _then) =
      _$EnergyBillHourCopyWithImpl;
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
class _$EnergyBillHourCopyWithImpl<$Res>
    implements $EnergyBillHourCopyWith<$Res> {
  _$EnergyBillHourCopyWithImpl(this._self, this._then);

  final EnergyBillHour _self;
  final $Res Function(EnergyBillHour) _then;

  /// Create a copy of EnergyBillHour
  /// with the given fields replaced by the non-null parameter values.
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
    return _then(_self.copyWith(
      vat: null == vat
          ? _self.vat
          : vat // ignore: cast_nullable_to_non_nullable
              as int,
      end: null == end
          ? _self.end
          : end // ignore: cast_nullable_to_non_nullable
              as DateTime,
      begin: null == begin
          ? _self.begin
          : begin // ignore: cast_nullable_to_non_nullable
              as DateTime,
      energy: null == energy
          ? _self.energy
          : energy // ignore: cast_nullable_to_non_nullable
              as double,
      price: null == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as ElectricityPrice,
      tariff: null == tariff
          ? _self.tariff
          : tariff // ignore: cast_nullable_to_non_nullable
              as ElectricityTariff,
    ));
  }

  /// Create a copy of EnergyBillHour
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ElectricityPriceCopyWith<$Res> get price {
    return $ElectricityPriceCopyWith<$Res>(_self.price, (value) {
      return _then(_self.copyWith(price: value));
    });
  }

  /// Create a copy of EnergyBillHour
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ElectricityTariffCopyWith<$Res> get tariff {
    return $ElectricityTariffCopyWith<$Res>(_self.tariff, (value) {
      return _then(_self.copyWith(tariff: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _EnergyBillHour extends EnergyBillHour {
  const _EnergyBillHour(
      {required this.vat,
      required this.end,
      required this.begin,
      required this.energy,
      required this.price,
      required this.tariff})
      : super._();
  factory _EnergyBillHour.fromJson(Map<String, dynamic> json) =>
      _$EnergyBillHourFromJson(json);

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

  /// Create a copy of EnergyBillHour
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$EnergyBillHourCopyWith<_EnergyBillHour> get copyWith =>
      __$EnergyBillHourCopyWithImpl<_EnergyBillHour>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$EnergyBillHourToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EnergyBillHour &&
            (identical(other.vat, vat) || other.vat == vat) &&
            (identical(other.end, end) || other.end == end) &&
            (identical(other.begin, begin) || other.begin == begin) &&
            (identical(other.energy, energy) || other.energy == energy) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.tariff, tariff) || other.tariff == tariff));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, vat, end, begin, energy, price, tariff);

  @override
  String toString() {
    return 'EnergyBillHour(vat: $vat, end: $end, begin: $begin, energy: $energy, price: $price, tariff: $tariff)';
  }
}

/// @nodoc
abstract mixin class _$EnergyBillHourCopyWith<$Res>
    implements $EnergyBillHourCopyWith<$Res> {
  factory _$EnergyBillHourCopyWith(
          _EnergyBillHour value, $Res Function(_EnergyBillHour) _then) =
      __$EnergyBillHourCopyWithImpl;
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
class __$EnergyBillHourCopyWithImpl<$Res>
    implements _$EnergyBillHourCopyWith<$Res> {
  __$EnergyBillHourCopyWithImpl(this._self, this._then);

  final _EnergyBillHour _self;
  final $Res Function(_EnergyBillHour) _then;

  /// Create a copy of EnergyBillHour
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? vat = null,
    Object? end = null,
    Object? begin = null,
    Object? energy = null,
    Object? price = null,
    Object? tariff = null,
  }) {
    return _then(_EnergyBillHour(
      vat: null == vat
          ? _self.vat
          : vat // ignore: cast_nullable_to_non_nullable
              as int,
      end: null == end
          ? _self.end
          : end // ignore: cast_nullable_to_non_nullable
              as DateTime,
      begin: null == begin
          ? _self.begin
          : begin // ignore: cast_nullable_to_non_nullable
              as DateTime,
      energy: null == energy
          ? _self.energy
          : energy // ignore: cast_nullable_to_non_nullable
              as double,
      price: null == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as ElectricityPrice,
      tariff: null == tariff
          ? _self.tariff
          : tariff // ignore: cast_nullable_to_non_nullable
              as ElectricityTariff,
    ));
  }

  /// Create a copy of EnergyBillHour
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ElectricityPriceCopyWith<$Res> get price {
    return $ElectricityPriceCopyWith<$Res>(_self.price, (value) {
      return _then(_self.copyWith(price: value));
    });
  }

  /// Create a copy of EnergyBillHour
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ElectricityTariffCopyWith<$Res> get tariff {
    return $ElectricityTariffCopyWith<$Res>(_self.tariff, (value) {
      return _then(_self.copyWith(tariff: value));
    });
  }
}

// dart format on
