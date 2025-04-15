import 'package:riverpod/riverpod.dart';
import 'package:smart_dash_integration/smart_dash_integration.dart';
import 'package:smart_dash_snow/smart_dash_snow.dart';
import 'package:smart_dash_snow/src/driver/snow_driver_client.dart';
import 'package:smart_dash_snow/src/integration/nysny/data/nysny_client.dart';

class NySnyDriver extends SnowDriver {
  NySnyDriver(
    Ref ref,
    ServiceConfig config,
  ) : super(
          ref: ref,
          config: config,
          key: NySny.key,
        );

  @override
  SnowDriverClient newClient() {
    return NySnyClient(
      NySnyCredentials(
        email: config.username!,
        password: config.password!,
      ),
    );
  }
}
