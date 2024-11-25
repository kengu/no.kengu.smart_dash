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

  Optional<IntegrationMap> supports(Iterable<IntegrationType> types) {
    return where((e) => types.contains(e.type));
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
    "key": "osm",
    "type": "location",
    "name": "OSM Nominatim API",
    "image": "osm.png",
    "category": "Location Services",
    "description": "Enables location search",
    "fields": [],
    "dependsOn": [],
    "instances": 1,
    "system": false,
    "enabled": true
  },
  {
    "key": "homey",
    "type": "device",
    "name": "Homey API",
    "image": "homey.png",
    "category": "Smart Home & IoT",
    "description": "Enter account email and password",
    "fields": ["username", "password"],
    "dependsOn": [],
    "instances": 1,
    "system": false,
    "enabled": false
  },
  {
    "key": "home_assistant",
    "type": "device",
    "name": "Home Assistant API",
    "image": "home_assistant.png",
    "category": "Smart Home & IoT",
    "description": "Enter account email and password",
    "fields": ["username", "password"],
    "dependsOn": [],
    "instances": 1,
    "system": false,
    "enabled": false
  }
]
''',
    );
    final list = List.from(json as List).cast<JsonObject>();
    /*
    for (final it in list) {
      print(it);
    }
     */
    return list;
  }
}
