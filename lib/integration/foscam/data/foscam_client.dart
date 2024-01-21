import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:optional/optional.dart';
import 'package:smart_dash/feature/camera/domain/camera.dart';
import 'package:smart_dash/util/guard.dart';

import 'foscam_response.dart';

class FoscamClient {
  FoscamClient({
    required String host,
    required int port,
    required this.credentials,
  }) : api = Dio(BaseOptions(headers: {}, baseUrl: 'http://$host:$port'))
          // Process json in the background
          ..transformer = BackgroundTransformer();

  final Dio api;
  final FoscamCredentials credentials;

  Future<bool> verifyCredentials() async {
    return guard(() async {
      final response = await _command('getIPInfo').exec(api);
      return response.type == FoscamResultType.success;
    });
  }

  Future<Optional<Camera>> getCamera() async {
    return guard(() async {
      final info = await _command('getDevInfo').exec(api);
      final motion = await getMotionConfig();
      return Optional.ofNullable(switch (info.type) {
        FoscamResultType.success => Camera(
            service: 'foscam',
            motion: motion.orElseNull,
            name: info.get('devName', ''),
          ),
        _ => null,
      });
    });
  }

  Future<Optional<MotionDetectConfig>> getMotionConfig() async {
    return guard(() async {
      final motion = await _command('getMotionDetectConfig').exec(api);
      return Optional.ofNullable(switch (motion.type) {
        FoscamResultType.success => fromResponse(motion),
        _ => null,
      });
    });
  }

  Future<Optional<MotionDetectConfig>> setMotionConfig(
      String name, MotionDetectConfig config) async {
    return guard(() async {
      // Modifying CGI commands expects all parameters to be replaced (aka PUT)
      final motion = await _command('getMotionDetectConfig').exec(api);
      if (motion.type == FoscamResultType.success) {
        // Override last known state
        final params = motion.toJson();
        params['isEnable'] = (config.enabled ? 1 : 0).toString();
        params['sensitivity'] = config.sensitivity.value.toString();

        final next = await _command(
          'setMotionDetectConfig',
          params: params,
        ).exec(api);

        // Return updated motion config if successfully applied
        return Optional.ofNullable(switch (next.type) {
          FoscamResultType.success => fromResponse(motion).copyWith(
              enabled: config.enabled,
              sensitivity: config.sensitivity,
            ),
          _ => null,
        });
      }
      return const Optional.empty();
    });
  }

  Future<Optional<CameraSnapshot>> getSnapshot() async {
    return guard(() async {
      final snapshot = await _command(
        'snapPicture2',
        type: ResponseType.bytes,
      ).exec(api);
      return Optional.ofNullable(switch (snapshot.type) {
        FoscamResultType.success => CameraSnapshot(snapshot.bytes),
        _ => null,
      });
    });
  }

  void close() => api.close();

  FoscamCommand _command(
    String command, {
    ResponseType? type,
    Map<String, dynamic> params = const {},
  }) =>
      FoscamCommand(
        command,
        creds: credentials,
        params: params,
        responseType: type,
      );

  MotionDetectConfig fromResponse(FoscamResponse motion) {
    return MotionDetectConfig(
      enabled: motion.get('isEnable', false),
      sensitivity: MotionDetectSensitivityLevel.values[motion.get(
        'sensitivity',
        0,
      )],
    );
  }
}

class FoscamCredentials {
  FoscamCredentials({
    required this.username,
    required this.password,
  });
  final String username;
  final String password;
}

class FoscamCommand {
  FoscamCommand(
    this.name, {
    required this.creds,
    this.responseType,
    this.params = const {},
  });

  final String name;

  final FoscamCredentials creds;

  final ResponseType? responseType;

  final Map<String, dynamic> params;

  String get baseUrl => '/cgi-bin/CGIProxy.fcgi?'
      'cmd=$name'
      '&usr=${creds.username}'
      '&pwd=${creds.password}';

  Future<FoscamResponse> exec(Dio api) async {
    return guard(() async {
      String? xml;
      var type = FoscamResultType.unknownErr;
      try {
        final query = _toQuery();
        final uri = Uri.parse('$baseUrl${query.isEmpty ? '' : '&$query'}');
        final url = uri.toString();

        final response = await (responseType == null
            ? api.get(url)
            : api.get(url, options: Options(responseType: responseType)));

        final contentType = response.headers['content-type'];

        if (contentType?.contains('image/jpeg') == true) {
          debugPrint(
            'Fetched camera image [$name][${response.statusCode}]: ${response.realUri}',
          );
          return FoscamResponse(
            type: FoscamResultType.success,
            bytes: response.data,
          );
        }

        type = FoscamResponse.parser.getResult(response.data);
        debugPrint(
          'Fetched camera data [$name][${response.statusCode}][${type.name}]: ${response.realUri}',
        );
        if (type != FoscamResultType.invalidResponse) {
          return FoscamResponse(
            type: type,
            data: response.data,
          );
        }
      } catch (e, stackTrace) {
        // Fall through
        debugPrint(e.toString());
        debugPrintStack(stackTrace: stackTrace);
      }
      return FoscamResponse(
        type: type,
        data: xml,
      );
    });
  }

  String _toQuery() =>
      params.entries.map((e) => '${e.key}=${e.value}').join('&');
}
