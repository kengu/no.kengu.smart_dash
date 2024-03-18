import 'package:go_router/go_router.dart';
import 'package:smart_dash/core/presentation/pages.dart';
import 'package:smart_dash/core/presentation/routes.dart';
import 'package:smart_dash/feature/flow/domain/block.dart';
import 'package:smart_dash/feature/flow/presentation/flows_page.dart';
import 'package:smart_dash/feature/flow/presentation/form/block_flow_form_screen.dart';
import 'package:smart_dash/feature/flow/presentation/select/select_flow_screen.dart';

class FlowRoutes {
  static const select = '${Pages.flows}/$_select';
  static const details = '${Pages.flows}/$_details';

  static const _select = 'select';
  static const _details = 'details';

  static String toDetails(BlockModel model) => Uri(
        path: FlowRoutes.details,
        queryParameters: {'id': model.id},
      ).toString();
}

GoRoute buildFlowRoutes() {
  return Routes.buildGoRoute(
    fullscreenDialog: false,
    path: Pages.flows,
    restorationId: Routes.setLastLocation,
    child: const FlowsPage(),
    routes: [
      // Route to device type selection screen
      Routes.buildGoRoute(
        fullscreenDialog: true,
        path: FlowRoutes._select,
        restorationId: Routes.setLastLocation,
        builder: (context, state) {
          return SelectFlowScreen(
            location: Routes.lastLocationOnStack,
          );
        },
      ),
      // Route to device type selection screen
      Routes.buildGoRoute(
        fullscreenDialog: true,
        path: FlowRoutes._details,
        restorationId: Routes.setLastLocation,
        builder: (context, state) {
          return BlockFlowFormScreen(
            location: Routes.lastLocationOnStack,
            id: state.uri.queryParameters['id']!,
          );
        },
      ),
    ],
  );
}
