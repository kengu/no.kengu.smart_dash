import 'package:dio/dio.dart';
import 'package:smart_dash_common/smart_dash_common.dart';

abstract class JsonClient<I, T> extends DioClient {
  JsonClient(super.api) {
    if (api.interceptors.whereType<JsonClientInterceptor<T>>().isEmpty) {
      api.interceptors.removeImplyContentTypeInterceptor();
      final interceptor = JsonClientInterceptor<T>(
        this.fromJson,
        this.toJson,
      );
      api.interceptors.add(interceptor);
      _interceptors.add(interceptor);
    }
  }

  final List<JsonClientInterceptor> _interceptors = [];

  dynamic toJson(T data);
  T fromJson(JsonObject data);

  @override
  void close({bool force = false}) {
    if (_interceptors.isNotEmpty) {
      for (final it in _interceptors) {
        api.interceptors.remove(it);
      }
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
    if (options.data is T || options.data is List<T>) {
      options.data = toJson(options.data);
      options.contentType = Headers.jsonContentType;
    }
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(
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
    } else if (response.data is List<JsonObject>) {
      final data = List<JsonObject>.from(response.data).map(fromJson).toList();
      super.onResponse(
        Response<List<T>>(
          data: data,
          extra: response.extra,
          headers: response.headers,
          redirects: response.redirects,
          isRedirect: response.isRedirect,
          statusCode: response.statusCode,
          statusMessage: response.statusMessage,
          requestOptions: response.requestOptions,
        ),
        handler,
      );
    }
    if (!handler.isCompleted) {
      super.onResponse(response, handler);
    }
  }
}
