import 'package:dio/dio.dart';
import 'package:optional/optional.dart';
import 'package:smart_dash_common/smart_dash_common.dart';

abstract class JsonClient<I, T> extends DioClient {
  JsonClient(super.api) {
    if (api.interceptors.whereType<JsonClientInterceptor<T>>().isEmpty) {
      api.interceptors.removeImplyContentTypeInterceptor();
      _interceptor = Optional.of(JsonClientInterceptor<T>(
        this.fromJson,
        this.toJson,
      ));
      api.interceptors.add(_interceptor.value);
    }
  }

  Optional<JsonClientInterceptor<T>> _interceptor = Optional.empty();

  dynamic toJson(T data);
  T fromJson(JsonObject data);

  @override
  void close({bool force = false}) {
    if (_interceptor.isPresent) {
      api.interceptors.remove(_interceptor.value);
    }
    super.close(force: force);
  }
}

class JsonClientInterceptor<T> extends InterceptorsWrapper {
  JsonClientInterceptor(this.fromJson, this.toJson);

  T Function(JsonObject data) fromJson;
  dynamic Function(T data) toJson;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (options.data is T) {
      options.data = toJson(options.data);
      options.contentType = Headers.jsonContentType;
    }
    return super.onRequest(options, handler);
  }

  @override
  Future onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    if (response.data is JsonObject) {
      super.onResponse(
        Response<T>(
          extra: response.extra,
          headers: response.headers,
          data: fromJson(response.data),
          redirects: response.redirects,
          isRedirect: response.isRedirect,
          statusCode: response.statusCode,
          statusMessage: response.statusMessage,
          requestOptions: response.requestOptions,
        ),
        handler,
      );
    }
    return super.onResponse(response, handler);
  }
}
