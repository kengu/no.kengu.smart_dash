import 'package:dio/dio.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash_integration/smart_dash_integration.dart';
import 'package:smart_dash_snow/smart_dash_snow.dart';

part 'snow_consumer_client.g.dart';

class SnowConsumerClient extends QueryClient<String, SnowState> {
  SnowConsumerClient(Dio api) : super(api, 'snow');

  @override
  String toId(SnowState item) {
    return item.location;
  }

  @override
  SnowState fromJson(JsonObject data) {
    return SnowState.fromJson(data);
  }

  @override
  JsonObject toJson(SnowState data) {
    return data.toJson();
  }
}

@Riverpod(keepAlive: true)
SnowConsumerClient snowConsumerClient(Ref ref, String baseUrl) {
  return SnowConsumerClient(
    Dio(BaseOptions(headers: {}, baseUrl: baseUrl))
      // Process json in the background
      ..transformer = BackgroundTransformer(),
  );
}
