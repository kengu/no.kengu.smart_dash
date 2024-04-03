// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Location _$LocationFromJson(Map<String, dynamic> json) {
  return _Location.fromJson(json);
}

/// @nodoc
mixin _$Location {
  /// Location service
  @JsonKey(name: 'service')
  String? get service => throw _privateConstructorUsedError;

  /// Location longitude
  @JsonKey(name: 'lon')
  double get lon => throw _privateConstructorUsedError;

  /// Location latitude
  @JsonKey(name: 'lat')
  double get lat => throw _privateConstructorUsedError;

  /// Location name
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;

  /// Location in city
  @JsonKey(name: 'city')
  String? get city => throw _privateConstructorUsedError;

  /// Location in city
  @JsonKey(name: 'state')
  String? get state => throw _privateConstructorUsedError;

  /// Location at street name and number
  @JsonKey(name: 'street')
  String? get street => throw _privateConstructorUsedError;

  /// Location at municipality
  @JsonKey(name: 'municipality')
  String? get municipality => throw _privateConstructorUsedError;

  /// Location in county
  @JsonKey(name: 'county')
  String? get county => throw _privateConstructorUsedError;

  /// Location in country
  @JsonKey(name: 'country')
  String? get country => throw _privateConstructorUsedError;

  /// Location in postalCode
  @JsonKey(name: 'postalCode')
  String? get postalCode => throw _privateConstructorUsedError;

  /// Other location data
  @JsonKey(name: 'data')
  Map<String, Object?>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocationCopyWith<Location> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationCopyWith<$Res> {
  factory $LocationCopyWith(Location value, $Res Function(Location) then) =
      _$LocationCopyWithImpl<$Res, Location>;
  @useResult
  $Res call(
      {@JsonKey(name: 'service') String? service,
      @JsonKey(name: 'lon') double lon,
      @JsonKey(name: 'lat') double lat,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'city') String? city,
      @JsonKey(name: 'state') String? state,
      @JsonKey(name: 'street') String? street,
      @JsonKey(name: 'municipality') String? municipality,
      @JsonKey(name: 'county') String? county,
      @JsonKey(name: 'country') String? country,
      @JsonKey(name: 'postalCode') String? postalCode,
      @JsonKey(name: 'data') Map<String, Object?>? data});
}

/// @nodoc
class _$LocationCopyWithImpl<$Res, $Val extends Location>
    implements $LocationCopyWith<$Res> {
  _$LocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? service = freezed,
    Object? lon = null,
    Object? lat = null,
    Object? name = freezed,
    Object? city = freezed,
    Object? state = freezed,
    Object? street = freezed,
    Object? municipality = freezed,
    Object? county = freezed,
    Object? country = freezed,
    Object? postalCode = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      service: freezed == service
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as String?,
      lon: null == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      street: freezed == street
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String?,
      municipality: freezed == municipality
          ? _value.municipality
          : municipality // ignore: cast_nullable_to_non_nullable
              as String?,
      county: freezed == county
          ? _value.county
          : county // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      postalCode: freezed == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, Object?>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LocationImplCopyWith<$Res>
    implements $LocationCopyWith<$Res> {
  factory _$$LocationImplCopyWith(
          _$LocationImpl value, $Res Function(_$LocationImpl) then) =
      __$$LocationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'service') String? service,
      @JsonKey(name: 'lon') double lon,
      @JsonKey(name: 'lat') double lat,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'city') String? city,
      @JsonKey(name: 'state') String? state,
      @JsonKey(name: 'street') String? street,
      @JsonKey(name: 'municipality') String? municipality,
      @JsonKey(name: 'county') String? county,
      @JsonKey(name: 'country') String? country,
      @JsonKey(name: 'postalCode') String? postalCode,
      @JsonKey(name: 'data') Map<String, Object?>? data});
}

