/// Support for doing something awesome.
///
/// More dartdocs go here.
library;

import 'package:riverpod/riverpod.dart';
import 'package:smart_dash_geocoder/smart_dash_geocoder_app.dart';
import 'package:smart_dash_integration/smart_dash_integration.dart';

import 'integration/osm/application/osm_driver.dart';
import 'integration/osm/osm.dart';

class Geocoder {
  static IntegrationType install(Ref ref) {
    final service = ref.read(geocoderServiceProvider);

    // Register mqtt service and integrations
    ref.read(integrationManagerProvider).install(
          IntegrationType.location,
          () => service
            ..manager.install(
              Osm.definition,
              (config) => OsmDriver(ref, config),
            ),
        );

    return IntegrationType.location;
  }
}
