import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_dash_datasource/smart_dash_datasource.dart';

part 'repository_response.freezed.dart';
part 'repository_response.g.dart';

sealed class RepositoryResponse<I, T> {
  bool get isEmpty;
  bool get isNotEmpty;
}

@Freezed(genericArgumentFactories: true)
sealed class SingleRepositoryResponse<I, T>
    with _$SingleRepositoryResponse<I, T>
    implements RepositoryResponse<I, T> {
  const SingleRepositoryResponse._();

  const factory SingleRepositoryResponse({
    required T item,
    required bool created,
    required bool updated,
    required bool removed,
  }) = _SingleRepositoryResponse;

  @override
  bool get isEmpty => !isNotEmpty;

  @override
  bool get isNotEmpty => created || updated || removed;

  SingleRepositoryResult<I, T> toResult() {
    return SingleRepositoryResult<I, T>(item, created, updated, removed);
  }

  factory SingleRepositoryResponse.fromResult(
          SingleRepositoryResult<I, T> result) =>
      SingleRepositoryResponse<I, T>(
        item: result.item,
        created: result.created,
        updated: result.updated,
        removed: result.removed,
      );

  factory SingleRepositoryResponse.fromJson(
    Map<String, Object?> json,
    I Function(Object? json) fromJsonI,
    T Function(Object? json) fromJsonT,
  ) =>
      _$SingleRepositoryResponseFromJson<I, T>(json, fromJsonI, fromJsonT);
}

@Freezed(genericArgumentFactories: true)
sealed class BulkRepositoryResponse<I, T>
    with _$BulkRepositoryResponse<I, T>
    implements RepositoryResponse<I, T> {
  const BulkRepositoryResponse._();

  const factory BulkRepositoryResponse({
    required List<T> created,
    required List<T> updated,
    required List<T> removed,
  }) = _BulkRepositoryResponse;

  @override
  bool get isEmpty => !isNotEmpty;

  @override
  bool get isNotEmpty =>
      created.isNotEmpty || updated.isNotEmpty || removed.isNotEmpty;

  BulkRepositoryResult<I, T> toResult() {
    return BulkRepositoryResult<I, T>(created, updated, removed);
  }

  factory BulkRepositoryResponse.fromResult(
          BulkRepositoryResult<I, T> result) =>
      BulkRepositoryResponse<I, T>(
        created: result.created,
        updated: result.updated,
        removed: result.removed,
      );

  factory BulkRepositoryResponse.fromJson(
    Map<String, Object?> json,
    I Function(Object? json) fromJsonI,
    T Function(Object? json) fromJsonT,
  ) =>
      _$BulkRepositoryResponseFromJson<I, T>(json, fromJsonI, fromJsonT);
}