/// @nodoc
class __$$LocationImplCopyWithImpl<$Res>
    extends _$LocationCopyWithImpl<$Res, _$LocationImpl>
    implements _$$LocationImplCopyWith<$Res> {
  __$$LocationImplCopyWithImpl(
      _$LocationImpl _value, $Res Function(_$LocationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? service = freezed,
    Object? lon = null,
    Object? lat = null,
    Object? name = freezed,
    Object? city = freezed,
    Object? state = freezed,
    Object? street = freezed,
    Object? municipality = freezed,
    Object? county = freezed,
    Object? country = freezed,
    Object? postalCode = freezed,
    Object? data = freezed,
  }) {
    return _then(_$LocationImpl(
      service: freezed == service
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as String?,
      lon: null == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      street: freezed == street
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String?,
      municipality: freezed == municipality
          ? _value.municipality
          : municipality // ignore: cast_nullable_to_non_nullable
              as String?,
      county: freezed == county
          ? _value.county
          : county // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      postalCode: freezed == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, Object?>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LocationImpl extends _Location {
  const _$LocationImpl(
      {@JsonKey(name: 'service') this.service,
      @JsonKey(name: 'lon') required this.lon,
      @JsonKey(name: 'lat') required this.lat,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'city') this.city,
      @JsonKey(name: 'state') this.state,
      @JsonKey(name: 'street') this.street,
      @JsonKey(name: 'municipality') this.municipality,
      @JsonKey(name: 'county') this.county,
      @JsonKey(name: 'country') this.country,
      @JsonKey(name: 'postalCode') this.postalCode,
      @JsonKey(name: 'data') final Map<String, Object?>? data})
      : _data = data,
        super._();

  factory _$LocationImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocationImplFromJson(json);

  /// Location service
  @override
  @JsonKey(name: 'service')
  final String? service;

  /// Location longitude
  @override
  @JsonKey(name: 'lon')
  final double lon;

  /// Location latitude
  @override
  @JsonKey(name: 'lat')
  final double lat;

  /// Location name
  @override
  @JsonKey(name: 'name')
  final String? name;

  /// Location in city
  @override
  @JsonKey(name: 'city')
  final String? city;

  /// Location in city
  @override
  @JsonKey(name: 'state')
  final String? state;

  /// Location at street name and number
  @override
  @JsonKey(name: 'street')
  final String? street;

  /// Location at municipality
  @override
  @JsonKey(name: 'municipality')
  final String? municipality;

  /// Location in county
  @override
  @JsonKey(name: 'county')
  final String? county;

  /// Location in country
  @override
  @JsonKey(name: 'country')
  final String? country;

  /// Location in postalCode
  @override
  @JsonKey(name: 'postalCode')
  final String? postalCode;

  /// Other location data
  final Map<String, Object?>? _data;

  /// Other location data
  @override
  @JsonKey(name: 'data')
  Map<String, Object?>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'Location(service: $service, lon: $lon, lat: $lat, name: $name, city: $city, state: $state, street: $street, municipality: $municipality, county: $county, country: $country, postalCode: $postalCode, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationImpl &&
            (identical(other.service, service) || other.service == service) &&
            (identical(other.lon, lon) || other.lon == lon) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.street, street) || other.street == street) &&
            (identical(other.municipality, municipality) ||
                other.municipality == municipality) &&
            (identical(other.county, county) || other.county == county) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.postalCode, postalCode) ||
                other.postalCode == postalCode) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      service,
      lon,
      lat,
      name,
      city,
      state,
      street,
      municipality,
      county,
      country,
      postalCode,
      const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationImplCopyWith<_$LocationImpl> get copyWith =>
      __$$LocationImplCopyWithImpl<_$LocationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocationImplToJson(
      this,
    );
  }
}

abstract class _Location extends Location {
  const factory _Location(
          {@JsonKey(name: 'service') final String? service,
          @JsonKey(name: 'lon') required final double lon,
          @JsonKey(name: 'lat') required final double lat,
          @JsonKey(name: 'name') final String? name,
          @JsonKey(name: 'city') final String? city,
          @JsonKey(name: 'state') final String? state,
          @JsonKey(name: 'street') final String? street,
          @JsonKey(name: 'municipality') final String? municipality,
          @JsonKey(name: 'county') final String? county,
          @JsonKey(name: 'country') final String? country,
          @JsonKey(name: 'postalCode') final String? postalCode,
          @JsonKey(name: 'data') final Map<String, Object?>? data}) =
      _$LocationImpl;
  const _Location._() : super._();

  factory _Location.fromJson(Map<String, dynamic> json) =
      _$LocationImpl.fromJson;

  @override

  /// Location service
  @JsonKey(name: 'service')
  String? get service;
  @override

  /// Location longitude
  @JsonKey(name: 'lon')
  double get lon;
  @override

  /// Location latitude
  @JsonKey(name: 'lat')
  double get lat;
  @override

  /// Location name
  @JsonKey(name: 'name')
  String? get name;
  @override

  /// Location in city
  @JsonKey(name: 'city')
  String? get city;
  @override

  /// Location in city
  @JsonKey(name: 'state')
  String? get state;
  @override

  /// Location at street name and number
  @JsonKey(name: 'street')
  String? get street;
  @override

  /// Location at municipality
  @JsonKey(name: 'municipality')
  String? get municipality;
  @override

  /// Location in county
  @JsonKey(name: 'county')
  String? get county;
  @override

  /// Location in country
  @JsonKey(name: 'country')
  String? get country;
  @override

  /// Location in postalCode
  @JsonKey(name: 'postalCode')
  String? get postalCode;
  @override

  /// Other location data
  @JsonKey(name: 'data')
  Map<String, Object?>? get data;
  @override
  @JsonKey(ignore: true)
  _$$LocationImplCopyWith<_$LocationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
