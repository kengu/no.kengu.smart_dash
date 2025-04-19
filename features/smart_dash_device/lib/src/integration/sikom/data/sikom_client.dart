import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:logging/logging.dart';
import 'package:optional/optional.dart';
import 'package:smart_dash_device/smart_dash_device.dart';
import 'package:smart_dash_device/src/integration/sikom/data/sikom_response.dart';
import 'package:smart_dash_device/src/integration/sikom/domain/sikom_device.dart';
import 'package:smart_dash_device/src/integration/sikom/domain/sikom_gateway.dart';
import 'package:smart_dash_device/src/integration/sikom/domain/sikom_property.dart';
import 'package:smart_dash_integration/smart_dash_integration.dart';

class SikomClient extends DeviceClient {
  SikomClient(super.config)
      : api = Dio(BaseOptions(
          headers: {},
          baseUrl: 'https://api.connome.com/api',
        ))
          // Process json in the background
          ..transformer = BackgroundTransformer();

  final Dio api;

  final _log = Logger('$SikomClient');

  static String toBasicAuth(ServiceConfig config) => ServiceConfig.toBasicAuth(
        config.username!,
        // Security-by-obscurity-V-
        '${config.password}!!!',
      );

  Future<bool> verifyCredentials() async {
    return guard(() async {
      final response = await api.get('/VerifyCredentials',
          options: Options(
            headers: <String, String>{
              'authorization': toBasicAuth(config),
            },
            validateStatus: (status) {
              final success = status != null && status < 400;
              if (!success) {
                _log.warning(
                  'Sikom request failed: [$status] /VerifyCredentials',
                );
              }
              return success;
            },
          ));
      _log.fine(
        'Verified Sikom credentials: '
        '[${response.statusCode}] ${response.realUri}',
      );
      final result = SikomResponse.fromJson(response.data);
      return result.data.scalarResult == 'True';
    }, onError: checkDioError);
  }

  Future<Optional<List<SikomGateway>>> getGateways() async {
    return guard(() async {
      final response = await api.get('/Gateway/All',
          options: Options(
            headers: <String, String>{
              'authorization': toBasicAuth(config),
            },
            validateStatus: (status) {
              final success = status != null && status < 400;
              if (!success) {
                _log.warning(
                  'Sikom request failed: [$status] /Gateway/All',
                );
              }
              return success;
            },
          ));
      final result = SikomResponse.fromJson(response.data);
      _log.fine(
        'Fetched Sikom Gateways: '
        '[${response.statusCode}] ${response.realUri}',
      );
      final gateways = result.isArray
          ? result.data.bpapiArray!
              .map((e) => e.gateway)
              .whereType<SikomGateway>()
              .toList()
          : <SikomGateway>[];
      return Optional.ofNullable(gateways);
    }, onError: checkDioError);
  }

  Future<Optional<List<SikomDevice>>> getDevices(
    SikomGateway gateway, {
    Iterable<String> ids = const [],
    SikomDeviceType type = SikomDeviceType.any,
  }) async {
    return guard(() async {
      final devices = await getAllDevices(
        ids: ids,
        gateway: gateway,
      );
      return Optional.of(
        devices.isPresent
            ? devices.value.where((d) => type.isAny || d.type == type).toList()
            : [],
      );
    }, onError: checkDioError);
  }

  Future<Optional<List<SikomDevice>>> getAllDevices({
    SikomGateway? gateway,
    Iterable<String> ids = const [],
  }) async {
    return guard(() async {
      final devices = <SikomDevice>[];
      // Ensure maximum 20 devices per request
      final queries = ids.isEmpty
          ? ['All']
          : ids.slices(20).map((slice) => slice.join(',')).toList();
      for (final query in queries) {
        final path = '/Device/$query${gateway == null ? '' : '/${gateway.id}'}';
        final response = await api.get(
          path,
          options: Options(
            headers: <String, String>{'authorization': toBasicAuth(config)},
            validateStatus: (status) {
              final success = status != null && status < 400;
              if (!success) {
                _log.warning(
                  'Sikom request failed: [$status] $path',
                );
              }
              return success;
            },
          ),
        );
        _log.fine(
          'Fetched Sikom Devices: '
          '[${response.statusCode}] ${response.realUri}',
        );
        final result = SikomResponse.fromJson(response.data);
        if (result.isArray) {
          devices.addAll(
            result.data.bpapiArray!
                .map((e) => e.device)
                .whereType<SikomDevice>()
                .where((e) => e.isReal),
          );
        } else if (result.isDevice) {
          devices.add(result.data.device!);
        }
      }
      return Optional.ofNullable(devices);
    }, onError: checkDioError);
  }

  Future<Optional<String>> getDevicePropertyValue(
      String id, String name) async {
    return guard(() async {
      final path = '/Device/$id/Property/$name/Value/';
      final response = await api.get(
        path,
        options: Options(
          headers: <String, String>{'authorization': toBasicAuth(config)},
          validateStatus: (status) {
            final success = status != null && status < 400;
            if (!success) {
              _log.warning(
                'Sikom request failed: [$status] $path',
              );
            }
            return success;
          },
        ),
      );

      final result = SikomResponse.fromJson(response.data);
      final value = result.data.scalarResult.toString();
      _log.fine(
        'Fetched Sikom Property: '
        '[${response.statusCode}] ${response.realUri}[$value]',
      );
      return Optional.ofNullable(value);
    }, onError: checkDioError);
  }

  Future<Optional<SikomProperty>> setDeviceProperty(
      String id, SikomProperty property) async {
    return guard(() async {
      final path = '/Device/$id/AddProperty/${property.name}/${property.value}';
      final response = await api.get(
        path,
        options: Options(
          headers: <String, String>{'authorization': toBasicAuth(config)},
          validateStatus: (status) {
            final success = status != null && status < 400;
            if (!success) {
              _log.warning(
                'Sikom request failed: [$status] $path',
              );
            }
            return success;
          },
        ),
      );
      _log.fine(
        'Applied Sikom Property: [${response.statusCode}] ${response.realUri}',
      );

      final result = SikomResponse.fromJson(response.data);
      if (result.isOk) {
        final first = await Future.delayed(
          const Duration(milliseconds: 100),
          () => getDevicePropertyValue(id, property.name),
        );
        if (first.orElseNull == property.value) {
          return Optional.of(property);
        }

        int attempt = 0;
        do {
          // Retry until every 500 until success or maximum attempt is reached
          final check = await Future.delayed(
            const Duration(milliseconds: 500),
            () => getDevicePropertyValue(id, property.name),
          );
          if (check.orElseNull == property.value) {
            return Optional.of(property);
          }
          attempt++;
        } while (attempt < 20);
        _log.warning(
          'Applied Sikom Property: '
          '[${response.statusCode}] ${response.realUri} '
          'failed after 20 attempts',
        );
      }
      return const Optional.empty();
    }, onError: checkDioError);
  }

  @override
  void close() {
    api.close();
  }
}
