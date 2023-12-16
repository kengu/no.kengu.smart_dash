import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash/feature/device/domain/driver_definition.dart';

part 'device_definition_repository.g.dart';

@Riverpod(keepAlive: false /* Keep result to minimize lookup */)
class DriverDefinitionRepository extends _$DriverDefinitionRepository {
  static final _drivers = <String, DriverDefinition>{};

  @override
  FutureOr<DriverDefinitionMap> build() async {
    if (_drivers.isEmpty) {
      _drivers.addAll(await _load());
    }
    return _drivers;
  }

  static Future<DriverDefinitionMap> _load() async {
    final services = await rootBundle
        .loadString('assets/data/drivers.json')
        .then((json) => jsonDecode(json)) as List;
    return {
      for (final e in services
          .map((e) => e as Map<String, Object?>)
          .map(DriverDefinition.fromJson))
        e.key: e,
    };
  }
}
