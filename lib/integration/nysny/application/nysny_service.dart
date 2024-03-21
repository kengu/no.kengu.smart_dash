import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash/feature/account/domain/service_config.dart';
import 'package:smart_dash/feature/snow/application/snow_service.dart';
import 'package:smart_dash/feature/snow/data/snow_client.dart';
import 'package:smart_dash/integration/nysny/data/nysny_client.dart';
import 'package:smart_dash/integration/nysny/nysny.dart';

part 'nysny_service.g.dart';

class NySnyService extends SnowService {
  NySnyService(Ref ref) : super(NySny.key, ref) {
    ref.onDispose(() {
      _api.close(force: true);
    });
  }

  final _api = Dio(BaseOptions(baseUrl: 'https://nysny.no/'))
    // Process json in the background
    ..transformer = BackgroundTransformer();

  @override
  SnowClient newClient(ServiceConfig config) {
    return NySnyClient(
      _api,
      NySnyCredentials(
        email: config.username!,
        password: config.password!,
      ),
    );
  }
}

@Riverpod(keepAlive: true)
NySnyService nySnyService(NySnyServiceRef ref) {
  return NySnyService(ref);
}
