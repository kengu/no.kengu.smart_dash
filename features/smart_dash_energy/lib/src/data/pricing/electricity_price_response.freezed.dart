// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'electricity_price_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ElectricityPriceResponse {
  @JsonKey(name: 'data')
  List<ElectricityPrice> get prices;

  /// Create a copy of ElectricityPriceResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ElectricityPriceResponseCopyWith<ElectricityPriceResponse> get copyWith =>
      _$ElectricityPriceResponseCopyWithImpl<ElectricityPriceResponse>(
          this as ElectricityPriceResponse, _$identity);

  /// Serializes this ElectricityPriceResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ElectricityPriceResponse &&
            const DeepCollectionEquality().equals(other.prices, prices));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(prices));

  @override
  String toString() {
    return 'ElectricityPriceResponse(prices: $prices)';
  }
}

/// @nodoc
abstract mixin class $ElectricityPriceResponseCopyWith<$Res> {
  factory $ElectricityPriceResponseCopyWith(ElectricityPriceResponse value,
          $Res Function(ElectricityPriceResponse) _then) =
      _$ElectricityPriceResponseCopyWithImpl;
  @useResult
  $Res call({@JsonKey(name: 'data') List<ElectricityPrice> prices});
}

/// @nodoc
class _$ElectricityPriceResponseCopyWithImpl<$Res>
    implements $ElectricityPriceResponseCopyWith<$Res> {
  _$ElectricityPriceResponseCopyWithImpl(this._self, this._then);

  final ElectricityPriceResponse _self;
  final $Res Function(ElectricityPriceResponse) _then;

  /// Create a copy of ElectricityPriceResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? prices = null,
  }) {
    return _then(_self.copyWith(
      prices: null == prices
          ? _self.prices
          : prices // ignore: cast_nullable_to_non_nullable
              as List<ElectricityPrice>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ElectricityPriceResponse implements ElectricityPriceResponse {
  const _ElectricityPriceResponse(
      {@JsonKey(name: 'data') required final List<ElectricityPrice> prices})
      : _prices = prices;
  factory _ElectricityPriceResponse.fromJson(Map<String, dynamic> json) =>
      _$ElectricityPriceResponseFromJson(json);

  final List<ElectricityPrice> _prices;
  @override
  @JsonKey(name: 'data')
  List<ElectricityPrice> get prices {
    if (_prices is EqualUnmodifiableListView) return _prices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_prices);
  }

  /// Create a copy of ElectricityPriceResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ElectricityPriceResponseCopyWith<_ElectricityPriceResponse> get copyWith =>
      __$ElectricityPriceResponseCopyWithImpl<_ElectricityPriceResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ElectricityPriceResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ElectricityPriceResponse &&
            const DeepCollectionEquality().equals(other._prices, _prices));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_prices));

  @override
  String toString() {
    return 'ElectricityPriceResponse(prices: $prices)';
  }
}

/// @nodoc
abstract mixin class _$ElectricityPriceResponseCopyWith<$Res>
    implements $ElectricityPriceResponseCopyWith<$Res> {
  factory _$ElectricityPriceResponseCopyWith(_ElectricityPriceResponse value,
          $Res Function(_ElectricityPriceResponse) _then) =
      __$ElectricityPriceResponseCopyWithImpl;
  @override
  @useResult
  $Res call({@JsonKey(name: 'data') List<ElectricityPrice> prices});
}

/// @nodoc
class __$ElectricityPriceResponseCopyWithImpl<$Res>
    implements _$ElectricityPriceResponseCopyWith<$Res> {
  __$ElectricityPriceResponseCopyWithImpl(this._self, this._then);

  final _ElectricityPriceResponse _self;
  final $Res Function(_ElectricityPriceResponse) _then;

  /// Create a copy of ElectricityPriceResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? prices = null,
  }) {
    return _then(_ElectricityPriceResponse(
      prices: null == prices
          ? _self._prices
          : prices // ignore: cast_nullable_to_non_nullable
              as List<ElectricityPrice>,
    ));
  }
}

// dart format on
