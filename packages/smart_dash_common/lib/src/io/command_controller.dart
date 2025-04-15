import 'package:smart_dash_common/smart_dash_common.dart';

abstract class CommandController<I, T, R>
    with QueryControllerMixin<I, T>, CommandControllerMixin<I, T, R> {
  CommandController(this.type);

  @override
  final String type;
}
