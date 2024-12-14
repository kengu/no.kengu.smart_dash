// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SingleRepositoryResponseImpl<I, T>
    _$$SingleRepositoryResponseImplFromJson<I, T>(
  Map<String, dynamic> json,
  I Function(Object? json) fromJsonI,
  T Function(Object? json) fromJsonT,
) =>
        _$SingleRepositoryResponseImpl<I, T>(
          item: fromJsonT(json['item']),
          created: json['created'] as bool,
          updated: json['updated'] as bool,
          removed: json['removed'] as bool,
        );

Map<String, dynamic> _$$SingleRepositoryResponseImplToJson<I, T>(
  _$SingleRepositoryResponseImpl<I, T> instance,
  Object? Function(I value) toJsonI,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'item': toJsonT(instance.item),
      'created': instance.created,
      'updated': instance.updated,
      'removed': instance.removed,
    };

_$BulkRepositoryResponseImpl<I, T> _$$BulkRepositoryResponseImplFromJson<I, T>(
  Map<String, dynamic> json,
  I Function(Object? json) fromJsonI,
  T Function(Object? json) fromJsonT,
) =>
    _$BulkRepositoryResponseImpl<I, T>(
      created: (json['created'] as List<dynamic>).map(fromJsonT).toList(),
      updated: (json['updated'] as List<dynamic>).map(fromJsonT).toList(),
      removed: (json['removed'] as List<dynamic>).map(fromJsonT).toList(),
    );

Map<String, dynamic> _$$BulkRepositoryResponseImplToJson<I, T>(
  _$BulkRepositoryResponseImpl<I, T> instance,
  Object? Function(I value) toJsonI,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'created': instance.created.map(toJsonT).toList(),
      'updated': instance.updated.map(toJsonT).toList(),
      'removed': instance.removed.map(toJsonT).toList(),
    };
