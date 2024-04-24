import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:optional/optional.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash/feature/dashboard/domain/dashboard.dart';
import 'package:smart_dash/util/data/json.dart';

part 'dashboard_repository.g.dart';

@Riverpod(keepAlive: true)
class DashboardRepository extends _$DashboardRepository {
  static final _dashboards = <String, Dashboard>{};

  @override
  FutureOr<DashboardMap> build() async {
    if (_dashboards.isEmpty) {
      _dashboards.addAll(await _load());
    }
    return _dashboards;
  }

  Optional<Dashboard> get(String key) {
    if (!state.hasValue) const Optional.empty();
    return state.value!.values.firstWhereOptional((e) => e.key == key);
  }

  static Future<DashboardMap> _load() async {
    final services = await rootBundle
        .loadString('assets/data/dashboards.json')
        .then((json) => jsonDecode(json)) as List;
    return {
      for (final e
          in services.map((e) => e as JsonObject).map(Dashboard.fromJson))
        e.key: e,
    };
  }
}
