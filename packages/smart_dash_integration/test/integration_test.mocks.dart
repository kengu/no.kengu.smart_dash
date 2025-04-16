// Mocks generated by Mockito 5.4.5 from annotations
// in smart_dash_integration/test/integration_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i10;

import 'package:dio/src/adapter.dart' as _i3;
import 'package:dio/src/cancel_token.dart' as _i11;
import 'package:dio/src/dio.dart' as _i7;
import 'package:dio/src/dio_mixin.dart' as _i5;
import 'package:dio/src/options.dart' as _i2;
import 'package:dio/src/response.dart' as _i6;
import 'package:dio/src/transformer.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i13;
import 'package:optional/optional.dart' as _i9;
import 'package:riverpod/riverpod.dart' as _i8;
import 'package:smart_dash_integration/smart_dash_integration.dart' as _i12;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: must_be_immutable
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeBaseOptions_0 extends _i1.SmartFake implements _i2.BaseOptions {
  _FakeBaseOptions_0(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeHttpClientAdapter_1 extends _i1.SmartFake
    implements _i3.HttpClientAdapter {
  _FakeHttpClientAdapter_1(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeTransformer_2 extends _i1.SmartFake implements _i4.Transformer {
  _FakeTransformer_2(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeInterceptors_3 extends _i1.SmartFake implements _i5.Interceptors {
  _FakeInterceptors_3(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeResponse_4<T1> extends _i1.SmartFake implements _i6.Response<T1> {
  _FakeResponse_4(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeDio_5 extends _i1.SmartFake implements _i7.Dio {
  _FakeDio_5(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeRef_6<State extends Object?> extends _i1.SmartFake
    implements _i8.Ref<State> {
  _FakeRef_6(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeOptional_7<T> extends _i1.SmartFake implements _i9.Optional<T> {
  _FakeOptional_7(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

/// A class which mocks [Dio].
///
/// See the documentation for Mockito's code generation for more information.
class MockDio extends _i1.Mock implements _i7.Dio {
  MockDio() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.BaseOptions get options =>
      (super.noSuchMethod(
            Invocation.getter(#options),
            returnValue: _FakeBaseOptions_0(this, Invocation.getter(#options)),
          )
          as _i2.BaseOptions);

  @override
  set options(_i2.BaseOptions? _options) => super.noSuchMethod(
    Invocation.setter(#options, _options),
    returnValueForMissingStub: null,
  );

  @override
  _i3.HttpClientAdapter get httpClientAdapter =>
      (super.noSuchMethod(
            Invocation.getter(#httpClientAdapter),
            returnValue: _FakeHttpClientAdapter_1(
              this,
              Invocation.getter(#httpClientAdapter),
            ),
          )
          as _i3.HttpClientAdapter);

  @override
  set httpClientAdapter(_i3.HttpClientAdapter? _httpClientAdapter) =>
      super.noSuchMethod(
        Invocation.setter(#httpClientAdapter, _httpClientAdapter),
        returnValueForMissingStub: null,
      );

  @override
  _i4.Transformer get transformer =>
      (super.noSuchMethod(
            Invocation.getter(#transformer),
            returnValue: _FakeTransformer_2(
              this,
              Invocation.getter(#transformer),
            ),
          )
          as _i4.Transformer);

  @override
  set transformer(_i4.Transformer? _transformer) => super.noSuchMethod(
    Invocation.setter(#transformer, _transformer),
    returnValueForMissingStub: null,
  );

  @override
  _i5.Interceptors get interceptors =>
      (super.noSuchMethod(
            Invocation.getter(#interceptors),
            returnValue: _FakeInterceptors_3(
              this,
              Invocation.getter(#interceptors),
            ),
          )
          as _i5.Interceptors);

  @override
  void close({bool? force = false}) => super.noSuchMethod(
    Invocation.method(#close, [], {#force: force}),
    returnValueForMissingStub: null,
  );

  @override
  _i10.Future<_i6.Response<T>> head<T>(
    String? path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    _i2.Options? options,
    _i11.CancelToken? cancelToken,
  }) =>
      (super.noSuchMethod(
            Invocation.method(
              #head,
              [path],
              {
                #data: data,
                #queryParameters: queryParameters,
                #options: options,
                #cancelToken: cancelToken,
              },
            ),
            returnValue: _i10.Future<_i6.Response<T>>.value(
              _FakeResponse_4<T>(
                this,
                Invocation.method(
                  #head,
                  [path],
                  {
                    #data: data,
                    #queryParameters: queryParameters,
                    #options: options,
                    #cancelToken: cancelToken,
                  },
                ),
              ),
            ),
          )
          as _i10.Future<_i6.Response<T>>);

  @override
  _i10.Future<_i6.Response<T>> headUri<T>(
    Uri? uri, {
    Object? data,
    _i2.Options? options,
    _i11.CancelToken? cancelToken,
  }) =>
      (super.noSuchMethod(
            Invocation.method(
              #headUri,
              [uri],
              {#data: data, #options: options, #cancelToken: cancelToken},
            ),
            returnValue: _i10.Future<_i6.Response<T>>.value(
              _FakeResponse_4<T>(
                this,
                Invocation.method(
                  #headUri,
                  [uri],
                  {#data: data, #options: options, #cancelToken: cancelToken},
                ),
              ),
            ),
          )
          as _i10.Future<_i6.Response<T>>);

  @override
  _i10.Future<_i6.Response<T>> get<T>(
    String? path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    _i2.Options? options,
    _i11.CancelToken? cancelToken,
    _i2.ProgressCallback? onReceiveProgress,
  }) =>
      (super.noSuchMethod(
            Invocation.method(
              #get,
              [path],
              {
                #data: data,
                #queryParameters: queryParameters,
                #options: options,
                #cancelToken: cancelToken,
                #onReceiveProgress: onReceiveProgress,
              },
            ),
            returnValue: _i10.Future<_i6.Response<T>>.value(
              _FakeResponse_4<T>(
                this,
                Invocation.method(
                  #get,
                  [path],
                  {
                    #data: data,
                    #queryParameters: queryParameters,
                    #options: options,
                    #cancelToken: cancelToken,
                    #onReceiveProgress: onReceiveProgress,
                  },
                ),
              ),
            ),
          )
          as _i10.Future<_i6.Response<T>>);

  @override
  _i10.Future<_i6.Response<T>> getUri<T>(
    Uri? uri, {
    Object? data,
    _i2.Options? options,
    _i11.CancelToken? cancelToken,
    _i2.ProgressCallback? onReceiveProgress,
  }) =>
      (super.noSuchMethod(
            Invocation.method(
              #getUri,
              [uri],
              {
                #data: data,
                #options: options,
                #cancelToken: cancelToken,
                #onReceiveProgress: onReceiveProgress,
              },
            ),
            returnValue: _i10.Future<_i6.Response<T>>.value(
              _FakeResponse_4<T>(
                this,
                Invocation.method(
                  #getUri,
                  [uri],
                  {
                    #data: data,
                    #options: options,
                    #cancelToken: cancelToken,
                    #onReceiveProgress: onReceiveProgress,
                  },
                ),
              ),
            ),
          )
          as _i10.Future<_i6.Response<T>>);

  @override
  _i10.Future<_i6.Response<T>> post<T>(
    String? path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    _i2.Options? options,
    _i11.CancelToken? cancelToken,
    _i2.ProgressCallback? onSendProgress,
    _i2.ProgressCallback? onReceiveProgress,
  }) =>
      (super.noSuchMethod(
            Invocation.method(
              #post,
              [path],
              {
                #data: data,
                #queryParameters: queryParameters,
                #options: options,
                #cancelToken: cancelToken,
                #onSendProgress: onSendProgress,
                #onReceiveProgress: onReceiveProgress,
              },
            ),
            returnValue: _i10.Future<_i6.Response<T>>.value(
              _FakeResponse_4<T>(
                this,
                Invocation.method(
                  #post,
                  [path],
                  {
                    #data: data,
                    #queryParameters: queryParameters,
                    #options: options,
                    #cancelToken: cancelToken,
                    #onSendProgress: onSendProgress,
                    #onReceiveProgress: onReceiveProgress,
                  },
                ),
              ),
            ),
          )
          as _i10.Future<_i6.Response<T>>);

  @override
  _i10.Future<_i6.Response<T>> postUri<T>(
    Uri? uri, {
    Object? data,
    _i2.Options? options,
    _i11.CancelToken? cancelToken,
    _i2.ProgressCallback? onSendProgress,
    _i2.ProgressCallback? onReceiveProgress,
  }) =>
      (super.noSuchMethod(
            Invocation.method(
              #postUri,
              [uri],
              {
                #data: data,
                #options: options,
                #cancelToken: cancelToken,
                #onSendProgress: onSendProgress,
                #onReceiveProgress: onReceiveProgress,
              },
            ),
            returnValue: _i10.Future<_i6.Response<T>>.value(
              _FakeResponse_4<T>(
                this,
                Invocation.method(
                  #postUri,
                  [uri],
                  {
                    #data: data,
                    #options: options,
                    #cancelToken: cancelToken,
                    #onSendProgress: onSendProgress,
                    #onReceiveProgress: onReceiveProgress,
                  },
                ),
              ),
            ),
          )
          as _i10.Future<_i6.Response<T>>);

  @override
  _i10.Future<_i6.Response<T>> put<T>(
    String? path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    _i2.Options? options,
    _i11.CancelToken? cancelToken,
    _i2.ProgressCallback? onSendProgress,
    _i2.ProgressCallback? onReceiveProgress,
  }) =>
      (super.noSuchMethod(
            Invocation.method(
              #put,
              [path],
              {
                #data: data,
                #queryParameters: queryParameters,
                #options: options,
                #cancelToken: cancelToken,
                #onSendProgress: onSendProgress,
                #onReceiveProgress: onReceiveProgress,
              },
            ),
            returnValue: _i10.Future<_i6.Response<T>>.value(
              _FakeResponse_4<T>(
                this,
                Invocation.method(
                  #put,
                  [path],
                  {
                    #data: data,
                    #queryParameters: queryParameters,
                    #options: options,
                    #cancelToken: cancelToken,
                    #onSendProgress: onSendProgress,
                    #onReceiveProgress: onReceiveProgress,
                  },
                ),
              ),
            ),
          )
          as _i10.Future<_i6.Response<T>>);

  @override
  _i10.Future<_i6.Response<T>> putUri<T>(
    Uri? uri, {
    Object? data,
    _i2.Options? options,
    _i11.CancelToken? cancelToken,
    _i2.ProgressCallback? onSendProgress,
    _i2.ProgressCallback? onReceiveProgress,
  }) =>
      (super.noSuchMethod(
            Invocation.method(
              #putUri,
              [uri],
              {
                #data: data,
                #options: options,
                #cancelToken: cancelToken,
                #onSendProgress: onSendProgress,
                #onReceiveProgress: onReceiveProgress,
              },
            ),
            returnValue: _i10.Future<_i6.Response<T>>.value(
              _FakeResponse_4<T>(
                this,
                Invocation.method(
                  #putUri,
                  [uri],
                  {
                    #data: data,
                    #options: options,
                    #cancelToken: cancelToken,
                    #onSendProgress: onSendProgress,
                    #onReceiveProgress: onReceiveProgress,
                  },
                ),
              ),
            ),
          )
          as _i10.Future<_i6.Response<T>>);

  @override
  _i10.Future<_i6.Response<T>> patch<T>(
    String? path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    _i2.Options? options,
    _i11.CancelToken? cancelToken,
    _i2.ProgressCallback? onSendProgress,
    _i2.ProgressCallback? onReceiveProgress,
  }) =>
      (super.noSuchMethod(
            Invocation.method(
              #patch,
              [path],
              {
                #data: data,
                #queryParameters: queryParameters,
                #options: options,
                #cancelToken: cancelToken,
                #onSendProgress: onSendProgress,
                #onReceiveProgress: onReceiveProgress,
              },
            ),
            returnValue: _i10.Future<_i6.Response<T>>.value(
              _FakeResponse_4<T>(
                this,
                Invocation.method(
                  #patch,
                  [path],
                  {
                    #data: data,
                    #queryParameters: queryParameters,
                    #options: options,
                    #cancelToken: cancelToken,
                    #onSendProgress: onSendProgress,
                    #onReceiveProgress: onReceiveProgress,
                  },
                ),
              ),
            ),
          )
          as _i10.Future<_i6.Response<T>>);

  @override
  _i10.Future<_i6.Response<T>> patchUri<T>(
    Uri? uri, {
    Object? data,
    _i2.Options? options,
    _i11.CancelToken? cancelToken,
    _i2.ProgressCallback? onSendProgress,
    _i2.ProgressCallback? onReceiveProgress,
  }) =>
      (super.noSuchMethod(
            Invocation.method(
              #patchUri,
              [uri],
              {
                #data: data,
                #options: options,
                #cancelToken: cancelToken,
                #onSendProgress: onSendProgress,
                #onReceiveProgress: onReceiveProgress,
              },
            ),
            returnValue: _i10.Future<_i6.Response<T>>.value(
              _FakeResponse_4<T>(
                this,
                Invocation.method(
                  #patchUri,
                  [uri],
                  {
                    #data: data,
                    #options: options,
                    #cancelToken: cancelToken,
                    #onSendProgress: onSendProgress,
                    #onReceiveProgress: onReceiveProgress,
                  },
                ),
              ),
            ),
          )
          as _i10.Future<_i6.Response<T>>);

  @override
  _i10.Future<_i6.Response<T>> delete<T>(
    String? path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    _i2.Options? options,
    _i11.CancelToken? cancelToken,
  }) =>
      (super.noSuchMethod(
            Invocation.method(
              #delete,
              [path],
              {
                #data: data,
                #queryParameters: queryParameters,
                #options: options,
                #cancelToken: cancelToken,
              },
            ),
            returnValue: _i10.Future<_i6.Response<T>>.value(
              _FakeResponse_4<T>(
                this,
                Invocation.method(
                  #delete,
                  [path],
                  {
                    #data: data,
                    #queryParameters: queryParameters,
                    #options: options,
                    #cancelToken: cancelToken,
                  },
                ),
              ),
            ),
          )
          as _i10.Future<_i6.Response<T>>);

  @override
  _i10.Future<_i6.Response<T>> deleteUri<T>(
    Uri? uri, {
    Object? data,
    _i2.Options? options,
    _i11.CancelToken? cancelToken,
  }) =>
      (super.noSuchMethod(
            Invocation.method(
              #deleteUri,
              [uri],
              {#data: data, #options: options, #cancelToken: cancelToken},
            ),
            returnValue: _i10.Future<_i6.Response<T>>.value(
              _FakeResponse_4<T>(
                this,
                Invocation.method(
                  #deleteUri,
                  [uri],
                  {#data: data, #options: options, #cancelToken: cancelToken},
                ),
              ),
            ),
          )
          as _i10.Future<_i6.Response<T>>);

  @override
  _i10.Future<_i6.Response<dynamic>> download(
    String? urlPath,
    dynamic savePath, {
    _i2.ProgressCallback? onReceiveProgress,
    Map<String, dynamic>? queryParameters,
    _i11.CancelToken? cancelToken,
    bool? deleteOnError = true,
    _i2.FileAccessMode? fileAccessMode = _i2.FileAccessMode.write,
    String? lengthHeader = 'content-length',
    Object? data,
    _i2.Options? options,
  }) =>
      (super.noSuchMethod(
            Invocation.method(
              #download,
              [urlPath, savePath],
              {
                #onReceiveProgress: onReceiveProgress,
                #queryParameters: queryParameters,
                #cancelToken: cancelToken,
                #deleteOnError: deleteOnError,
                #fileAccessMode: fileAccessMode,
                #lengthHeader: lengthHeader,
                #data: data,
                #options: options,
              },
            ),
            returnValue: _i10.Future<_i6.Response<dynamic>>.value(
              _FakeResponse_4<dynamic>(
                this,
                Invocation.method(
                  #download,
                  [urlPath, savePath],
                  {
                    #onReceiveProgress: onReceiveProgress,
                    #queryParameters: queryParameters,
                    #cancelToken: cancelToken,
                    #deleteOnError: deleteOnError,
                    #fileAccessMode: fileAccessMode,
                    #lengthHeader: lengthHeader,
                    #data: data,
                    #options: options,
                  },
                ),
              ),
            ),
          )
          as _i10.Future<_i6.Response<dynamic>>);

  @override
  _i10.Future<_i6.Response<dynamic>> downloadUri(
    Uri? uri,
    dynamic savePath, {
    _i2.ProgressCallback? onReceiveProgress,
    _i11.CancelToken? cancelToken,
    bool? deleteOnError = true,
    _i2.FileAccessMode? fileAccessMode = _i2.FileAccessMode.write,
    String? lengthHeader = 'content-length',
    Object? data,
    _i2.Options? options,
  }) =>
      (super.noSuchMethod(
            Invocation.method(
              #downloadUri,
              [uri, savePath],
              {
                #onReceiveProgress: onReceiveProgress,
                #cancelToken: cancelToken,
                #deleteOnError: deleteOnError,
                #fileAccessMode: fileAccessMode,
                #lengthHeader: lengthHeader,
                #data: data,
                #options: options,
              },
            ),
            returnValue: _i10.Future<_i6.Response<dynamic>>.value(
              _FakeResponse_4<dynamic>(
                this,
                Invocation.method(
                  #downloadUri,
                  [uri, savePath],
                  {
                    #onReceiveProgress: onReceiveProgress,
                    #cancelToken: cancelToken,
                    #deleteOnError: deleteOnError,
                    #fileAccessMode: fileAccessMode,
                    #lengthHeader: lengthHeader,
                    #data: data,
                    #options: options,
                  },
                ),
              ),
            ),
          )
          as _i10.Future<_i6.Response<dynamic>>);

  @override
  _i10.Future<_i6.Response<T>> request<T>(
    String? url, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    _i11.CancelToken? cancelToken,
    _i2.Options? options,
    _i2.ProgressCallback? onSendProgress,
    _i2.ProgressCallback? onReceiveProgress,
  }) =>
      (super.noSuchMethod(
            Invocation.method(
              #request,
              [url],
              {
                #data: data,
                #queryParameters: queryParameters,
                #cancelToken: cancelToken,
                #options: options,
                #onSendProgress: onSendProgress,
                #onReceiveProgress: onReceiveProgress,
              },
            ),
            returnValue: _i10.Future<_i6.Response<T>>.value(
              _FakeResponse_4<T>(
                this,
                Invocation.method(
                  #request,
                  [url],
                  {
                    #data: data,
                    #queryParameters: queryParameters,
                    #cancelToken: cancelToken,
                    #options: options,
                    #onSendProgress: onSendProgress,
                    #onReceiveProgress: onReceiveProgress,
                  },
                ),
              ),
            ),
          )
          as _i10.Future<_i6.Response<T>>);

  @override
  _i10.Future<_i6.Response<T>> requestUri<T>(
    Uri? uri, {
    Object? data,
    _i11.CancelToken? cancelToken,
    _i2.Options? options,
    _i2.ProgressCallback? onSendProgress,
    _i2.ProgressCallback? onReceiveProgress,
  }) =>
      (super.noSuchMethod(
            Invocation.method(
              #requestUri,
              [uri],
              {
                #data: data,
                #cancelToken: cancelToken,
                #options: options,
                #onSendProgress: onSendProgress,
                #onReceiveProgress: onReceiveProgress,
              },
            ),
            returnValue: _i10.Future<_i6.Response<T>>.value(
              _FakeResponse_4<T>(
                this,
                Invocation.method(
                  #requestUri,
                  [uri],
                  {
                    #data: data,
                    #cancelToken: cancelToken,
                    #options: options,
                    #onSendProgress: onSendProgress,
                    #onReceiveProgress: onReceiveProgress,
                  },
                ),
              ),
            ),
          )
          as _i10.Future<_i6.Response<T>>);

  @override
  _i10.Future<_i6.Response<T>> fetch<T>(_i2.RequestOptions? requestOptions) =>
      (super.noSuchMethod(
            Invocation.method(#fetch, [requestOptions]),
            returnValue: _i10.Future<_i6.Response<T>>.value(
              _FakeResponse_4<T>(
                this,
                Invocation.method(#fetch, [requestOptions]),
              ),
            ),
          )
          as _i10.Future<_i6.Response<T>>);

  @override
  _i7.Dio clone({
    _i2.BaseOptions? options,
    _i5.Interceptors? interceptors,
    _i3.HttpClientAdapter? httpClientAdapter,
    _i4.Transformer? transformer,
  }) =>
      (super.noSuchMethod(
            Invocation.method(#clone, [], {
              #options: options,
              #interceptors: interceptors,
              #httpClientAdapter: httpClientAdapter,
              #transformer: transformer,
            }),
            returnValue: _FakeDio_5(
              this,
              Invocation.method(#clone, [], {
                #options: options,
                #interceptors: interceptors,
                #httpClientAdapter: httpClientAdapter,
                #transformer: transformer,
              }),
            ),
          )
          as _i7.Dio);
}

/// A class which mocks [IntegrationRegistry].
///
/// See the documentation for Mockito's code generation for more information.
class MockIntegrationRegistry extends _i1.Mock
    implements _i12.IntegrationRegistry {
  MockIntegrationRegistry() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i8.Ref<Object?> get ref =>
      (super.noSuchMethod(
            Invocation.getter(#ref),
            returnValue: _FakeRef_6<Object?>(this, Invocation.getter(#ref)),
          )
          as _i8.Ref<Object?>);

  @override
  String get baseUrl =>
      (super.noSuchMethod(
            Invocation.getter(#baseUrl),
            returnValue: _i13.dummyValue<String>(
              this,
              Invocation.getter(#baseUrl),
            ),
          )
          as String);

  @override
  bool exists(String? key) =>
      (super.noSuchMethod(Invocation.method(#exists, [key]), returnValue: false)
          as bool);

  @override
  void install(
    _i12.IntegrationType? type,
    _i12.DriverServiceBuilder? builder,
  ) => super.noSuchMethod(
    Invocation.method(#install, [type, builder]),
    returnValueForMissingStub: null,
  );

  @override
  void register(
    _i12.DriverService<
      dynamic,
      _i12.DriverDataEvent<dynamic>,
      _i12.Driver<dynamic>,
      _i12.DriverManager<_i12.Driver<dynamic>>
    >?
    service,
  ) => super.noSuchMethod(
    Invocation.method(#register, [service]),
    returnValueForMissingStub: null,
  );

  @override
  Map<String, _i12.Integration> getAll() =>
      (super.noSuchMethod(
            Invocation.method(#getAll, []),
            returnValue: <String, _i12.Integration>{},
          )
          as Map<String, _i12.Integration>);

  @override
  _i9.Optional<_i12.Integration> get(String? key) =>
      (super.noSuchMethod(
            Invocation.method(#get, [key]),
            returnValue: _FakeOptional_7<_i12.Integration>(
              this,
              Invocation.method(#get, [key]),
            ),
          )
          as _i9.Optional<_i12.Integration>);

  @override
  Map<String, _i12.Integration> where(
    dynamic Function(_i12.Integration)? test,
  ) =>
      (super.noSuchMethod(
            Invocation.method(#where, [test]),
            returnValue: <String, _i12.Integration>{},
          )
          as Map<String, _i12.Integration>);

  @override
  _i10.Future<Map<String, _i12.Integration>> discover() =>
      (super.noSuchMethod(
            Invocation.method(#discover, []),
            returnValue: _i10.Future<Map<String, _i12.Integration>>.value(
              <String, _i12.Integration>{},
            ),
          )
          as _i10.Future<Map<String, _i12.Integration>>);

  @override
  _i10.FutureOr<List<_i12.ServiceConfig>> getConfigs({
    _i12.IntegrationType? type,
  }) =>
      (super.noSuchMethod(
            Invocation.method(#getConfigs, [], {#type: type}),
            returnValue: _i10.Future<List<_i12.ServiceConfig>>.value(
              <_i12.ServiceConfig>[],
            ),
          )
          as _i10.FutureOr<List<_i12.ServiceConfig>>);

  @override
  _i10.Future<
    List<
      _i12.DriverService<
        dynamic,
        _i12.DriverDataEvent<dynamic>,
        _i12.Driver<dynamic>,
        _i12.DriverManager<_i12.Driver<dynamic>>
      >
    >
  >
  build(_i12.ServiceConfigGetter? where) =>
      (super.noSuchMethod(
            Invocation.method(#build, [where]),
            returnValue: _i10.Future<
              List<
                _i12.DriverService<
                  dynamic,
                  _i12.DriverDataEvent<dynamic>,
                  _i12.Driver<dynamic>,
                  _i12.DriverManager<_i12.Driver<dynamic>>
                >
              >
            >.value(
              <
                _i12.DriverService<
                  dynamic,
                  _i12.DriverDataEvent<dynamic>,
                  _i12.Driver<dynamic>,
                  _i12.DriverManager<_i12.Driver<dynamic>>
                >
              >[],
            ),
          )
          as _i10.Future<
            List<
              _i12.DriverService<
                dynamic,
                _i12.DriverDataEvent<dynamic>,
                _i12.Driver<dynamic>,
                _i12.DriverManager<_i12.Driver<dynamic>>
              >
            >
          >);
}
