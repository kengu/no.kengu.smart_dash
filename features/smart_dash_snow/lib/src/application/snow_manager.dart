import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash_integration/smart_dash_integration.dart';

import 'snow_driver.dart';

part 'snow_manager.g.dart';

class SnowManager extends DriverManager<SnowDriver> {
  SnowManager(super.ref);
}

@Riverpod(keepAlive: true)
SnowManager snowManager(SnowManagerRef ref) => SnowManager(ref);
