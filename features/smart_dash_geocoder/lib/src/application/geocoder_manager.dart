import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash_geocoder/smart_dash_geocoder.dart';
import 'package:smart_dash_geocoder/src/application/geocoder_driver.dart';
import 'package:smart_dash_integration/smart_dash_integration.dart';

part 'geocoder_manager.g.dart';

class GeocoderManager extends DriverManager<GeocoderDriver> {
  GeocoderManager(super.ref);

  Future<List<Location>> reverseSearch(PointGeometry point) async {
    final locations = <Location>[];
    for (final driver in drivers) {
      final result = await driver.reverseSearch(point);
      if (result.isPresent) {
        locations.add(result.value);
      }
    }
    return locations;
  }

  Future<List<Location>> searchByName(String query) async {
    final locations = <Location>[];
    for (final driver in drivers) {
      final result = await driver.searchByName(query);
      locations.addAll(result);
    }
    return locations;
  }
}

@Riverpod(keepAlive: true)
GeocoderManager geocoderManager(Ref ref) => GeocoderManager(ref);
