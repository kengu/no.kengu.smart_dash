// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'electricity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ElectricityPrice {
  @JsonKey(name: 'NOK_per_kWh')
  double get nokPerKwh;
  @JsonKey(name: 'EUR_per_kWh')
  double get eurPerKwh;
  @JsonKey(name: 'EXR')
  double get eurToNokRate;
  @JsonKey(name: 'time_start')
  DateTime get begin;
  @JsonKey(name: 'time_end')
  DateTime get end;

  /// Create a copy of ElectricityPrice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ElectricityPriceCopyWith<ElectricityPrice> get copyWith =>
      _$ElectricityPriceCopyWithImpl<ElectricityPrice>(
          this as ElectricityPrice, _$identity);

  /// Serializes this ElectricityPrice to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ElectricityPrice &&
            (identical(other.nokPerKwh, nokPerKwh) ||
                other.nokPerKwh == nokPerKwh) &&
            (identical(other.eurPerKwh, eurPerKwh) ||
                other.eurPerKwh == eurPerKwh) &&
            (identical(other.eurToNokRate, eurToNokRate) ||
                other.eurToNokRate == eurToNokRate) &&
            (identical(other.begin, begin) || other.begin == begin) &&
            (identical(other.end, end) || other.end == end));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, nokPerKwh, eurPerKwh, eurToNokRate, begin, end);

  @override
  String toString() {
    return 'ElectricityPrice(nokPerKwh: $nokPerKwh, eurPerKwh: $eurPerKwh, eurToNokRate: $eurToNokRate, begin: $begin, end: $end)';
  }
}

/// @nodoc
abstract mixin class $ElectricityPriceCopyWith<$Res> {
  factory $ElectricityPriceCopyWith(
          ElectricityPrice value, $Res Function(ElectricityPrice) _then) =
      _$ElectricityPriceCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'NOK_per_kWh') double nokPerKwh,
      @JsonKey(name: 'EUR_per_kWh') double eurPerKwh,
      @JsonKey(name: 'EXR') double eurToNokRate,
      @JsonKey(name: 'time_start') DateTime begin,
      @JsonKey(name: 'time_end') DateTime end});
}

/// @nodoc
class _$ElectricityPriceCopyWithImpl<$Res>
    implements $ElectricityPriceCopyWith<$Res> {
  _$ElectricityPriceCopyWithImpl(this._self, this._then);

  final ElectricityPrice _self;
  final $Res Function(ElectricityPrice) _then;

  /// Create a copy of ElectricityPrice
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nokPerKwh = null,
    Object? eurPerKwh = null,
    Object? eurToNokRate = null,
    Object? begin = null,
    Object? end = null,
  }) {
    return _then(_self.copyWith(
      nokPerKwh: null == nokPerKwh
          ? _self.nokPerKwh
          : nokPerKwh // ignore: cast_nullable_to_non_nullable
              as double,
      eurPerKwh: null == eurPerKwh
          ? _self.eurPerKwh
          : eurPerKwh // ignore: cast_nullable_to_non_nullable
              as double,
      eurToNokRate: null == eurToNokRate
          ? _self.eurToNokRate
          : eurToNokRate // ignore: cast_nullable_to_non_nullable
              as double,
      begin: null == begin
          ? _self.begin
          : begin // ignore: cast_nullable_to_non_nullable
              as DateTime,
      end: null == end
          ? _self.end
          : end // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ElectricityPrice extends ElectricityPrice {
  const _ElectricityPrice(
      {@JsonKey(name: 'NOK_per_kWh') required this.nokPerKwh,
      @JsonKey(name: 'EUR_per_kWh') required this.eurPerKwh,
      @JsonKey(name: 'EXR') required this.eurToNokRate,
      @JsonKey(name: 'time_start') required this.begin,
      @JsonKey(name: 'time_end') required this.end})
      : super._();
  factory _ElectricityPrice.fromJson(Map<String, dynamic> json) =>
      _$ElectricityPriceFromJson(json);

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

  /// Create a copy of ElectricityPrice
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ElectricityPriceCopyWith<_ElectricityPrice> get copyWith =>
      __$ElectricityPriceCopyWithImpl<_ElectricityPrice>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ElectricityPriceToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ElectricityPrice &&
            (identical(other.nokPerKwh, nokPerKwh) ||
                other.nokPerKwh == nokPerKwh) &&
            (identical(other.eurPerKwh, eurPerKwh) ||
                other.eurPerKwh == eurPerKwh) &&
            (identical(other.eurToNokRate, eurToNokRate) ||
                other.eurToNokRate == eurToNokRate) &&
            (identical(other.begin, begin) || other.begin == begin) &&
            (identical(other.end, end) || other.end == end));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, nokPerKwh, eurPerKwh, eurToNokRate, begin, end);

  @override
  String toString() {
    return 'ElectricityPrice(nokPerKwh: $nokPerKwh, eurPerKwh: $eurPerKwh, eurToNokRate: $eurToNokRate, begin: $begin, end: $end)';
  }
}

