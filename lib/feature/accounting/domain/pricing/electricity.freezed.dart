// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'electricity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ElectricityPrice _$ElectricityPriceFromJson(Map<String, dynamic> json) {
  return _ElectricityPrice.fromJson(json);
}

/// @nodoc
mixin _$ElectricityPrice {
  @JsonKey(name: 'NOK_per_kWh')
  double get nokPerKwh => throw _privateConstructorUsedError;
  @JsonKey(name: 'EUR_per_kWh')
  double get eurPerKwh => throw _privateConstructorUsedError;
  @JsonKey(name: 'EXR')
  double get eurToNokRate => throw _privateConstructorUsedError;
  @JsonKey(name: 'time_start')
  DateTime get begin => throw _privateConstructorUsedError;
  @JsonKey(name: 'time_end')
  DateTime get end => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ElectricityPriceCopyWith<ElectricityPrice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ElectricityPriceCopyWith<$Res> {
  factory $ElectricityPriceCopyWith(
          ElectricityPrice value, $Res Function(ElectricityPrice) then) =
      _$ElectricityPriceCopyWithImpl<$Res, ElectricityPrice>;
  @useResult
  $Res call(
      {@JsonKey(name: 'NOK_per_kWh') double nokPerKwh,
      @JsonKey(name: 'EUR_per_kWh') double eurPerKwh,
      @JsonKey(name: 'EXR') double eurToNokRate,
      @JsonKey(name: 'time_start') DateTime begin,
      @JsonKey(name: 'time_end') DateTime end});
}

/// @nodoc
class _$ElectricityPriceCopyWithImpl<$Res, $Val extends ElectricityPrice>
    implements $ElectricityPriceCopyWith<$Res> {
  _$ElectricityPriceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nokPerKwh = null,
    Object? eurPerKwh = null,
    Object? eurToNokRate = null,
    Object? begin = null,
    Object? end = null,
  }) {
    return _then(_value.copyWith(
      nokPerKwh: null == nokPerKwh
          ? _value.nokPerKwh
          : nokPerKwh // ignore: cast_nullable_to_non_nullable
              as double,
      eurPerKwh: null == eurPerKwh
          ? _value.eurPerKwh
          : eurPerKwh // ignore: cast_nullable_to_non_nullable
              as double,
      eurToNokRate: null == eurToNokRate
          ? _value.eurToNokRate
          : eurToNokRate // ignore: cast_nullable_to_non_nullable
              as double,
      begin: null == begin
          ? _value.begin
          : begin // ignore: cast_nullable_to_non_nullable
              as DateTime,
      end: null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ElectricityPriceImplCopyWith<$Res>
    implements $ElectricityPriceCopyWith<$Res> {
  factory _$$ElectricityPriceImplCopyWith(_$ElectricityPriceImpl value,
          $Res Function(_$ElectricityPriceImpl) then) =
      __$$ElectricityPriceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'NOK_per_kWh') double nokPerKwh,
      @JsonKey(name: 'EUR_per_kWh') double eurPerKwh,
      @JsonKey(name: 'EXR') double eurToNokRate,
      @JsonKey(name: 'time_start') DateTime begin,
      @JsonKey(name: 'time_end') DateTime end});
}

