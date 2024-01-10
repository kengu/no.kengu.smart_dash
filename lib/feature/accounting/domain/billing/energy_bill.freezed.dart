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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EnergyBill _$EnergyBillFromJson(Map<String, dynamic> json) {
  return _EnergyBill.fromJson(json);
}

/// @nodoc
mixin _$EnergyBill {
  int get vat => throw _privateConstructorUsedError;
  DateTime get end => throw _privateConstructorUsedError;
  DateTime get begin => throw _privateConstructorUsedError;
  double get energy => throw _privateConstructorUsedError;
  ElectricityPrice get price => throw _privateConstructorUsedError;
  ElectricityTariff get tariff => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EnergyBillCopyWith<EnergyBill> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EnergyBillCopyWith<$Res> {
  factory $EnergyBillCopyWith(
          EnergyBill value, $Res Function(EnergyBill) then) =
      _$EnergyBillCopyWithImpl<$Res, EnergyBill>;
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
class _$EnergyBillCopyWithImpl<$Res, $Val extends EnergyBill>
    implements $EnergyBillCopyWith<$Res> {
  _$EnergyBillCopyWithImpl(this._value, this._then);

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
abstract class _$$EnergyBillImplCopyWith<$Res>
    implements $EnergyBillCopyWith<$Res> {
  factory _$$EnergyBillImplCopyWith(
          _$EnergyBillImpl value, $Res Function(_$EnergyBillImpl) then) =
      __$$EnergyBillImplCopyWithImpl<$Res>;
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
class __$$EnergyBillImplCopyWithImpl<$Res>
    extends _$EnergyBillCopyWithImpl<$Res, _$EnergyBillImpl>
    implements _$$EnergyBillImplCopyWith<$Res> {
  __$$EnergyBillImplCopyWithImpl(
      _$EnergyBillImpl _value, $Res Function(_$EnergyBillImpl) _then)
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
    return _then(_$EnergyBillImpl(
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
class _$EnergyBillImpl extends _EnergyBill {
  const _$EnergyBillImpl(
      {required this.vat,
      required this.end,
      required this.begin,
      required this.energy,
      required this.price,
      required this.tariff})
      : super._();

  factory _$EnergyBillImpl.fromJson(Map<String, dynamic> json) =>
      _$$EnergyBillImplFromJson(json);

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
    return 'EnergyBill(vat: $vat, end: $end, begin: $begin, energy: $energy, price: $price, tariff: $tariff)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EnergyBillImpl &&
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
  _$$EnergyBillImplCopyWith<_$EnergyBillImpl> get copyWith =>
      __$$EnergyBillImplCopyWithImpl<_$EnergyBillImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EnergyBillImplToJson(
      this,
    );
  }
}

abstract class _EnergyBill extends EnergyBill {
  const factory _EnergyBill(
      {required final int vat,
      required final DateTime end,
      required final DateTime begin,
      required final double energy,
      required final ElectricityPrice price,
      required final ElectricityTariff tariff}) = _$EnergyBillImpl;
  const _EnergyBill._() : super._();

  factory _EnergyBill.fromJson(Map<String, dynamic> json) =
      _$EnergyBillImpl.fromJson;

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
  _$$EnergyBillImplCopyWith<_$EnergyBillImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
