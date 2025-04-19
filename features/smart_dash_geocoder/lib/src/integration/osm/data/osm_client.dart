import 'package:optional/optional.dart';
import 'package:osm_nominatim/osm_nominatim.dart';
import 'package:smart_dash_common/smart_dash_common.dart';
import 'package:smart_dash_geocoder/smart_dash_geocoder.dart';
import 'package:smart_dash_geocoder/smart_dash_geocoder_app.dart';

class OsmClient extends GeocoderClient {
  OsmClient() : super();

  @override
  Future<Optional<Location>> reverseSearch(PointGeometry point) async {
    return guard(() async {
      final result = await Nominatim.reverseSearch(
        lon: point.lon,
        lat: point.lat,
        extraTags: true,
        nameDetails: true,
        addressDetails: true,
      );
      return Optional.of(toLocation(result));
    }, onError: checkDioError);
  }

  @override
  Future<List<Location>> searchByName(String query) {
    return guard(() async {
      final result = await Nominatim.searchByName(
        query: query,
        addressDetails: true,
        extraTags: true,
        nameDetails: true,
      );
      return result.map(toLocation).toList();
    }, onError: checkDioError);
  }

  static Location toLocation(Place data) {
    return Location(
      lon: data.lon,
      lat: data.lat,
      service: Osm.key,
      name: data.displayName,
      city: data.address?['city'] as String?,
      state: data.address?['state'] as String?,
      street: [
        data.address?['road'] as String?,
        data.address?['house_number'] as String?,
      ].nonNulls.join(' '),
      county: data.address?['county'] as String?,
      country: data.address?['country'] as String?,
      postalCode: data.address?['postcode'] as String?,
      municipality: data.address?['municipality'] as String?,
    );
  }

  @override
  Future<void> close() async {
    // Not used
  }
}
