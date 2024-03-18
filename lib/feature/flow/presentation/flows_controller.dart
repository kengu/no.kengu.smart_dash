import 'package:optional/optional.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash/core/presentation/widget/load/async_load_controller.dart';
import 'package:smart_dash/feature/flow/data/block_repository.dart';
import 'package:smart_dash/feature/flow/domain/block.dart';

part 'flows_controller.g.dart';

class FlowsQuery {
  const FlowsQuery();
}

@riverpod
class FlowsController extends _$FlowsController
    with AsyncLoadController<FlowsQuery, List<BlockModel>> {
  @override
  FutureOr<Optional<List<BlockModel>>> build(FlowsQuery query) =>
      super.build(query);

  @override
  Future<Optional<List<BlockModel>>> load(FlowsQuery query) async {
    final repo = ref.read(blockRepositoryProvider);
    return Optional.of(await repo.getAll());
  }
}
