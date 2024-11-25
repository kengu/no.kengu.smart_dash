import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'location.freezed.dart';
part 'location.g.dart';

class LocationField {
  static const String lon = 'lon';
  static const String lat = 'lat';
  static const String name = 'name';
  static const String data = 'data';
  static const String city = 'city';
  static const String state = 'state';
  static const String street = 'street';
  static const String county = 'county';
  static const String country = 'country';
  static const String postalCode = 'postalCode';
}

@freezed
class Location with _$Location {
  const Location._();

  const factory Location({
    /// Location service
    @JsonKey(name: 'service') String? service,

    /// Location longitude
    @JsonKey(name: 'lon') required double lon,

    /// Location latitude
    @JsonKey(name: 'lat') required double lat,

    /// Location name
    @JsonKey(name: 'name') String? name,

    /// Location in city
    @JsonKey(name: 'city') String? city,

    /// Location in city
    @JsonKey(name: 'state') String? state,

    /// Location at street name and number
    @JsonKey(name: 'street') String? street,

    /// Location at municipality
    @JsonKey(name: 'municipality') String? municipality,

    /// Location in county
    @JsonKey(name: 'county') String? county,

    /// Location in country
    @JsonKey(name: 'country') String? country,

    /// Location in postalCode
    @JsonKey(name: 'postalCode') String? postalCode,

    /// Other location data
    @JsonKey(name: 'data') Map<String, Object?>? data,
  }) = _Location;

  String get address {
    return [
      if (street != null) street,
      [postalCode, municipality].nonNulls.join(' '),
    ].nonNulls.join(', ');
  }

  PointGeometry get point => PointGeometry(coords: [lon, lat]);

  factory Location.empty() => const Location(lat: 0.0, lon: 0.0);

  factory Location.fromJson(Map<String, Object?> json) =>
      _$LocationFromJson(json);
}

@freezed
class PointGeometry with _$PointGeometry {
  const PointGeometry._();

  const factory PointGeometry({
    @JsonKey(name: 'coordinates') required List<double> coords,
  }) = _PointGeometry;

  factory PointGeometry.from(double lon, double lat, [double? alt]) {
    return PointGeometry(
      coords: [lon, lat, alt].whereNotNull().toList(),
    );
  }

  double get lon => coords.length > 1 ? coords[0] : double.nan;
  double get lat => coords.length > 1 ? coords[1] : double.nan;
  double get alt => coords.length > 2 ? coords[2] : double.nan;

  factory PointGeometry.fromJson(Map<String, Object?> json) =>
      _$PointGeometryFromJson(json);

  bool isHere(double lon, double lat) => this.lon == lon && this.lat == lat;
}
