import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:optional/optional.dart';
import 'package:smart_dash/feature/account/data/account_repository.dart';
import 'package:smart_dash/feature/account/domain/service_credentials.dart';
import 'package:smart_dash/feature/identity/data/user_repository.dart';
import 'package:smart_dash/feature/sikom/data/sikom_response.dart';
import 'package:smart_dash/feature/sikom/domain/sikom_device.dart';
import 'package:smart_dash/feature/sikom/domain/sikom_gateway.dart';
import 'package:smart_dash/util/guard.dart';

class SikomClient {
  SikomClient(this.ref, this.api);
  final Dio api;
  final Ref ref;

  static String toBasicAuth(ServiceCredentials credentials) =>
      ServiceCredentials.toBasicAuth(
        credentials.username,
        // Security-by-obscurity-V-
        '${credentials.password}!!!',
      );

  Future<Optional<ServiceCredentials>> getCredentials() async {
    return guard(() async {
      final user = ref.read(userRepositoryProvider).currentUser;
      final account =
          await ref.read(accountRepositoryProvider).get(user.userId);
      return account.value.lookup('sikom');
    });
  }

  Future<bool> verifyCredentials() async {
    return guard(() async {
      Optional<ServiceCredentials> credentials = await getCredentials();
      final response = await api.get('/VerifyCredentials',
          options: Options(headers: <String, String>{
            'authorization': toBasicAuth(credentials.value),
          }));
      final result = SikomResponse.fromJson(response.data);
      return result.data.scalarResult == 'True';
    });
  }

  Future<Optional<List<SikomGateway>>> getGateways() async {
    return guard(() async {
      Optional<ServiceCredentials> credentials = await getCredentials();
      final response = await api.get('/Gateway/All',
          options: Options(headers: <String, String>{
            'authorization': toBasicAuth(credentials.value),
          }));
      final result = SikomResponse.fromJson(response.data);
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
    String? type,
    Iterable<String> ids = const [],
  }) async {
    return guard(() async {
      final devices = await getSikomDevices(
        gateway: gateway,
        ids: ids,
      );
      return Optional.of(
        devices.isPresent
            ? devices.value
                .where((d) => type == null || d.type == type)
                .toList()
            : [],
      );
    });
  }

  Future<Optional<List<SikomDevice>>> getSikomDevices({
    SikomGateway? gateway,
    Iterable<String> ids = const [],
  }) async {
    return guard(() async {
      Optional<ServiceCredentials> credentials = await getCredentials();
      final query = ids.isEmpty ? 'All' : ids.join(',');
      final path = '/Device/$query${gateway == null ? '' : '/${gateway.id}'}';
      final response = await api.get(path,
          options: Options(headers: <String, String>{
            'authorization': toBasicAuth(credentials.value),
          }));
      final result = SikomResponse.fromJson(response.data);
      if (result.isArray) {
        final devices = result.data.bpapiArray!
            .map((e) => e.device)
            .whereType<SikomDevice>()
            .where((e) => e.isReal)
            .toList();
        return Optional.ofNullable(devices);
      }
      return Optional.of(
        result.isDevice ? [result.data.device!] : [],
      );
    });
  }
}

final sikomClientProvider = Provider((ref) => SikomClient(
      ref,
      Dio(BaseOptions(headers: {}, baseUrl: 'https://api.connome.com/api'))
        // Process json in the background
        ..transformer = BackgroundTransformer(),
    ));
