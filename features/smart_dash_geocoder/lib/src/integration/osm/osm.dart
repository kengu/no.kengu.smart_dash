import 'package:smart_dash_integration/smart_dash_integration.dart';

class Osm {
  static const key = 'osm';

  static final Integration definition = Integration(
    key: Osm.key,
    type: IntegrationType.location,
    name: "OSM Nominatim API",
    image: "osm.png",
    category: "Geocoder Services",
    description: "Enables location search",
    fields: [],
    dependsOn: [],
    instances: 1,
    system: false,
    enabled: true,
  );
}
