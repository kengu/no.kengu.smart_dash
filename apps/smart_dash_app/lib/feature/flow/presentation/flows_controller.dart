import 'package:optional/optional.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash_app/core/presentation/widget/state/smart_dash_state.dart';
import 'package:smart_dash_flow/smart_dash_flow.dart';

part 'flows_controller.g.dart';

class FlowsQuery {
  const FlowsQuery({this.ids = const []});

  final List<String> ids;
}

@riverpod
class FlowsController extends _$FlowsController
    with AsyncViewModel<FlowsQuery, List<BlockModel>> {
  @override
  FutureOr<Optional<List<BlockModel>>> build(FlowsQuery query) {
    return super.build(query);
  }

  @override
  Future<Optional<List<BlockModel>>> load(FlowsQuery query) async {
    final repo = ref.read(blockRepositoryProvider);
    return Optional.of(await repo.getAll());
  }
}
