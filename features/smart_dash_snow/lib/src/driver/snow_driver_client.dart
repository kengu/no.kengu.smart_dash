import 'package:optional/optional.dart';
import 'package:smart_dash_snow/smart_dash_snow.dart';

abstract class SnowDriverClient {
  Future<Optional<List<SnowState>>> getStates();
  Future<Optional<SnowState>> getState(String location);
  void close();
}
