import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:optional/optional.dart';
import 'package:smart_dash/feature/account/data/account_repository.dart';
import 'package:smart_dash/feature/account/domain/service_config.dart';
import 'package:smart_dash/feature/identity/data/user_repository.dart';
import 'package:smart_dash/integration/sikom/data/sikom_response.dart';
import 'package:smart_dash/integration/sikom/domain/sikom_device.dart';
import 'package:smart_dash/integration/sikom/domain/sikom_gateway.dart';
import 'package:smart_dash/integration/sikom/domain/sikom_property.dart';
import 'package:smart_dash/util/guard.dart';

class SikomClient {
  SikomClient(this.ref, this.api);
  final Dio api;
  final Ref ref;

  static String toBasicAuth(ServiceConfig credentials) =>
      ServiceConfig.toBasicAuth(
        credentials.username,
        // Security-by-obscurity-V-
        '${credentials.password}!!!',
      );

  Future<Optional<ServiceConfig>> getCredentials() async {
    return guard(() async {
      final user = ref.read(userRepositoryProvider).currentUser;
      final account =
          await ref.read(accountRepositoryProvider).get(user.userId);
      return account.value.firstWhere('sikom');
    });
  }

  Future<bool> verifyCredentials() async {
    return guard(() async {
      Optional<ServiceConfig> credentials = await getCredentials();
      if (!credentials.isPresent) return false;
      final response = await api.get('/VerifyCredentials',
          options: Options(
            headers: <String, String>{
              'authorization': toBasicAuth(credentials.value),
            },
            validateStatus: (status) {
              final success = status != null && status < 400;
              if (!success) {
                debugPrint(
                  'Sikom request failed: [$status] /VerifyCredentials',
                );
              }
              return success;
            },
          ));
      debugPrint(
        'Verified Sikom credentials: [${response.statusCode}] ${response.realUri}',
      );
      final result = SikomResponse.fromJson(response.data);
      return result.data.scalarResult == 'True';
    });
  }

  Future<Optional<List<SikomGateway>>> getGateways() async {
    return guard(() async {
      Optional<ServiceConfig> credentials = await getCredentials();
      if (!credentials.isPresent) return const Optional.empty();
      final response = await api.get('/Gateway/All',
          options: Options(
            headers: <String, String>{
              'authorization': toBasicAuth(credentials.value),
            },
            validateStatus: (status) {
              final success = status != null && status < 400;
              if (!success) {
                debugPrint(
                  'Sikom request failed: [$status] /Gateway/All',
                );
              }
              return success;
            },
          ));
      final result = SikomResponse.fromJson(response.data);
      debugPrint(
        'Fetched Sikom Gateways: [${response.statusCode}] ${response.realUri}',
      );
      final gateways = result.isArray
          ? result.data.bpapiArray!
              .map((e) => e.gateway)
              .whereType<SikomGateway>()
              .toList()
          : <SikomGateway>[];
      return Optional.ofNullable(gateways);
    });
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
    });
  }

  Future<Optional<List<SikomDevice>>> getAllDevices({
    SikomGateway? gateway,
    Iterable<String> ids = const [],
  }) async {
    return guard(() async {
      final devices = <SikomDevice>[];
      Optional<ServiceConfig> credentials = await getCredentials();
      if (!credentials.isPresent) return const Optional.empty();
      // Ensure maximum 20 devices per request
      final queries = ids.isEmpty
          ? ['All']
          : ids.slices(20).map((slice) => slice.join(',')).toList();
      for (final query in queries) {
        final path = '/Device/$query${gateway == null ? '' : '/${gateway.id}'}';
        final response = await api.get(
          path,
          options: Options(
            headers: <String, String>{
              'authorization': toBasicAuth(credentials.value)
            },
            validateStatus: (status) {
              final success = status != null && status < 400;
              if (!success) {
                debugPrint(
                  'Sikom request failed: [$status] $path',
                );
              }
              return success;
            },
          ),
        );
        debugPrint(
          'Fetched Sikom Devices: [${response.statusCode}] ${response.realUri}',
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
    });
  }

  Future<Optional<String>> getDevicePropertyValue(
      String id, String name) async {
    return guard(() async {
      Optional<ServiceConfig> credentials = await getCredentials();
      if (!credentials.isPresent) return const Optional.empty();
      final path = '/Device/$id/Property/$name/Value/';
      final response = await api.get(
        path,
        options: Options(
          headers: <String, String>{
            'authorization': toBasicAuth(credentials.value)
          },
          validateStatus: (status) {
            final success = status != null && status < 400;
            if (!success) {
              debugPrint(
                'Sikom request failed: [$status] $path',
              );
            }
            return success;
          },
        ),
      );

      final result = SikomResponse.fromJson(response.data);
      final value = result.data.scalarResult.toString();
      debugPrint(
        'Fetched Sikom Property: [${response.statusCode}] ${response.realUri}[$value]',
      );
      return Optional.ofNullable(value);
    });
  }

  Future<Optional<SikomProperty>> setDeviceProperty(
      String id, SikomProperty property) async {
    return guard(() async {
      Optional<ServiceConfig> credentials = await getCredentials();
      if (!credentials.isPresent) return const Optional.empty();
      final path = '/Device/$id/AddProperty/${property.name}/${property.value}';
      final response = await api.get(
        path,
        options: Options(
          headers: <String, String>{
            'authorization': toBasicAuth(credentials.value)
          },
          validateStatus: (status) {
            final success = status != null && status < 400;
            if (!success) {
              debugPrint(
                'Sikom request failed: [$status] $path',
              );
            }
            return success;
          },
        ),
      );
      debugPrint(
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
        debugPrint(
          'Applied Sikom Property: [${response.statusCode}] ${response.realUri}[failed after 20 attempts]',
        );
      }
      return const Optional.empty();
    });
  }
}

final sikomClientProvider = Provider((ref) => SikomClient(
      ref,
      Dio(BaseOptions(headers: {}, baseUrl: 'https://api.connome.com/api'))
        // Process json in the background
        ..transformer = BackgroundTransformer(),
    ));
