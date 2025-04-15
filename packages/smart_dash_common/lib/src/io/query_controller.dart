import 'package:shelf_router/shelf_router.dart';
import 'package:smart_dash_common/smart_dash_common.dart';

abstract class QueryController<I, T> with QueryControllerMixin<I, T> {
  QueryController(this.type);

  Router get router;

  @override
  final String type;
}
