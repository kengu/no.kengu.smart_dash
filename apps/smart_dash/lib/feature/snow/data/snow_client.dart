import 'package:optional/optional.dart';
import 'package:smart_dash/feature/snow/domain/snow_state.dart';

abstract class SnowClient {
  Future<Optional<List<SnowState>>> getStates();
}
