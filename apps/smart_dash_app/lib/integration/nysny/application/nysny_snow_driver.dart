import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_dash_app/integration/nysny/data/nysny_client.dart';
import 'package:smart_dash_app/integration/nysny/nysny.dart';
import 'package:smart_dash_integration/smart_dash_integration.dart';
import 'package:smart_dash_snow/smart_dash_snow.dart';

class NySnySnowDriver extends SnowDriver {
  NySnySnowDriver(
    Ref ref,
    ServiceConfig config,
  ) : super(
          ref: ref,
          config: config,
          key: NySny.key,
        );

  @override
  SnowClient newClient() {
    return NySnyClient(
      NySnyCredentials(
        email: config.username!,
        password: config.password!,
      ),
    );
  }
}
