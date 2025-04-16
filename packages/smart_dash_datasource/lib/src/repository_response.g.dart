// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SingleRepositoryResponse<I, T> _$SingleRepositoryResponseFromJson<I, T>(
  Map<String, dynamic> json,
  I Function(Object? json) fromJsonI,
  T Function(Object? json) fromJsonT,
) =>
    _SingleRepositoryResponse<I, T>(
      item: fromJsonT(json['item']),
      created: json['created'] as bool,
      updated: json['updated'] as bool,
      removed: json['removed'] as bool,
    );

Map<String, dynamic> _$SingleRepositoryResponseToJson<I, T>(
  _SingleRepositoryResponse<I, T> instance,
  Object? Function(I value) toJsonI,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'item': toJsonT(instance.item),
      'created': instance.created,
      'updated': instance.updated,
      'removed': instance.removed,
    };

_BulkRepositoryResponse<I, T> _$BulkRepositoryResponseFromJson<I, T>(
  Map<String, dynamic> json,
  I Function(Object? json) fromJsonI,
  T Function(Object? json) fromJsonT,
) =>
    _BulkRepositoryResponse<I, T>(
      created: (json['created'] as List<dynamic>).map(fromJsonT).toList(),
      updated: (json['updated'] as List<dynamic>).map(fromJsonT).toList(),
      removed: (json['removed'] as List<dynamic>).map(fromJsonT).toList(),
    );

Map<String, dynamic> _$BulkRepositoryResponseToJson<I, T>(
  _BulkRepositoryResponse<I, T> instance,
  Object? Function(I value) toJsonI,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'created': instance.created.map(toJsonT).toList(),
      'updated': instance.updated.map(toJsonT).toList(),
      'removed': instance.removed.map(toJsonT).toList(),
    };
