import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash_integration/smart_dash_integration.dart';

part 'integration_type_client.g.dart';

class IntegrationTypeClient extends QueryClient<String, Integration> {
  IntegrationTypeClient(Dio api) : super(api, 'integration', query: 'keys');

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
IntegrationTypeClient integrationClient(
    IntegrationClientRef ref, String baseUrl) {
  return IntegrationTypeClient(
    Dio(BaseOptions(headers: {
      // TODO: Authentication
    }, baseUrl: baseUrl))
      // Process json in the background
      ..transformer = BackgroundTransformer(),
  );
}
