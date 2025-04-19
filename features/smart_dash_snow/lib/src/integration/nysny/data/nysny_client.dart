import 'package:dio/dio.dart';
import 'package:optional/optional.dart';
import 'package:smart_dash_common/smart_dash_common.dart';
import 'package:smart_dash_snow/smart_dash_snow.dart';
import 'package:smart_dash_snow/src/driver/snow_driver_client.dart';
import 'package:smart_dash_snow/src/integration/nysny/application/nysny_response.dart';

class NySnyClient extends SnowDriverClient<NySnyResponse> {
  NySnyClient(this.credentials)
      : super(
          Dio(
            BaseOptions(
              baseUrl: 'https://nysny.no/',
              headers: {
                'Authorization': 'Bearer ${credentials.password}',
              },
            ),
          )
            // Process json in the background
            ..transformer = BackgroundTransformer(),
          prefix: 'dataexport',
          suffix: 'get2.php',
        );

  final NySnyCredentials credentials;

  @override
  String toId(SnowState item) {
    return item.location;
  }

  @override
  SnowState fromData(NySnyResponse data) {
    return data.sensors.first.toSnowState();
  }

  @override
  NySnyResponse fromJson(JsonObject data) {
    return NySnyResponse.fromData(data);
  }

  @override
  dynamic toJson(NySnyResponse data) {
    throw UnimplementedError();
  }

  @override
  String buildQuery(Iterable<String> ids) {
    //final params = ['sensors', 'username', 'token'];
    final params = ['sensors', 'username'];
    final values = ids.toList();
    assert(
//      ids.length == 3,
      ids.length == 2,
      'expects ${params.length}: ${params.join(',')}',
    );
    final query = <String>[];
    for (int i = 0; i < params.length; i++) {
      query.add('${params[i]}=${values[i]}');
    }
    return query.join('&');
  }

  @override
  Future<Optional<SnowState>> getState(String location) async {
    // Direct lookup of location not supported by NySny
    final states = await getStates();
    if (states.isPresent) {
      return states.value.firstWhereOptional(
        (e) => e.location.toLowerCase() == location,
      );
    }
    return Optional.empty();
  }

  @override
  Future<Optional<List<SnowState>>> executeQueryMany(String path) async {
    final response = await executeQuery<NySnyResponse>(path);
    if (response.isPresent) {
      return Optional.of(
        response.value.sensors.map((e) => e.toSnowState()).toList(),
      );
    }
    return Optional.empty();
  }

  @override
  Future<Optional<List<SnowState>>> getStates() async {
    final sensors = await getAll([
      'all',
      credentials.email,
//      credentials.password,
    ]);
    return Optional.of(sensors);
  }
}

class NySnyCredentials {
  NySnyCredentials({
    required this.email,
    required this.password,
  });
  final String email;
  final String password;
}
