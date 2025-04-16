// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Location {
  /// Location service
  @JsonKey(name: 'service')
  String? get service;

  /// Location longitude
  @JsonKey(name: 'lon')
  double get lon;

  /// Location latitude
  @JsonKey(name: 'lat')
  double get lat;

  /// Location name
  @JsonKey(name: 'name')
  String? get name;

  /// Location in city
  @JsonKey(name: 'city')
  String? get city;

  /// Location in city
  @JsonKey(name: 'state')
  String? get state;

  /// Location at street name and number
  @JsonKey(name: 'street')
  String? get street;

  /// Location at municipality
  @JsonKey(name: 'municipality')
  String? get municipality;

  /// Location in county
  @JsonKey(name: 'county')
  String? get county;

  /// Location in country
  @JsonKey(name: 'country')
  String? get country;

  /// Location in postalCode
  @JsonKey(name: 'postalCode')
  String? get postalCode;

  /// Other location data
  @JsonKey(name: 'data')
  Map<String, Object?>? get data;

  /// Create a copy of Location
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LocationCopyWith<Location> get copyWith =>
      _$LocationCopyWithImpl<Location>(this as Location, _$identity);

  /// Serializes this Location to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Location &&
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
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
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
      const DeepCollectionEquality().hash(data));

  @override
  String toString() {
    return 'Location(service: $service, lon: $lon, lat: $lat, name: $name, city: $city, state: $state, street: $street, municipality: $municipality, county: $county, country: $country, postalCode: $postalCode, data: $data)';
  }
}

/// @nodoc
abstract mixin class $LocationCopyWith<$Res> {
  factory $LocationCopyWith(Location value, $Res Function(Location) _then) =
      _$LocationCopyWithImpl;
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
class _$LocationCopyWithImpl<$Res> implements $LocationCopyWith<$Res> {
  _$LocationCopyWithImpl(this._self, this._then);

  final Location _self;
  final $Res Function(Location) _then;

  /// Create a copy of Location
  /// with the given fields replaced by the non-null parameter values.
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
    return _then(_self.copyWith(
      service: freezed == service
          ? _self.service
          : service // ignore: cast_nullable_to_non_nullable
              as String?,
      lon: null == lon
          ? _self.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double,
      lat: null == lat
          ? _self.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _self.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      street: freezed == street
          ? _self.street
          : street // ignore: cast_nullable_to_non_nullable
              as String?,
      municipality: freezed == municipality
          ? _self.municipality
          : municipality // ignore: cast_nullable_to_non_nullable
              as String?,
      county: freezed == county
          ? _self.county
          : county // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _self.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      postalCode: freezed == postalCode
          ? _self.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, Object?>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Location extends Location {
  const _Location(
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
  factory _Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

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

  /// Create a copy of Location
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LocationCopyWith<_Location> get copyWith =>
      __$LocationCopyWithImpl<_Location>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$LocationToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Location &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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

  @override
  String toString() {
    return 'Location(service: $service, lon: $lon, lat: $lat, name: $name, city: $city, state: $state, street: $street, municipality: $municipality, county: $county, country: $country, postalCode: $postalCode, data: $data)';
  }
}

/// @nodoc
abstract mixin class _$LocationCopyWith<$Res>
    implements $LocationCopyWith<$Res> {
  factory _$LocationCopyWith(_Location value, $Res Function(_Location) _then) =
      __$LocationCopyWithImpl;
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
class __$LocationCopyWithImpl<$Res> implements _$LocationCopyWith<$Res> {
  __$LocationCopyWithImpl(this._self, this._then);

  final _Location _self;
  final $Res Function(_Location) _then;

  /// Create a copy of Location
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    return _then(_Location(
      service: freezed == service
          ? _self.service
          : service // ignore: cast_nullable_to_non_nullable
              as String?,
      lon: null == lon
          ? _self.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double,
      lat: null == lat
          ? _self.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _self.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      street: freezed == street
          ? _self.street
          : street // ignore: cast_nullable_to_non_nullable
              as String?,
      municipality: freezed == municipality
          ? _self.municipality
          : municipality // ignore: cast_nullable_to_non_nullable
              as String?,
      county: freezed == county
          ? _self.county
          : county // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _self.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      postalCode: freezed == postalCode
          ? _self.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _self._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, Object?>?,
    ));
  }
}

/// @nodoc
mixin _$PointGeometry {
  @JsonKey(name: 'coordinates')
  List<double> get coords;

  /// Create a copy of PointGeometry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PointGeometryCopyWith<PointGeometry> get copyWith =>
      _$PointGeometryCopyWithImpl<PointGeometry>(
          this as PointGeometry, _$identity);

  /// Serializes this PointGeometry to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PointGeometry &&
            const DeepCollectionEquality().equals(other.coords, coords));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(coords));

  @override
  String toString() {
    return 'PointGeometry(coords: $coords)';
  }
}

/// @nodoc
abstract mixin class $PointGeometryCopyWith<$Res> {
  factory $PointGeometryCopyWith(
          PointGeometry value, $Res Function(PointGeometry) _then) =
      _$PointGeometryCopyWithImpl;
  @useResult
  $Res call({@JsonKey(name: 'coordinates') List<double> coords});
}

/// @nodoc
class _$PointGeometryCopyWithImpl<$Res>
    implements $PointGeometryCopyWith<$Res> {
  _$PointGeometryCopyWithImpl(this._self, this._then);

  final PointGeometry _self;
  final $Res Function(PointGeometry) _then;

  /// Create a copy of PointGeometry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coords = null,
  }) {
    return _then(_self.copyWith(
      coords: null == coords
          ? _self.coords
          : coords // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _PointGeometry extends PointGeometry {
  const _PointGeometry(
      {@JsonKey(name: 'coordinates') required final List<double> coords})
      : _coords = coords,
        super._();
  factory _PointGeometry.fromJson(Map<String, dynamic> json) =>
      _$PointGeometryFromJson(json);

  final List<double> _coords;
  @override
  @JsonKey(name: 'coordinates')
  List<double> get coords {
    if (_coords is EqualUnmodifiableListView) return _coords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_coords);
  }

  /// Create a copy of PointGeometry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PointGeometryCopyWith<_PointGeometry> get copyWith =>
      __$PointGeometryCopyWithImpl<_PointGeometry>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PointGeometryToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PointGeometry &&
            const DeepCollectionEquality().equals(other._coords, _coords));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_coords));

  @override
  String toString() {
    return 'PointGeometry(coords: $coords)';
  }
}

/// @nodoc
abstract mixin class _$PointGeometryCopyWith<$Res>
    implements $PointGeometryCopyWith<$Res> {
  factory _$PointGeometryCopyWith(
          _PointGeometry value, $Res Function(_PointGeometry) _then) =
      __$PointGeometryCopyWithImpl;
  @override
  @useResult
  $Res call({@JsonKey(name: 'coordinates') List<double> coords});
}

/// @nodoc
class __$PointGeometryCopyWithImpl<$Res>
    implements _$PointGeometryCopyWith<$Res> {
  __$PointGeometryCopyWithImpl(this._self, this._then);

  final _PointGeometry _self;
  final $Res Function(_PointGeometry) _then;

  /// Create a copy of PointGeometry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? coords = null,
  }) {
    return _then(_PointGeometry(
      coords: null == coords
          ? _self._coords
          : coords // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ));
  }
}

// dart format on