/// @nodoc
abstract mixin class _$ElectricityPriceCopyWith<$Res>
    implements $ElectricityPriceCopyWith<$Res> {
  factory _$ElectricityPriceCopyWith(
          _ElectricityPrice value, $Res Function(_ElectricityPrice) _then) =
      __$ElectricityPriceCopyWithImpl;
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
class __$ElectricityPriceCopyWithImpl<$Res>
    implements _$ElectricityPriceCopyWith<$Res> {
  __$ElectricityPriceCopyWithImpl(this._self, this._then);

  final _ElectricityPrice _self;
  final $Res Function(_ElectricityPrice) _then;

  /// Create a copy of ElectricityPrice
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? nokPerKwh = null,
    Object? eurPerKwh = null,
    Object? eurToNokRate = null,
    Object? begin = null,
    Object? end = null,
  }) {
    return _then(_ElectricityPrice(
      nokPerKwh: null == nokPerKwh
          ? _self.nokPerKwh
          : nokPerKwh // ignore: cast_nullable_to_non_nullable
              as double,
      eurPerKwh: null == eurPerKwh
          ? _self.eurPerKwh
          : eurPerKwh // ignore: cast_nullable_to_non_nullable
              as double,
      eurToNokRate: null == eurToNokRate
          ? _self.eurToNokRate
          : eurToNokRate // ignore: cast_nullable_to_non_nullable
              as double,
      begin: null == begin
          ? _self.begin
          : begin // ignore: cast_nullable_to_non_nullable
              as DateTime,
      end: null == end
          ? _self.end
          : end // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
mixin _$ElectricityTariff {
  String get provider;
  DateTime get validUntil;
  List<ElectricityCapacity> get capacity;
  List<ElectricityConsumption> get consumption;

  /// Create a copy of ElectricityTariff
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ElectricityTariffCopyWith<ElectricityTariff> get copyWith =>
      _$ElectricityTariffCopyWithImpl<ElectricityTariff>(
          this as ElectricityTariff, _$identity);

  /// Serializes this ElectricityTariff to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ElectricityTariff &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            (identical(other.validUntil, validUntil) ||
                other.validUntil == validUntil) &&
            const DeepCollectionEquality().equals(other.capacity, capacity) &&
            const DeepCollectionEquality()
                .equals(other.consumption, consumption));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      provider,
      validUntil,
      const DeepCollectionEquality().hash(capacity),
      const DeepCollectionEquality().hash(consumption));

  @override
  String toString() {
    return 'ElectricityTariff(provider: $provider, validUntil: $validUntil, capacity: $capacity, consumption: $consumption)';
  }
}

/// @nodoc
abstract mixin class $ElectricityTariffCopyWith<$Res> {
  factory $ElectricityTariffCopyWith(
          ElectricityTariff value, $Res Function(ElectricityTariff) _then) =
      _$ElectricityTariffCopyWithImpl;
  @useResult
  $Res call(
      {String provider,
      DateTime validUntil,
      List<ElectricityCapacity> capacity,
      List<ElectricityConsumption> consumption});
}

