import 'package:optional/optional.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash_app/core/presentation/widget/load/async_load_controller.dart';
import 'package:smart_dash_app/feature/system/application/system_health_service.dart';
import 'package:smart_dash_app/feature/system/domain/system_health.dart';

part 'system_health_controller.g.dart';

class SystemHealthQuery {
  SystemHealthQuery();
}

@riverpod
class SystemHealthScreenController extends _$SystemHealthScreenController
    with AsyncLoadController<SystemHealthQuery, SystemHealth> {
  @override
  FutureOr<Optional<SystemHealth>> build(SystemHealthQuery query) =>
      super.build(query);

  @override
  Future<Optional<SystemHealth>> load(SystemHealthQuery query) async {
    final service = ref.read(systemHealthServiceProvider);
    return Optional.of(SystemHealth(
      service.getStates(),
      service.connectionMode,
    ));
  }
}
