import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:optional/optional_internal.dart';
import 'package:smart_dash/feature/home/data/location_client.dart';
import 'package:smart_dash/feature/home/domain/location.dart';
import 'package:smart_dash/integration/osm/osm.dart';
import 'package:osm_nominatim/osm_nominatim.dart';
import 'package:smart_dash/util/guard.dart';

class OsmLocationClient extends LocationClient {
  OsmLocationClient(this.ref);

  Ref ref;

  @override
  Future<Optional<Location>> reverseSearch(
      {required double lon, required double lat}) async {
    return guard(() async {
      final result = await Nominatim.reverseSearch(
        lat: 50.1,
        lon: 6.2,
        addressDetails: true,
        extraTags: true,
        nameDetails: true,
      );
      return Optional.of(toLocation(result));
    });
  }

  @override
  Future<List<Location>> searchByName({required String query}) {
    return guard(() async {
      final result = await Nominatim.searchByName(
        query: query,
        addressDetails: true,
        extraTags: true,
        nameDetails: true,
      );
      return result.map(toLocation).toList();
    });
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
      ].whereNotNull().join(' '),
      county: data.address?['county'] as String?,
      country: data.address?['country'] as String?,
      postalCode: data.address?['postcode'] as String?,
      municipality: data.address?['municipality'] as String?,
    );
  }
}
