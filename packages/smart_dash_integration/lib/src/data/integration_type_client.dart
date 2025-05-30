import 'package:dio/dio.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash_integration/smart_dash_integration.dart';

part 'integration_type_client.g.dart';

class IntegrationTypeClient extends QueryClient<String, Integration> {
  IntegrationTypeClient(super.api)
      : super(suffix: 'integration', query: 'keys');

  @override
  String toId(Integration item) {
    return item.key;
  }

  @override
  Integration fromJson(JsonObject data) {
    return Integration.fromJson(data);
  }

  @override
  JsonObject toJson(Integration data) {
    return data.toJson();
  }
}

@Riverpod(keepAlive: true)
IntegrationTypeClient integrationClient(Ref ref, String baseUrl) {
  return IntegrationTypeClient(
    Dio(BaseOptions(headers: {
      // TODO: Authentication
    }, baseUrl: baseUrl))
      // Process json in the background
      ..transformer = BackgroundTransformer(),
  );
}
