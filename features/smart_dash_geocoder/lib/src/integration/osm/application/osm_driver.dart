import 'package:riverpod/riverpod.dart';
import 'package:smart_dash_geocoder/src/application/geocoder_driver.dart';
import 'package:smart_dash_geocoder/src/data/geocoder_client.dart';
import 'package:smart_dash_geocoder/src/integration/osm/data/osm_client.dart';
import 'package:smart_dash_geocoder/src/integration/osm/osm.dart';
import 'package:smart_dash_integration/smart_dash_integration.dart';

class OsmDriver extends GeocoderDriver {
  OsmDriver(Ref ref, ServiceConfig config) : super(ref, Osm.key, config);

  @override
  GeocoderClient newClient() {
    return OsmClient();
  }
}
