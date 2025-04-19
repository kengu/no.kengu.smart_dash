import 'package:optional/optional.dart';
import 'package:smart_dash_common/smart_dash_common.dart';
import 'package:smart_dash_snow/smart_dash_snow.dart';

abstract class SnowDriverClient<D>
    extends QueryDataClient<String, SnowState, D> {
  SnowDriverClient(
    super.api, {
    required super.suffix,
    super.prefix = '',
    super.query = 'ids',
  });
  Future<Optional<List<SnowState>>> getStates();
  Future<Optional<SnowState>> getState(String location);
}
