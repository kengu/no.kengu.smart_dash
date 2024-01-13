import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_dash/feature/camera/domain/camera.dart';
import 'package:smart_dash/util/guard.dart';

import 'camera_response.dart';

class CameraClient {
  CameraClient(this.ref, this.api);
  final Dio api;
  final Ref ref;

  Future<Camera> getCamera(String area, DateTime when) async {
    return guard(() async {
      final path = '/${when.year}/'
          '${when.month < 9 ? '0${when.month}' : when.month}-'
          '${when.day < 9 ? '0${when.day}' : when.day}_$area.json';
      final response = await api.get(path /*'/2023/03-28_NO5.json'*/);
      debugPrint('Fetched electricity prices for [$when]: ${response.realUri}');
      return CameraResponse.fromJson(
        {'data': response.data},
      ).data;
    });
  }
}

final VideoClientProvider = Provider((ref) => CameraClient(
      ref,
      Dio(BaseOptions(
          headers: {},
          baseUrl: 'https://www.hvakosterstrommen.no/api/v1/prices'))
        // Process json in the background
        ..transformer = BackgroundTransformer(),
    ));
