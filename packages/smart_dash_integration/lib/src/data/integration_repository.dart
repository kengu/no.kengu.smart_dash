import 'dart:convert';

import 'package:optional/optional.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash_common/smart_dash_common.dart';
import 'package:smart_dash_integration/smart_dash_integration.dart';

part 'integration_repository.g.dart';

@Riverpod(keepAlive: true)
class IntegrationRepository extends _$IntegrationRepository {
  static final _drivers = <String, Integration>{};

  @override
  FutureOr<IntegrationMap> build() async {
    if (_drivers.isEmpty) {
      _drivers.addAll(await _load());
    }
    return _drivers;
  }

  Optional<Integration> get(String key) {
    return Optional.ofNullable(state.value?[key]);
  }

  Optional<IntegrationMap> supports(Iterable<String> features) {
    return where((e) => e.features.any(features.contains));
  }

  Optional<IntegrationMap> where(bool Function(Integration element) test) {
    if (!state.hasValue) const Optional.empty();
    return Optional.of(Map.fromEntries(state.value!.entries.where(
      (e) => test(e.value),
    )));
  }

  static Future<IntegrationMap> _load() async {
    return {
      for (final e
          in _defaults.map(Integration.fromJson).where((e) => e.enabled))
        e.key: e,
    };
  }

  // TODO: Read from file system
  static List<JsonObject> get _defaults {
    final json = jsonDecode(
      '''
[
  {
    "key": "sikom",
    "name": "Sikom Living API",
    "image": "sikom.png",
    "category": "Smart Home & IoT",
    "features": ["device"],
    "description": "Enter account email and password",
    "fields": ["username", "password"],
    "instances": 1,
    "system": false,
    "enabled": true
  },
  {
    "key": "mqtt",
    "name": "MQTT API",
    "image": "mqtt.png",
    "category": "Smart Home & IoT",
    "features": ["data"],
    "description": "Enter client information",
    "fields": ["host", "port", "username", "password", "topics"],
    "instances": 1,
    "system": false,
    "enabled": true
  },
  {
    "key": "rtl_433",
    "name": "RF Data Receiver (rtl_433)",
    "image": "generic.png",
    "category": "Smart Home & IoT",
    "description": "Enable processing of RF data",
    "features": ["device"],
    "fields": [],
    "instances": 1,
    "system": false,
    "enabled": true
  },
  {
    "key": "homey",
    "name": "Homey API",
    "image": "homey.png",
    "category": "Smart Home & IoT",
    "features": ["device"],
    "description": "Enter account email and password",
    "fields": ["username", "password"],
    "instances": 1,
    "system": false,
    "enabled": false
  },
  {
    "key": "home_assistant",
    "name": "Home Assistant API",
    "image": "home_assistant.png",
    "category": "Smart Home & IoT",
    "features": ["device"],
    "fields": ["username", "password"],
    "description": "Enter account email and password",
    "instances": 1,
    "system": false,
    "enabled": false
  },
  {
    "key": "foscam",
    "name": "Foscam CGI API",
    "image": "foscam.png",
    "category": "Security Cameras",
    "features": ["camera"],
    "description": "Enter camera information",
    "fields": ["device", "host", "port", "username", "password"],
    "instances": 4,
    "system": false,
    "enabled": true
  },
  {
    "key": "metno",
    "name": "MET Location Forecast API",
    "image": "met.png",
    "category": "Weather Services",
    "features": ["data", "device", "weather"],
    "description": "Enable weather forecasts",
    "fields": [],
    "instances": 1,
    "system": false,
    "enabled": true
  },
  {
    "key": "nysny",
    "name": "NySny Web",
    "image": "nysny.png",
    "category": "Weather Services",
    "features": ["data", "device", "snow"],
    "description": "Enter account information",
    "fields": ["username", "password"],
    "instances": 1,
    "system": false,
    "enabled": true
  },
  {
    "key": "osm",
    "name": "OSM Nominatim API",
    "image": "osm.png",
    "category": "Location Services",
    "features": ["data"],
    "description": "Enable location search",
    "fields": [],
    "instances": 1,
    "system": false,
    "enabled": true
  }
]
''',
    );
    final list = List.from(json as List).cast<JsonObject>();
    for (final it in list) {
      print(it);
    }
    return list;
  }
}