/// @nodoc
class _$ElectricityTariffCopyWithImpl<$Res>
    implements $ElectricityTariffCopyWith<$Res> {
  _$ElectricityTariffCopyWithImpl(this._self, this._then);

  final ElectricityTariff _self;
  final $Res Function(ElectricityTariff) _then;

  /// Create a copy of ElectricityTariff
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? provider = null,
    Object? validUntil = null,
    Object? capacity = null,
    Object? consumption = null,
  }) {
    return _then(_self.copyWith(
      provider: null == provider
          ? _self.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String,
      validUntil: null == validUntil
          ? _self.validUntil
          : validUntil // ignore: cast_nullable_to_non_nullable
              as DateTime,
      capacity: null == capacity
          ? _self.capacity
          : capacity // ignore: cast_nullable_to_non_nullable
              as List<ElectricityCapacity>,
      consumption: null == consumption
          ? _self.consumption
          : consumption // ignore: cast_nullable_to_non_nullable
              as List<ElectricityConsumption>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ElectricityTariff extends ElectricityTariff {
  const _ElectricityTariff(
      {required this.provider,
      required this.validUntil,
      required final List<ElectricityCapacity> capacity,
      required final List<ElectricityConsumption> consumption})
      : _capacity = capacity,
        _consumption = consumption,
        super._();
  factory _ElectricityTariff.fromJson(Map<String, dynamic> json) =>
      _$ElectricityTariffFromJson(json);

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

  /// Create a copy of ElectricityTariff
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ElectricityTariffCopyWith<_ElectricityTariff> get copyWith =>
      __$ElectricityTariffCopyWithImpl<_ElectricityTariff>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ElectricityTariffToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ElectricityTariff &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            (identical(other.validUntil, validUntil) ||
                other.validUntil == validUntil) &&
            const DeepCollectionEquality().equals(other._capacity, _capacity) &&
            const DeepCollectionEquality()
                .equals(other._consumption, _consumption));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      provider,
      validUntil,
      const DeepCollectionEquality().hash(_capacity),
      const DeepCollectionEquality().hash(_consumption));

  @override
  String toString() {
    return 'ElectricityTariff(provider: $provider, validUntil: $validUntil, capacity: $capacity, consumption: $consumption)';
  }
}

/// @nodoc
abstract mixin class _$ElectricityTariffCopyWith<$Res>
    implements $ElectricityTariffCopyWith<$Res> {
  factory _$ElectricityTariffCopyWith(
          _ElectricityTariff value, $Res Function(_ElectricityTariff) _then) =
      __$ElectricityTariffCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String provider,
      DateTime validUntil,
      List<ElectricityCapacity> capacity,
      List<ElectricityConsumption> consumption});
}

/// @nodoc
class __$ElectricityTariffCopyWithImpl<$Res>
    implements _$ElectricityTariffCopyWith<$Res> {
  __$ElectricityTariffCopyWithImpl(this._self, this._then);

  final _ElectricityTariff _self;
  final $Res Function(_ElectricityTariff) _then;

  /// Create a copy of ElectricityTariff
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? provider = null,
    Object? validUntil = null,
    Object? capacity = null,
    Object? consumption = null,
  }) {
    return _then(_ElectricityTariff(
      provider: null == provider
          ? _self.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String,
      validUntil: null == validUntil
          ? _self.validUntil
          : validUntil // ignore: cast_nullable_to_non_nullable
              as DateTime,
      capacity: null == capacity
          ? _self._capacity
          : capacity // ignore: cast_nullable_to_non_nullable
              as List<ElectricityCapacity>,
      consumption: null == consumption
          ? _self._consumption
          : consumption // ignore: cast_nullable_to_non_nullable
              as List<ElectricityConsumption>,
    ));
  }
}

/// @nodoc
mixin _$ElectricityCapacity {
  @JsonKey(name: 'from_kWh')
  double get fromKWh;
  @JsonKey(name: 'to_kWh')
  double get toKWh;
  @JsonKey(name: 'NOK_per_month')
  double get nokPerMonth;

  /// Create a copy of ElectricityCapacity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ElectricityCapacityCopyWith<ElectricityCapacity> get copyWith =>
      _$ElectricityCapacityCopyWithImpl<ElectricityCapacity>(
          this as ElectricityCapacity, _$identity);

  /// Serializes this ElectricityCapacity to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ElectricityCapacity &&
            (identical(other.fromKWh, fromKWh) || other.fromKWh == fromKWh) &&
            (identical(other.toKWh, toKWh) || other.toKWh == toKWh) &&
            (identical(other.nokPerMonth, nokPerMonth) ||
                other.nokPerMonth == nokPerMonth));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, fromKWh, toKWh, nokPerMonth);

  @override
  String toString() {
    return 'ElectricityCapacity(fromKWh: $fromKWh, toKWh: $toKWh, nokPerMonth: $nokPerMonth)';
  }
}

/// @nodoc
abstract mixin class $ElectricityCapacityCopyWith<$Res> {
  factory $ElectricityCapacityCopyWith(
          ElectricityCapacity value, $Res Function(ElectricityCapacity) _then) =
      _$ElectricityCapacityCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'from_kWh') double fromKWh,
      @JsonKey(name: 'to_kWh') double toKWh,
      @JsonKey(name: 'NOK_per_month') double nokPerMonth});
}

