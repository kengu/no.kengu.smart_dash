import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash_integration/smart_dash_integration.dart';

import 'snow_driver.dart';

part 'snow_driver_manager.g.dart';

class SnowDriverManager extends DriverManager<SnowDriver> {
  SnowDriverManager(super.ref);
}

@Riverpod(keepAlive: true)
SnowDriverManager snowDriverManager(SnowDriverManagerRef ref) =>
    SnowDriverManager(ref);
