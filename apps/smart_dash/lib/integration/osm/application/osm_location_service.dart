import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash/feature/account/domain/service_config.dart';
import 'package:smart_dash/feature/home/application/location_service.dart';
import 'package:smart_dash/feature/home/data/location_client.dart';
import 'package:smart_dash/integration/osm/data/osm_location_client.dart';
import 'package:smart_dash/integration/osm/osm.dart';

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