/// @nodoc
class _$ElectricityCapacityCopyWithImpl<$Res>
    implements $ElectricityCapacityCopyWith<$Res> {
  _$ElectricityCapacityCopyWithImpl(this._self, this._then);

  final ElectricityCapacity _self;
  final $Res Function(ElectricityCapacity) _then;

  /// Create a copy of ElectricityCapacity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fromKWh = null,
    Object? toKWh = null,
    Object? nokPerMonth = null,
  }) {
    return _then(_self.copyWith(
      fromKWh: null == fromKWh
          ? _self.fromKWh
          : fromKWh // ignore: cast_nullable_to_non_nullable
              as double,
      toKWh: null == toKWh
          ? _self.toKWh
          : toKWh // ignore: cast_nullable_to_non_nullable
              as double,
      nokPerMonth: null == nokPerMonth
          ? _self.nokPerMonth
          : nokPerMonth // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ElectricityCapacity extends ElectricityCapacity {
  const _ElectricityCapacity(
      {@JsonKey(name: 'from_kWh') required this.fromKWh,
      @JsonKey(name: 'to_kWh') required this.toKWh,
      @JsonKey(name: 'NOK_per_month') required this.nokPerMonth})
      : super._();
  factory _ElectricityCapacity.fromJson(Map<String, dynamic> json) =>
      _$ElectricityCapacityFromJson(json);

  @override
  @JsonKey(name: 'from_kWh')
  final double fromKWh;
  @override
  @JsonKey(name: 'to_kWh')
  final double toKWh;
  @override
  @JsonKey(name: 'NOK_per_month')
  final double nokPerMonth;

  /// Create a copy of ElectricityCapacity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ElectricityCapacityCopyWith<_ElectricityCapacity> get copyWith =>
      __$ElectricityCapacityCopyWithImpl<_ElectricityCapacity>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ElectricityCapacityToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ElectricityCapacity &&
            (identical(other.fromKWh, fromKWh) || other.fromKWh == fromKWh) &&
            (identical(other.toKWh, toKWh) || other.toKWh == toKWh) &&
            (identical(other.nokPerMonth, nokPerMonth) ||
                other.nokPerMonth == nokPerMonth));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, fromKWh, toKWh, nokPerMonth);

  @override
  String toString() {
    return 'ElectricityCapacity(fromKWh: $fromKWh, toKWh: $toKWh, nokPerMonth: $nokPerMonth)';
  }
}

/// @nodoc
abstract mixin class _$ElectricityCapacityCopyWith<$Res>
    implements $ElectricityCapacityCopyWith<$Res> {
  factory _$ElectricityCapacityCopyWith(_ElectricityCapacity value,
          $Res Function(_ElectricityCapacity) _then) =
      __$ElectricityCapacityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'from_kWh') double fromKWh,
      @JsonKey(name: 'to_kWh') double toKWh,
      @JsonKey(name: 'NOK_per_month') double nokPerMonth});
}

/// @nodoc
class __$ElectricityCapacityCopyWithImpl<$Res>
    implements _$ElectricityCapacityCopyWith<$Res> {
  __$ElectricityCapacityCopyWithImpl(this._self, this._then);

  final _ElectricityCapacity _self;
  final $Res Function(_ElectricityCapacity) _then;

  /// Create a copy of ElectricityCapacity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? fromKWh = null,
    Object? toKWh = null,
    Object? nokPerMonth = null,
  }) {
    return _then(_ElectricityCapacity(
      fromKWh: null == fromKWh
          ? _self.fromKWh
          : fromKWh // ignore: cast_nullable_to_non_nullable
              as double,
      toKWh: null == toKWh
          ? _self.toKWh
          : toKWh // ignore: cast_nullable_to_non_nullable
              as double,
      nokPerMonth: null == nokPerMonth
          ? _self.nokPerMonth
          : nokPerMonth // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
mixin _$ElectricityConsumption {
  @JsonKey(name: 'NOK_per_kWh')
  double get nokPerKwh;
  @JsonKey(name: 'from_hour')
  int get fromHour;
  @JsonKey(name: 'to_hour')
  int get toHour;

  /// Create a copy of ElectricityConsumption
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ElectricityConsumptionCopyWith<ElectricityConsumption> get copyWith =>
      _$ElectricityConsumptionCopyWithImpl<ElectricityConsumption>(
          this as ElectricityConsumption, _$identity);

  /// Serializes this ElectricityConsumption to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ElectricityConsumption &&
            (identical(other.nokPerKwh, nokPerKwh) ||
                other.nokPerKwh == nokPerKwh) &&
            (identical(other.fromHour, fromHour) ||
                other.fromHour == fromHour) &&
            (identical(other.toHour, toHour) || other.toHour == toHour));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, nokPerKwh, fromHour, toHour);

  @override
  String toString() {
    return 'ElectricityConsumption(nokPerKwh: $nokPerKwh, fromHour: $fromHour, toHour: $toHour)';
  }
}

/// @nodoc
abstract mixin class $ElectricityConsumptionCopyWith<$Res> {
  factory $ElectricityConsumptionCopyWith(ElectricityConsumption value,
          $Res Function(ElectricityConsumption) _then) =
      _$ElectricityConsumptionCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'NOK_per_kWh') double nokPerKwh,
      @JsonKey(name: 'from_hour') int fromHour,
      @JsonKey(name: 'to_hour') int toHour});
}

