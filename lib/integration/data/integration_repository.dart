import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:optional/optional.dart';
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
