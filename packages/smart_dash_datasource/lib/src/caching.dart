import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:shelf/shelf.dart';

/*
class FutureCacheInterceptor<T> extends dio.InterceptorsWrapper {
  FutureCacheInterceptor(this.cacheOptions, this.cache);

  final FutureCache cache;
  final CacheOptions cacheOptions;

  @override
  void onRequest(
    dio.RequestOptions options,
    dio.RequestInterceptorHandler handler,
  ) async {
    if (options.method.toUpperCase() == 'GET') {
      final key = CacheOptions.defaultCacheKeyBuilder(options);
      final data = cache.get(key);
      if (data.isPresent) {
        final response = dio.Response(requestOptions: options, data: data);
        handler.resolve(cache.toResponse(options, fromNetwork: false));
      }
    }
    handler.next(options);
  }
}
*/

mixin CachingHandler<T> {
  /// Must be implemented
  String getContentType(Request request);

  /// Fetch resource data for generating ETag and response body
  Future<T> fetchData(Request request);

  /// Compute the `Last-Modified` timestamp for the resource using fetched data
  DateTime computeLastModified(T resource);

  /// Default max-age null. Override as needed.
  int? getMaxAge(Request request) {
    return null;
  }

  /// Default must-revalidate is false. Override as needed.
  bool getMustRevalidate(Request request) {
    return false;
  }

  /// Default vary header is null. Override as needed.
  String? getVaryHeader(Request request) {
    return null;
  }

  // Generate a Strong ETag for the resource
  String generateStrongETag(T resource) {
    final resourceString = jsonEncode(resource);
    final bytes = utf8.encode(resourceString);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  // Generate a Weak ETag for the resource
  String generateWeakETag(T resource) {
    // The weak ETag is generated using the strong ETag as a base.
    // This design assumes that there isn't a default way to canonicalize
    // or transform the parameterized type into a form suitable for a weak
    // ETag. By reusing the strong ETag, prefixed with 'W/',  users of the
    // mixin can override the default generation if a more specific weak
    // ETag generation is required for their resource types. This simplifies
    // the default implementation while maintaining extensibility.
    return 'W/${generateStrongETag(resource)}';
  }

  List<String> _generateCacheControlDirectives(Request request) {
    final directives = <String>[];
    final maxAge = getMaxAge(request);
    final mustRevalidate = getMustRevalidate(request);

    final cacheControl = request.headers['Cache-Control'];

    if (maxAge != null) directives.add('max-age=$maxAge');
    if (mustRevalidate) directives.add('must-revalidate');
    if (cacheControl?.contains('no-cache') == true) directives.add('no-cache');
    if (cacheControl?.contains('no-store') == true) directives.add('no-store');

    return directives;
  }

  String _generateCacheControlHeader(Request request) {
    return _generateCacheControlDirectives(request).join(', ');
  }

  // Handle the request with caching logic
  Future<Response> call(Request request) {
    return _handle(request);
  }

  Future<Response> _handle(Request request) async {
    try {
      // The `call` method handles multiple caching scenarios:
      // 1. Fetches data and computes ETags and Last-Modified timestamps.
      // 2. Processes Cache-Control directives `no-store`, `no-cache` etc.
      // 3. Supports validation with `If-None-Match` and `If-Modified-Since`.
      // 4. Manages conditional requests and serves appropriate HTTP responses.

      // Fetch resource data
      final freshData = await fetchData(request);

      // Compute last modified using the fetched data
      final lastModified = computeLastModified(freshData);

      // Generate response ETag
      final strongETag = generateStrongETag(freshData);

      // Parse request headers
      final cacheControl = request.headers['Cache-Control'];

      // Handle Cache-Control: no-cache
      if (cacheControl?.contains('no-cache') == true) {
        return Response.ok(
          jsonEncode(freshData),
          headers: {
            'Content-Type': getContentType(request),
            'Cache-Control': 'no-cache',
            'ETag': strongETag,
            'Last-Modified': lastModified.toUtc().toIso8601String(),
          },
        );
      }

      // Handle ETag validation
      final ifNoneMatch = request.headers['If-None-Match'];
      if (ifNoneMatch != null) {
        if (ifNoneMatch == strongETag ||
            ifNoneMatch == generateWeakETag(freshData)) {
          return Response.notModified(headers: {
            'Cache-Control': _generateCacheControlHeader(request),
            'ETag': strongETag,
            'Last-Modified': lastModified.toUtc().toIso8601String(),
          });
        }
      }

      // Handle Last-Modified validation
      final ifModifiedSince = request.headers['If-Modified-Since'];
      if (ifModifiedSince != null) {
        final modifiedSinceTime = DateTime.tryParse(ifModifiedSince);
        if (modifiedSinceTime != null &&
            !lastModified.isAfter(modifiedSinceTime)) {
          return Response.notModified(headers: {
            'Cache-Control': _generateCacheControlHeader(request),
            'ETag': strongETag,
            'Last-Modified': lastModified.toUtc().toIso8601String(),
          });
        }
      }

      // Add Vary header for cache-aware intermediaries
      final vary = getVaryHeader(request);
      return Response.ok(
        jsonEncode(freshData),
        headers: {
          'Content-Type': getContentType(request),
          'Cache-Control': _generateCacheControlHeader(request),
          'ETag': strongETag,
          'Last-Modified': lastModified.toUtc().toIso8601String(),
          if (vary != null) 'Vary': vary,
        },
      );
    } catch (e) {
      return Response.internalServerError(
        body: 'Error: ${e.toString()}',
      );
    }
  }
}

class CachedResource<T> {
  final T data;
  final String etag;
  final DateTime expiryTime;
  final DateTime lastModified;

  CachedResource({
    required this.data,
    required this.etag,
    required this.expiryTime,
    required this.lastModified,
  });
}

mixin StaleAwareCachingHandlerMixin<T> implements CachingHandler<T> {
  // Must be implemented
  Future<CachedResource<T>?> fetchCached(String cacheKey);

  // Must be implemented
  Future<void> storeCached(String cacheKey, CachedResource<T> resource);

  // Can be overridden for custom key generation
  String generateCacheKey(Request request) {
    return request.url.toString();
  }

  /// Default is null. Override as needed.
  int? getStaleIfError(Request request) {
    return null;
  }

  /// Default is null. Override as needed.
  int? getStaleWhileRevalidate(Request request) {
    return null;
  }

  @override
  String _generateCacheControlHeader(Request request) {
    final directives = _generateCacheControlDirectives(request);

    final staleIfError = getStaleIfError(request);
    final staleWhileRevalidate = getStaleWhileRevalidate(request);
    if (staleIfError != null) {
      directives.add('stale-if-error=$staleIfError');
    }
    if (staleWhileRevalidate != null) {
      directives.add('stale-while-revalidate=$staleWhileRevalidate');
    }

    return directives.join(', ');
  }

  // Handle the request with caching logic for stale states
  @override
  Future<Response> call(Request request) {
    final cacheControl = request.headers['Cache-Control'];
    // We honor the client request to use fresh response from upstream server
    if (cacheControl?.contains('no-cache') != true) {
      return _handleStale(request);
    }
    return _handle(request);
  }

  Future<Response> _handleStale(Request request) async {
    final cacheKey = generateCacheKey(request);
    final cached = await fetchCached(cacheKey);
    final cacheControl = request.headers['Cache-Control'];
    if (cached != null) {
      final now = DateTime.now();
      int? ttl = getStaleWhileRevalidate(request);
      if (ttl != null) {
        if (now.isBefore(cached.expiryTime.add(Duration(seconds: ttl)))) {
          // We honor the client request to
          // not store fresh response from upstream server
          if (cacheControl?.contains('no-store') != true) {
            _triggerRevalidation(request, cacheKey, ttl);
          }

          // Return cached data as fresh
          return Response.ok(
            jsonEncode(cached.data),
            headers: {
              'Content-Type': getContentType(request),
              'Cache-Control': _generateCacheControlHeader(request),
              'ETag': cached.etag,
              'Last-Modified': cached.lastModified.toUtc().toIso8601String(),
            },
          );
        }
      }
      ttl = getStaleIfError(request);
      if (ttl != null) {
        // We assume this never throws
        final response = await _handle(request);
        // Did upstream server generate an error?
        if (const [500, 502, 503, 504].contains(response.statusCode)) {
          if (now.isBefore(cached.expiryTime.add(Duration(seconds: ttl)))) {
            // Return cached data as fresh
            return Response.ok(
              jsonEncode(cached.data),
              headers: {
                'Content-Type': getContentType(request),
                'Cache-Control': _generateCacheControlHeader(request),
                'ETag': cached.etag,
                'Last-Modified': cached.lastModified.toUtc().toIso8601String(),
              },
            );
          }
        }
        return response;
      }
    }

    // Not stale
    return _handle(request);
  }

  void _triggerRevalidation(Request request, String cacheKey, int ttl) async {
    try {
      final data = await fetchData(request);
      final etag = generateStrongETag(data);
      final lastModified = computeLastModified(data);

      final resource = CachedResource<T>(
        data: data,
        etag: etag,
        lastModified: lastModified,
        expiryTime: DateTime.now().add(Duration(seconds: ttl)),
      );
      await storeCached(cacheKey, resource);
    } catch (e) {
      print('Revalidation failed: ${e.toString()}');
    }
  }
}
