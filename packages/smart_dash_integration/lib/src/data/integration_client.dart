import 'package:dio/dio.dart';
import 'package:logging/logging.dart';
import 'package:smart_dash_integration/smart_dash_integration.dart';

class IntegrationClient {
  IntegrationClient(String baseUrl)
      : api = Dio(BaseOptions(
          headers: {},
          baseUrl: baseUrl,
        ))
          // Process json in the background
          ..transformer = BackgroundTransformer();

  final Dio api;

  final _log = Logger('$IntegrationClient');

  Future<List<ServiceConfig>> getConfigs() {
    return guard(() async {
      final response = await api.get(
        '/integration',
        options: Options(
          headers: const {},
          validateStatus: (status) {
            final success = status != null && status < 400;
            if (!success) {
              _log.warning(
                'GET request failed: [$status] /integration',
              );
            }
            return success;
          },
        ),
      );
      _log.fine(
        'GET request: [${response.statusCode}] ${response.realUri}',
      );
      return [];
    }, error: check_client_error);
  }

  void close() {
    api.close(force: true);
  }
}