/// @nodoc
class _$ElectricityConsumptionCopyWithImpl<$Res>
    implements $ElectricityConsumptionCopyWith<$Res> {
  _$ElectricityConsumptionCopyWithImpl(this._self, this._then);

  final ElectricityConsumption _self;
  final $Res Function(ElectricityConsumption) _then;

  /// Create a copy of ElectricityConsumption
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nokPerKwh = null,
    Object? fromHour = null,
    Object? toHour = null,
  }) {
    return _then(_self.copyWith(
      nokPerKwh: null == nokPerKwh
          ? _self.nokPerKwh
          : nokPerKwh // ignore: cast_nullable_to_non_nullable
              as double,
      fromHour: null == fromHour
          ? _self.fromHour
          : fromHour // ignore: cast_nullable_to_non_nullable
              as int,
      toHour: null == toHour
          ? _self.toHour
          : toHour // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ElectricityConsumption extends ElectricityConsumption {
  const _ElectricityConsumption(
      {@JsonKey(name: 'NOK_per_kWh') required this.nokPerKwh,
      @JsonKey(name: 'from_hour') required this.fromHour,
      @JsonKey(name: 'to_hour') required this.toHour})
      : super._();
  factory _ElectricityConsumption.fromJson(Map<String, dynamic> json) =>
      _$ElectricityConsumptionFromJson(json);

  @override
  @JsonKey(name: 'NOK_per_kWh')
  final double nokPerKwh;
  @override
  @JsonKey(name: 'from_hour')
  final int fromHour;
  @override
  @JsonKey(name: 'to_hour')
  final int toHour;

  /// Create a copy of ElectricityConsumption
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ElectricityConsumptionCopyWith<_ElectricityConsumption> get copyWith =>
      __$ElectricityConsumptionCopyWithImpl<_ElectricityConsumption>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ElectricityConsumptionToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ElectricityConsumption &&
            (identical(other.nokPerKwh, nokPerKwh) ||
                other.nokPerKwh == nokPerKwh) &&
            (identical(other.fromHour, fromHour) ||
                other.fromHour == fromHour) &&
            (identical(other.toHour, toHour) || other.toHour == toHour));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, nokPerKwh, fromHour, toHour);

  @override
  String toString() {
    return 'ElectricityConsumption(nokPerKwh: $nokPerKwh, fromHour: $fromHour, toHour: $toHour)';
  }
}

/// @nodoc
abstract mixin class _$ElectricityConsumptionCopyWith<$Res>
    implements $ElectricityConsumptionCopyWith<$Res> {
  factory _$ElectricityConsumptionCopyWith(_ElectricityConsumption value,
          $Res Function(_ElectricityConsumption) _then) =
      __$ElectricityConsumptionCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'NOK_per_kWh') double nokPerKwh,
      @JsonKey(name: 'from_hour') int fromHour,
      @JsonKey(name: 'to_hour') int toHour});
}

/// @nodoc
class __$ElectricityConsumptionCopyWithImpl<$Res>
    implements _$ElectricityConsumptionCopyWith<$Res> {
  __$ElectricityConsumptionCopyWithImpl(this._self, this._then);

  final _ElectricityConsumption _self;
  final $Res Function(_ElectricityConsumption) _then;

  /// Create a copy of ElectricityConsumption
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? nokPerKwh = null,
    Object? fromHour = null,
    Object? toHour = null,
  }) {
    return _then(_ElectricityConsumption(
      nokPerKwh: null == nokPerKwh
          ? _self.nokPerKwh
          : nokPerKwh // ignore: cast_nullable_to_non_nullable
              as double,
      fromHour: null == fromHour
          ? _self.fromHour
          : fromHour // ignore: cast_nullable_to_non_nullable
              as int,
      toHour: null == toHour
          ? _self.toHour
          : toHour // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
