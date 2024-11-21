import 'package:smart_dash_integration/smart_dash_integration.dart';

abstract class DeviceClient {
  DeviceClient(this.config);

  final ServiceConfig config;

  void close();
}
