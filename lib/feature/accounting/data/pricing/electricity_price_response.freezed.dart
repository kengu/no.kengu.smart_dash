// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'electricity_price_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ElectricityPriceResponse _$ElectricityPriceResponseFromJson(
    Map<String, dynamic> json) {
  return _ElectricityPriceResponse.fromJson(json);
}

/// @nodoc
mixin _$ElectricityPriceResponse {
  @JsonKey(name: 'data')
  List<ElectricityPrice> get prices => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ElectricityPriceResponseCopyWith<ElectricityPriceResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ElectricityPriceResponseCopyWith<$Res> {
  factory $ElectricityPriceResponseCopyWith(ElectricityPriceResponse value,
          $Res Function(ElectricityPriceResponse) then) =
      _$ElectricityPriceResponseCopyWithImpl<$Res, ElectricityPriceResponse>;
  @useResult
  $Res call({@JsonKey(name: 'data') List<ElectricityPrice> prices});
}

/// @nodoc
class _$ElectricityPriceResponseCopyWithImpl<$Res,
        $Val extends ElectricityPriceResponse>
    implements $ElectricityPriceResponseCopyWith<$Res> {
  _$ElectricityPriceResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? prices = null,
  }) {
    return _then(_value.copyWith(
      prices: null == prices
          ? _value.prices
          : prices // ignore: cast_nullable_to_non_nullable
              as List<ElectricityPrice>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ElectricityPriceResponseImplCopyWith<$Res>
    implements $ElectricityPriceResponseCopyWith<$Res> {
  factory _$$ElectricityPriceResponseImplCopyWith(
          _$ElectricityPriceResponseImpl value,
          $Res Function(_$ElectricityPriceResponseImpl) then) =
      __$$ElectricityPriceResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'data') List<ElectricityPrice> prices});
}

/// @nodoc
class __$$ElectricityPriceResponseImplCopyWithImpl<$Res>
    extends _$ElectricityPriceResponseCopyWithImpl<$Res,
        _$ElectricityPriceResponseImpl>
    implements _$$ElectricityPriceResponseImplCopyWith<$Res> {
  __$$ElectricityPriceResponseImplCopyWithImpl(
      _$ElectricityPriceResponseImpl _value,
      $Res Function(_$ElectricityPriceResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? prices = null,
  }) {
    return _then(_$ElectricityPriceResponseImpl(
      prices: null == prices
          ? _value._prices
          : prices // ignore: cast_nullable_to_non_nullable
              as List<ElectricityPrice>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ElectricityPriceResponseImpl implements _ElectricityPriceResponse {
  const _$ElectricityPriceResponseImpl(
      {@JsonKey(name: 'data') required final List<ElectricityPrice> prices})
      : _prices = prices;

  factory _$ElectricityPriceResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ElectricityPriceResponseImplFromJson(json);

  final List<ElectricityPrice> _prices;
  @override
  @JsonKey(name: 'data')
  List<ElectricityPrice> get prices {
    if (_prices is EqualUnmodifiableListView) return _prices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_prices);
  }

  @override
  String toString() {
    return 'ElectricityPriceResponse(prices: $prices)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ElectricityPriceResponseImpl &&
            const DeepCollectionEquality().equals(other._prices, _prices));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_prices));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ElectricityPriceResponseImplCopyWith<_$ElectricityPriceResponseImpl>
      get copyWith => __$$ElectricityPriceResponseImplCopyWithImpl<
          _$ElectricityPriceResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ElectricityPriceResponseImplToJson(
      this,
    );
  }
}

abstract class _ElectricityPriceResponse implements ElectricityPriceResponse {
  const factory _ElectricityPriceResponse(
          {@JsonKey(name: 'data')
          required final List<ElectricityPrice> prices}) =
      _$ElectricityPriceResponseImpl;

  factory _ElectricityPriceResponse.fromJson(Map<String, dynamic> json) =
      _$ElectricityPriceResponseImpl.fromJson;

  @override
  @JsonKey(name: 'data')
  List<ElectricityPrice> get prices;
  @override
  @JsonKey(ignore: true)
  _$$ElectricityPriceResponseImplCopyWith<_$ElectricityPriceResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
