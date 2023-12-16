// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'electricity_price.dart';

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
  bool operator ==(dynamic other) {
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
