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
    required this.creds,
  }) : api = Dio(BaseOptions(headers: {}, baseUrl: 'http://$host:$port'))
          // Process json in the background
          ..transformer = BackgroundTransformer();

  final Dio api;
  final FoscamCredentials creds;

  Future<bool> verifyCredentials() async {
    return guard(() async {
      final response = await _build('getIPInfo').get(api);
      return response.type == FoscamResultType.success;
    });
  }

  Future<Optional<Camera>> getCamera() async {
    return guard(() async {
      final info = await _build('getDevInfo').get(api);
      final motion = await _build('getMotionDetectConfig').get(api);
      return Optional.ofNullable(switch (info.type) {
        FoscamResultType.success => Camera(
            service: 'foscam',
            name: info.get('devName', ''),
            motion: MotionDetectConfig(
              enabled: motion.get('isEnable', false),
              sensitivity: MotionDetectSensitivityLevel.values[motion.get(
                'sensitivity',
                0,
              )],
            ),
          ),
        _ => null,
      });
    });
  }

  Future<Optional<CameraSnapshot>> getSnapshot() async {
    return guard(() async {
      final snapshot =
          await _build('snapPicture2', ResponseType.bytes).get(api);
      return Optional.ofNullable(switch (snapshot.type) {
        FoscamResultType.success => CameraSnapshot(snapshot.bytes),
        _ => null,
      });
    });
  }

  FoscamCommand _build(String command, [ResponseType? type]) => FoscamCommand(
        command,
        creds: creds,
        responseType: type,
      );
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

  final Map<String, String> params;

  String get baseUrl => '/cgi-bin/CGIProxy.fcgi?'
      'cmd=$name'
      '&usr=${creds.username}'
      '&pwd=${creds.password}';

  Future<FoscamResponse> get(Dio api) async {
    return guard(() async {
      String? xml;
      var type = FoscamResultType.unknownErr;
      try {
        final uri = Uri.parse(baseUrl);
        final url = uri.replace(queryParameters: {
          'cmd': name,
          'usr': creds.username,
          'pwd': creds.password,
          ...params,
        }).toString();

        final response = await (responseType == null
            ? api.get(url)
            : api.get(url, options: Options(responseType: responseType)));

        final contentType = response.headers['content-type'];
        debugPrint('Fetched camera [$name]: ${response.realUri}');

        if (contentType?.contains('image/jpeg') == true) {
          return FoscamResponse(
            type: FoscamResultType.success,
            bytes: response.data,
          );
        }

        type = FoscamResponse.parser.getResult(response.data);
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
}
