import 'package:smart_dash_common/smart_dash_common.dart';

abstract class CommandClient<I, T, R, S> extends JsonClient<I, T>
    with CommandClientMixin<I, T, R, S> {
  CommandClient(
    super.api,
    this.type, {
    this.prefix = '',
    this.query = 'ids',
  });

  @override
  final String type;

  @override
  final String query;

  @override
  final String prefix;
}

abstract class BulkCommandClient<I, T, R, S, B>
    extends CommandClient<I, T, R, S> with BulkCommandClientMixin<I, T, R, B> {
  BulkCommandClient(
    super.api,
    super.type, {
    super.prefix = '',
    super.query = 'ids',
  });
}