/// @nodoc
class __$$ElectricityPriceImplCopyWithImpl<$Res>
    extends _$ElectricityPriceCopyWithImpl<$Res, _$ElectricityPriceImpl>
    implements _$$ElectricityPriceImplCopyWith<$Res> {
  __$$ElectricityPriceImplCopyWithImpl(_$ElectricityPriceImpl _value,
      $Res Function(_$ElectricityPriceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nokPerKwh = null,
    Object? eurPerKwh = null,
    Object? eurToNokRate = null,
    Object? begin = null,
    Object? end = null,
  }) {
    return _then(_$ElectricityPriceImpl(
      nokPerKwh: null == nokPerKwh
          ? _value.nokPerKwh
          : nokPerKwh // ignore: cast_nullable_to_non_nullable
              as double,
      eurPerKwh: null == eurPerKwh
          ? _value.eurPerKwh
          : eurPerKwh // ignore: cast_nullable_to_non_nullable
              as double,
      eurToNokRate: null == eurToNokRate
          ? _value.eurToNokRate
          : eurToNokRate // ignore: cast_nullable_to_non_nullable
              as double,
      begin: null == begin
          ? _value.begin
          : begin // ignore: cast_nullable_to_non_nullable
              as DateTime,
      end: null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ElectricityPriceImpl extends _ElectricityPrice {
  const _$ElectricityPriceImpl(
      {@JsonKey(name: 'NOK_per_kWh') required this.nokPerKwh,
      @JsonKey(name: 'EUR_per_kWh') required this.eurPerKwh,
      @JsonKey(name: 'EXR') required this.eurToNokRate,
      @JsonKey(name: 'time_start') required this.begin,
      @JsonKey(name: 'time_end') required this.end})
      : super._();

  factory _$ElectricityPriceImpl.fromJson(Map<String, dynamic> json) =>
      _$$ElectricityPriceImplFromJson(json);

  @override
  @JsonKey(name: 'NOK_per_kWh')
  final double nokPerKwh;
  @override
  @JsonKey(name: 'EUR_per_kWh')
  final double eurPerKwh;
  @override
  @JsonKey(name: 'EXR')
  final double eurToNokRate;
  @override
  @JsonKey(name: 'time_start')
  final DateTime begin;
  @override
  @JsonKey(name: 'time_end')
  final DateTime end;

  @override
  String toString() {
    return 'ElectricityPrice(nokPerKwh: $nokPerKwh, eurPerKwh: $eurPerKwh, eurToNokRate: $eurToNokRate, begin: $begin, end: $end)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ElectricityPriceImpl &&
            (identical(other.nokPerKwh, nokPerKwh) ||
                other.nokPerKwh == nokPerKwh) &&
            (identical(other.eurPerKwh, eurPerKwh) ||
                other.eurPerKwh == eurPerKwh) &&
            (identical(other.eurToNokRate, eurToNokRate) ||
                other.eurToNokRate == eurToNokRate) &&
            (identical(other.begin, begin) || other.begin == begin) &&
            (identical(other.end, end) || other.end == end));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, nokPerKwh, eurPerKwh, eurToNokRate, begin, end);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ElectricityPriceImplCopyWith<_$ElectricityPriceImpl> get copyWith =>
      __$$ElectricityPriceImplCopyWithImpl<_$ElectricityPriceImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ElectricityPriceImplToJson(
      this,
    );
  }
}

abstract class _ElectricityPrice extends ElectricityPrice {
  const factory _ElectricityPrice(
          {@JsonKey(name: 'NOK_per_kWh') required final double nokPerKwh,
          @JsonKey(name: 'EUR_per_kWh') required final double eurPerKwh,
          @JsonKey(name: 'EXR') required final double eurToNokRate,
          @JsonKey(name: 'time_start') required final DateTime begin,
          @JsonKey(name: 'time_end') required final DateTime end}) =
      _$ElectricityPriceImpl;
  const _ElectricityPrice._() : super._();

  factory _ElectricityPrice.fromJson(Map<String, dynamic> json) =
      _$ElectricityPriceImpl.fromJson;

  @override
  @JsonKey(name: 'NOK_per_kWh')
  double get nokPerKwh;
  @override
  @JsonKey(name: 'EUR_per_kWh')
  double get eurPerKwh;
  @override
  @JsonKey(name: 'EXR')
  double get eurToNokRate;
  @override
  @JsonKey(name: 'time_start')
  DateTime get begin;
  @override
  @JsonKey(name: 'time_end')
  DateTime get end;
  @override
  @JsonKey(ignore: true)
  _$$ElectricityPriceImplCopyWith<_$ElectricityPriceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ElectricityTariff _$ElectricityTariffFromJson(Map<String, dynamic> json) {
  return _ElectricityTariff.fromJson(json);
}

/// @nodoc
mixin _$ElectricityTariff {
  String get provider => throw _privateConstructorUsedError;
  DateTime get validUntil => throw _privateConstructorUsedError;
  List<ElectricityCapacity> get capacity => throw _privateConstructorUsedError;
  List<ElectricityConsumption> get consumption =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ElectricityTariffCopyWith<ElectricityTariff> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ElectricityTariffCopyWith<$Res> {
  factory $ElectricityTariffCopyWith(
          ElectricityTariff value, $Res Function(ElectricityTariff) then) =
      _$ElectricityTariffCopyWithImpl<$Res, ElectricityTariff>;
  @useResult
  $Res call(
      {String provider,
      DateTime validUntil,
      List<ElectricityCapacity> capacity,
      List<ElectricityConsumption> consumption});
}

/// @nodoc
class _$ElectricityTariffCopyWithImpl<$Res, $Val extends ElectricityTariff>
    implements $ElectricityTariffCopyWith<$Res> {
  _$ElectricityTariffCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? provider = null,
    Object? validUntil = null,
    Object? capacity = null,
    Object? consumption = null,
  }) {
    return _then(_value.copyWith(
      provider: null == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String,
      validUntil: null == validUntil
          ? _value.validUntil
          : validUntil // ignore: cast_nullable_to_non_nullable
              as DateTime,
      capacity: null == capacity
          ? _value.capacity
          : capacity // ignore: cast_nullable_to_non_nullable
              as List<ElectricityCapacity>,
      consumption: null == consumption
          ? _value.consumption
          : consumption // ignore: cast_nullable_to_non_nullable
              as List<ElectricityConsumption>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ElectricityTariffImplCopyWith<$Res>
    implements $ElectricityTariffCopyWith<$Res> {
  factory _$$ElectricityTariffImplCopyWith(_$ElectricityTariffImpl value,
          $Res Function(_$ElectricityTariffImpl) then) =
      __$$ElectricityTariffImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String provider,
      DateTime validUntil,
      List<ElectricityCapacity> capacity,
      List<ElectricityConsumption> consumption});
}

/// @nodoc
class __$$ElectricityTariffImplCopyWithImpl<$Res>
    extends _$ElectricityTariffCopyWithImpl<$Res, _$ElectricityTariffImpl>
    implements _$$ElectricityTariffImplCopyWith<$Res> {
  __$$ElectricityTariffImplCopyWithImpl(_$ElectricityTariffImpl _value,
      $Res Function(_$ElectricityTariffImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? provider = null,
    Object? validUntil = null,
    Object? capacity = null,
    Object? consumption = null,
  }) {
    return _then(_$ElectricityTariffImpl(
      provider: null == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String,
      validUntil: null == validUntil
          ? _value.validUntil
          : validUntil // ignore: cast_nullable_to_non_nullable
              as DateTime,
      capacity: null == capacity
          ? _value._capacity
          : capacity // ignore: cast_nullable_to_non_nullable
              as List<ElectricityCapacity>,
      consumption: null == consumption
          ? _value._consumption
          : consumption // ignore: cast_nullable_to_non_nullable
              as List<ElectricityConsumption>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ElectricityTariffImpl extends _ElectricityTariff {
  const _$ElectricityTariffImpl(
      {required this.provider,
      required this.validUntil,
      required final List<ElectricityCapacity> capacity,
      required final List<ElectricityConsumption> consumption})
      : _capacity = capacity,
        _consumption = consumption,
        super._();

  factory _$ElectricityTariffImpl.fromJson(Map<String, dynamic> json) =>
      _$$ElectricityTariffImplFromJson(json);

  @override
  final String provider;
  @override
  final DateTime validUntil;
  final List<ElectricityCapacity> _capacity;
  @override
  List<ElectricityCapacity> get capacity {
    if (_capacity is EqualUnmodifiableListView) return _capacity;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_capacity);
  }

  final List<ElectricityConsumption> _consumption;
  @override
  List<ElectricityConsumption> get consumption {
    if (_consumption is EqualUnmodifiableListView) return _consumption;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_consumption);
  }

  @override
  String toString() {
    return 'ElectricityTariff(provider: $provider, validUntil: $validUntil, capacity: $capacity, consumption: $consumption)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ElectricityTariffImpl &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            (identical(other.validUntil, validUntil) ||
                other.validUntil == validUntil) &&
            const DeepCollectionEquality().equals(other._capacity, _capacity) &&
            const DeepCollectionEquality()
                .equals(other._consumption, _consumption));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      provider,
      validUntil,
      const DeepCollectionEquality().hash(_capacity),
      const DeepCollectionEquality().hash(_consumption));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ElectricityTariffImplCopyWith<_$ElectricityTariffImpl> get copyWith =>
      __$$ElectricityTariffImplCopyWithImpl<_$ElectricityTariffImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ElectricityTariffImplToJson(
      this,
    );
  }
}

abstract class _ElectricityTariff extends ElectricityTariff {
  const factory _ElectricityTariff(
          {required final String provider,
          required final DateTime validUntil,
          required final List<ElectricityCapacity> capacity,
          required final List<ElectricityConsumption> consumption}) =
      _$ElectricityTariffImpl;
  const _ElectricityTariff._() : super._();

  factory _ElectricityTariff.fromJson(Map<String, dynamic> json) =
      _$ElectricityTariffImpl.fromJson;

  @override
  String get provider;
  @override
  DateTime get validUntil;
  @override
  List<ElectricityCapacity> get capacity;
  @override
  List<ElectricityConsumption> get consumption;
  @override
  @JsonKey(ignore: true)
  _$$ElectricityTariffImplCopyWith<_$ElectricityTariffImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ElectricityCapacity _$ElectricityCapacityFromJson(Map<String, dynamic> json) {
  return _ElectricityCapacity.fromJson(json);
}

/// @nodoc
mixin _$ElectricityCapacity {
  @JsonKey(name: 'from_kWh')
  double get fromKWh => throw _privateConstructorUsedError;
  @JsonKey(name: 'to_kWh')
  double get toKWh => throw _privateConstructorUsedError;
  @JsonKey(name: 'NOK_per_month')
  double get nokPerMonth => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ElectricityCapacityCopyWith<ElectricityCapacity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ElectricityCapacityCopyWith<$Res> {
  factory $ElectricityCapacityCopyWith(
          ElectricityCapacity value, $Res Function(ElectricityCapacity) then) =
      _$ElectricityCapacityCopyWithImpl<$Res, ElectricityCapacity>;
  @useResult
  $Res call(
      {@JsonKey(name: 'from_kWh') double fromKWh,
      @JsonKey(name: 'to_kWh') double toKWh,
      @JsonKey(name: 'NOK_per_month') double nokPerMonth});
}

/// @nodoc
class _$ElectricityCapacityCopyWithImpl<$Res, $Val extends ElectricityCapacity>
    implements $ElectricityCapacityCopyWith<$Res> {
  _$ElectricityCapacityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fromKWh = null,
    Object? toKWh = null,
    Object? nokPerMonth = null,
  }) {
    return _then(_value.copyWith(
      fromKWh: null == fromKWh
          ? _value.fromKWh
          : fromKWh // ignore: cast_nullable_to_non_nullable
              as double,
      toKWh: null == toKWh
          ? _value.toKWh
          : toKWh // ignore: cast_nullable_to_non_nullable
              as double,
      nokPerMonth: null == nokPerMonth
          ? _value.nokPerMonth
          : nokPerMonth // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ElectricityCapacityImplCopyWith<$Res>
    implements $ElectricityCapacityCopyWith<$Res> {
  factory _$$ElectricityCapacityImplCopyWith(_$ElectricityCapacityImpl value,
          $Res Function(_$ElectricityCapacityImpl) then) =
      __$$ElectricityCapacityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'from_kWh') double fromKWh,
      @JsonKey(name: 'to_kWh') double toKWh,
      @JsonKey(name: 'NOK_per_month') double nokPerMonth});
}

/// @nodoc
class __$$ElectricityCapacityImplCopyWithImpl<$Res>
    extends _$ElectricityCapacityCopyWithImpl<$Res, _$ElectricityCapacityImpl>
    implements _$$ElectricityCapacityImplCopyWith<$Res> {
  __$$ElectricityCapacityImplCopyWithImpl(_$ElectricityCapacityImpl _value,
      $Res Function(_$ElectricityCapacityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fromKWh = null,
    Object? toKWh = null,
    Object? nokPerMonth = null,
  }) {
    return _then(_$ElectricityCapacityImpl(
      fromKWh: null == fromKWh
          ? _value.fromKWh
          : fromKWh // ignore: cast_nullable_to_non_nullable
              as double,
      toKWh: null == toKWh
          ? _value.toKWh
          : toKWh // ignore: cast_nullable_to_non_nullable
              as double,
      nokPerMonth: null == nokPerMonth
          ? _value.nokPerMonth
          : nokPerMonth // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ElectricityCapacityImpl extends _ElectricityCapacity {
  const _$ElectricityCapacityImpl(
      {@JsonKey(name: 'from_kWh') required this.fromKWh,
      @JsonKey(name: 'to_kWh') required this.toKWh,
      @JsonKey(name: 'NOK_per_month') required this.nokPerMonth})
      : super._();

  factory _$ElectricityCapacityImpl.fromJson(Map<String, dynamic> json) =>
      _$$ElectricityCapacityImplFromJson(json);

  @override
  @JsonKey(name: 'from_kWh')
  final double fromKWh;
  @override
  @JsonKey(name: 'to_kWh')
  final double toKWh;
  @override
  @JsonKey(name: 'NOK_per_month')
  final double nokPerMonth;

  @override
  String toString() {
    return 'ElectricityCapacity(fromKWh: $fromKWh, toKWh: $toKWh, nokPerMonth: $nokPerMonth)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ElectricityCapacityImpl &&
            (identical(other.fromKWh, fromKWh) || other.fromKWh == fromKWh) &&
            (identical(other.toKWh, toKWh) || other.toKWh == toKWh) &&
            (identical(other.nokPerMonth, nokPerMonth) ||
                other.nokPerMonth == nokPerMonth));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, fromKWh, toKWh, nokPerMonth);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ElectricityCapacityImplCopyWith<_$ElectricityCapacityImpl> get copyWith =>
      __$$ElectricityCapacityImplCopyWithImpl<_$ElectricityCapacityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ElectricityCapacityImplToJson(
      this,
    );
  }
}

abstract class _ElectricityCapacity extends ElectricityCapacity {
  const factory _ElectricityCapacity(
          {@JsonKey(name: 'from_kWh') required final double fromKWh,
          @JsonKey(name: 'to_kWh') required final double toKWh,
          @JsonKey(name: 'NOK_per_month') required final double nokPerMonth}) =
      _$ElectricityCapacityImpl;
  const _ElectricityCapacity._() : super._();

  factory _ElectricityCapacity.fromJson(Map<String, dynamic> json) =
      _$ElectricityCapacityImpl.fromJson;

  @override
  @JsonKey(name: 'from_kWh')
  double get fromKWh;
  @override
  @JsonKey(name: 'to_kWh')
  double get toKWh;
  @override
  @JsonKey(name: 'NOK_per_month')
  double get nokPerMonth;
  @override
  @JsonKey(ignore: true)
  _$$ElectricityCapacityImplCopyWith<_$ElectricityCapacityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ElectricityConsumption _$ElectricityConsumptionFromJson(
    Map<String, dynamic> json) {
  return _ElectricityConsumption.fromJson(json);
}

/// @nodoc
mixin _$ElectricityConsumption {
  @JsonKey(name: 'NOK_per_kWh')
  double get nokPerKwh => throw _privateConstructorUsedError;
  @JsonKey(name: 'from_hour')
  int get fromHour => throw _privateConstructorUsedError;
  @JsonKey(name: 'to_hour')
  int get toHour => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ElectricityConsumptionCopyWith<ElectricityConsumption> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ElectricityConsumptionCopyWith<$Res> {
  factory $ElectricityConsumptionCopyWith(ElectricityConsumption value,
          $Res Function(ElectricityConsumption) then) =
      _$ElectricityConsumptionCopyWithImpl<$Res, ElectricityConsumption>;
  @useResult
  $Res call(
      {@JsonKey(name: 'NOK_per_kWh') double nokPerKwh,
      @JsonKey(name: 'from_hour') int fromHour,
      @JsonKey(name: 'to_hour') int toHour});
}

/// @nodoc
class _$ElectricityConsumptionCopyWithImpl<$Res,
        $Val extends ElectricityConsumption>
    implements $ElectricityConsumptionCopyWith<$Res> {
  _$ElectricityConsumptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nokPerKwh = null,
    Object? fromHour = null,
    Object? toHour = null,
  }) {
    return _then(_value.copyWith(
      nokPerKwh: null == nokPerKwh
          ? _value.nokPerKwh
          : nokPerKwh // ignore: cast_nullable_to_non_nullable
              as double,
      fromHour: null == fromHour
          ? _value.fromHour
          : fromHour // ignore: cast_nullable_to_non_nullable
              as int,
      toHour: null == toHour
          ? _value.toHour
          : toHour // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ElectricityConsumptionImplCopyWith<$Res>
    implements $ElectricityConsumptionCopyWith<$Res> {
  factory _$$ElectricityConsumptionImplCopyWith(
          _$ElectricityConsumptionImpl value,
          $Res Function(_$ElectricityConsumptionImpl) then) =
      __$$ElectricityConsumptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'NOK_per_kWh') double nokPerKwh,
      @JsonKey(name: 'from_hour') int fromHour,
      @JsonKey(name: 'to_hour') int toHour});
}

/// @nodoc
class __$$ElectricityConsumptionImplCopyWithImpl<$Res>
    extends _$ElectricityConsumptionCopyWithImpl<$Res,
        _$ElectricityConsumptionImpl>
    implements _$$ElectricityConsumptionImplCopyWith<$Res> {
  __$$ElectricityConsumptionImplCopyWithImpl(
      _$ElectricityConsumptionImpl _value,
      $Res Function(_$ElectricityConsumptionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nokPerKwh = null,
    Object? fromHour = null,
    Object? toHour = null,
  }) {
    return _then(_$ElectricityConsumptionImpl(
      nokPerKwh: null == nokPerKwh
          ? _value.nokPerKwh
          : nokPerKwh // ignore: cast_nullable_to_non_nullable
              as double,
      fromHour: null == fromHour
          ? _value.fromHour
          : fromHour // ignore: cast_nullable_to_non_nullable
              as int,
      toHour: null == toHour
          ? _value.toHour
          : toHour // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ElectricityConsumptionImpl extends _ElectricityConsumption {
  const _$ElectricityConsumptionImpl(
      {@JsonKey(name: 'NOK_per_kWh') required this.nokPerKwh,
      @JsonKey(name: 'from_hour') required this.fromHour,
      @JsonKey(name: 'to_hour') required this.toHour})
      : super._();

  factory _$ElectricityConsumptionImpl.fromJson(Map<String, dynamic> json) =>
      _$$ElectricityConsumptionImplFromJson(json);

  @override
  @JsonKey(name: 'NOK_per_kWh')
  final double nokPerKwh;
  @override
  @JsonKey(name: 'from_hour')
  final int fromHour;
  @override
  @JsonKey(name: 'to_hour')
  final int toHour;

  @override
  String toString() {
    return 'ElectricityConsumption(nokPerKwh: $nokPerKwh, fromHour: $fromHour, toHour: $toHour)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ElectricityConsumptionImpl &&
            (identical(other.nokPerKwh, nokPerKwh) ||
                other.nokPerKwh == nokPerKwh) &&
            (identical(other.fromHour, fromHour) ||
                other.fromHour == fromHour) &&
            (identical(other.toHour, toHour) || other.toHour == toHour));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, nokPerKwh, fromHour, toHour);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ElectricityConsumptionImplCopyWith<_$ElectricityConsumptionImpl>
      get copyWith => __$$ElectricityConsumptionImplCopyWithImpl<
          _$ElectricityConsumptionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ElectricityConsumptionImplToJson(
      this,
    );
  }
}

abstract class _ElectricityConsumption extends ElectricityConsumption {
  const factory _ElectricityConsumption(
          {@JsonKey(name: 'NOK_per_kWh') required final double nokPerKwh,
          @JsonKey(name: 'from_hour') required final int fromHour,
          @JsonKey(name: 'to_hour') required final int toHour}) =
      _$ElectricityConsumptionImpl;
  const _ElectricityConsumption._() : super._();

  factory _ElectricityConsumption.fromJson(Map<String, dynamic> json) =
      _$ElectricityConsumptionImpl.fromJson;

  @override
  @JsonKey(name: 'NOK_per_kWh')
  double get nokPerKwh;
  @override
  @JsonKey(name: 'from_hour')
  int get fromHour;
  @override
  @JsonKey(name: 'to_hour')
  int get toHour;
  @override
  @JsonKey(ignore: true)
  _$$ElectricityConsumptionImplCopyWith<_$ElectricityConsumptionImpl>
      get copyWith => throw _privateConstructorUsedError;
}
