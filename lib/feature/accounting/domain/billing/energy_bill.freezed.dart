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
  ElectricityPrice get base => throw _privateConstructorUsedError;
  double get energy => throw _privateConstructorUsedError;
  DateTime get begin => throw _privateConstructorUsedError;
  DateTime get end => throw _privateConstructorUsedError;

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
      {ElectricityPrice base, double energy, DateTime begin, DateTime end});

  $ElectricityPriceCopyWith<$Res> get base;
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
    Object? base = null,
    Object? energy = null,
    Object? begin = null,
    Object? end = null,
  }) {
    return _then(_value.copyWith(
      base: null == base
          ? _value.base
          : base // ignore: cast_nullable_to_non_nullable
              as ElectricityPrice,
      energy: null == energy
          ? _value.energy
          : energy // ignore: cast_nullable_to_non_nullable
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

  @override
  @pragma('vm:prefer-inline')
  $ElectricityPriceCopyWith<$Res> get base {
    return $ElectricityPriceCopyWith<$Res>(_value.base, (value) {
      return _then(_value.copyWith(base: value) as $Val);
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
      {ElectricityPrice base, double energy, DateTime begin, DateTime end});

  @override
  $ElectricityPriceCopyWith<$Res> get base;
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
    Object? base = null,
    Object? energy = null,
    Object? begin = null,
    Object? end = null,
  }) {
    return _then(_$EnergyBillImpl(
      base: null == base
          ? _value.base
          : base // ignore: cast_nullable_to_non_nullable
              as ElectricityPrice,
      energy: null == energy
          ? _value.energy
          : energy // ignore: cast_nullable_to_non_nullable
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
class _$EnergyBillImpl extends _EnergyBill {
  const _$EnergyBillImpl(
      {required this.base,
      required this.energy,
      required this.begin,
      required this.end})
      : super._();

  factory _$EnergyBillImpl.fromJson(Map<String, dynamic> json) =>
      _$$EnergyBillImplFromJson(json);

  @override
  final ElectricityPrice base;
  @override
  final double energy;
  @override
  final DateTime begin;
  @override
  final DateTime end;

  @override
  String toString() {
    return 'EnergyBill(base: $base, energy: $energy, begin: $begin, end: $end)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EnergyBillImpl &&
            (identical(other.base, base) || other.base == base) &&
            (identical(other.energy, energy) || other.energy == energy) &&
            (identical(other.begin, begin) || other.begin == begin) &&
            (identical(other.end, end) || other.end == end));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, base, energy, begin, end);

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
      {required final ElectricityPrice base,
      required final double energy,
      required final DateTime begin,
      required final DateTime end}) = _$EnergyBillImpl;
  const _EnergyBill._() : super._();

  factory _EnergyBill.fromJson(Map<String, dynamic> json) =
      _$EnergyBillImpl.fromJson;

  @override
  ElectricityPrice get base;
  @override
  double get energy;
  @override
  DateTime get begin;
  @override
  DateTime get end;
  @override
  @JsonKey(ignore: true)
  _$$EnergyBillImplCopyWith<_$EnergyBillImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
