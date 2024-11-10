import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash/integration/osm/data/osm_location_client.dart';
import 'package:smart_dash/integration/osm/osm.dart';
import 'package:smart_dash_account/smart_dash_account_app.dart';

part 'osm_location_service.g.dart';

class OsmLocationService extends LocationService {
  OsmLocationService(Ref ref) : super(Osm.key, ref);

  @override
  LocationClient newClient(ServiceConfig config) {
    return OsmLocationClient(ref);
  }
}

@Riverpod(keepAlive: true)
OsmLocationService osmLocationService(OsmLocationServiceRef ref) {
  return OsmLocationService(ref);
}
