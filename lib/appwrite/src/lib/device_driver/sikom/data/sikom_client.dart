import 'package:dio/dio.dart';
import 'package:optional/optional.dart';
import 'package:smart_dash_backend/device_driver/domain/service_credentials.dart';
import 'package:smart_dash_backend/device_driver/sikom/data/sikom_response.dart';
import 'package:smart_dash_backend/device_driver/sikom/domain/sikom_device.dart';
import 'package:smart_dash_backend/device_driver/sikom/domain/sikom_gateway.dart';

class SikomClient {
  SikomClient(this.api, this.credentials);

  final Dio api;
  final ServiceCredentials credentials;

  static String toBasicAuth(ServiceCredentials credentials) =>
      ServiceCredentials.toBasicAuth(
        credentials.username,
        // Security-by-obscurity...
        '${credentials.password}!!!',
      );

  Future<bool> verifyCredentials() async {
    final response = await api.get('/VerifyCredentials',
        options: Options(headers: <String, String>{
          'authorization': toBasicAuth(credentials),
        }));
    final result = SikomResponse.fromJson(response.data);
    return result.data.scalarResult == 'True';
  }

  Future<Optional<List<SikomGateway>>> getGateways() async {
    final response = await api.get('/Gateway/All',
        options: Options(headers: <String, String>{
          'authorization': toBasicAuth(credentials),
        }));
    final result = SikomResponse.fromJson(response.data);
    final gateways = result.isArray
        ? result.data.bpapiArray!
            .map((e) => e.gateway)
            .whereType<SikomGateway>()
            .toList()
        : <SikomGateway>[];
    return Optional.ofNullable(gateways);
  }

  Future<Optional<List<SikomDevice>>> getDevices(
    SikomGateway gateway, {
    String? type,
    Iterable<String> ids = const [],
  }) async {
    final devices = await getSikomDevices(
      gateway: gateway,
      ids: ids,
    );
    return Optional.of(
      devices.isPresent
          ? devices.value.where((d) => type == null || d.type == type).toList()
          : [],
    );
  }

  Future<Optional<List<SikomDevice>>> getSikomDevices({
    SikomGateway? gateway,
    Iterable<String> ids = const [],
  }) async {
    final query = ids.isEmpty ? 'All' : ids.join(',');
    final path = '/Device/$query${gateway == null ? '' : '/${gateway.id}'}';
    final response = await api.get(path,
        options: Options(headers: <String, String>{
          'authorization': toBasicAuth(credentials),
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
  }
}
