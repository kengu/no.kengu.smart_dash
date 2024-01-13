import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash/integration/domain/integration.dart';

part 'integration_repository.g.dart';

@Riverpod(keepAlive: false /* Keep result to minimize lookup */)
class IntegrationRepository extends _$IntegrationRepository {
  static final _drivers = <String, Integration>{};

  @override
  FutureOr<IntegrationMap> build() async {
    if (_drivers.isEmpty) {
      _drivers.addAll(await _load());
    }
    return _drivers;
  }

  static Future<IntegrationMap> _load() async {
    final services = await rootBundle
        .loadString('assets/data/integrations.json')
        .then((json) => jsonDecode(json)) as List;
    return {
      for (final e in services
          .map((e) => e as Map<String, Object?>)
          .map(Integration.fromJson))
        e.key: e,
    };
  }
}
