// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'repository_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SingleRepositoryResponse<I, T> _$SingleRepositoryResponseFromJson<I, T>(
    Map<String, dynamic> json,
    I Function(Object?) fromJsonI,
    T Function(Object?) fromJsonT) {
  return _SingleRepositoryResponse<I, T>.fromJson(json, fromJsonI, fromJsonT);
}

/// @nodoc
mixin _$SingleRepositoryResponse<I, T> {
  T get item => throw _privateConstructorUsedError;
  bool get created => throw _privateConstructorUsedError;
  bool get updated => throw _privateConstructorUsedError;
  bool get removed => throw _privateConstructorUsedError;

  /// Serializes this SingleRepositoryResponse to a JSON map.
  Map<String, dynamic> toJson(
          Object? Function(I) toJsonI, Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;

  /// Create a copy of SingleRepositoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SingleRepositoryResponseCopyWith<I, T, SingleRepositoryResponse<I, T>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SingleRepositoryResponseCopyWith<I, T, $Res> {
  factory $SingleRepositoryResponseCopyWith(
          SingleRepositoryResponse<I, T> value,
          $Res Function(SingleRepositoryResponse<I, T>) then) =
      _$SingleRepositoryResponseCopyWithImpl<I, T, $Res,
          SingleRepositoryResponse<I, T>>;
  @useResult
  $Res call({T item, bool created, bool updated, bool removed});
}

/// @nodoc
class _$SingleRepositoryResponseCopyWithImpl<I, T, $Res,
        $Val extends SingleRepositoryResponse<I, T>>
    implements $SingleRepositoryResponseCopyWith<I, T, $Res> {
  _$SingleRepositoryResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SingleRepositoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = freezed,
    Object? created = null,
    Object? updated = null,
    Object? removed = null,
  }) {
    return _then(_value.copyWith(
      item: freezed == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as T,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as bool,
      updated: null == updated
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as bool,
      removed: null == removed
          ? _value.removed
          : removed // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SingleRepositoryResponseImplCopyWith<I, T, $Res>
    implements $SingleRepositoryResponseCopyWith<I, T, $Res> {
  factory _$$SingleRepositoryResponseImplCopyWith(
          _$SingleRepositoryResponseImpl<I, T> value,
          $Res Function(_$SingleRepositoryResponseImpl<I, T>) then) =
      __$$SingleRepositoryResponseImplCopyWithImpl<I, T, $Res>;
  @override
  @useResult
  $Res call({T item, bool created, bool updated, bool removed});
}

/// @nodoc
class __$$SingleRepositoryResponseImplCopyWithImpl<I, T, $Res>
    extends _$SingleRepositoryResponseCopyWithImpl<I, T, $Res,
        _$SingleRepositoryResponseImpl<I, T>>
    implements _$$SingleRepositoryResponseImplCopyWith<I, T, $Res> {
  __$$SingleRepositoryResponseImplCopyWithImpl(
      _$SingleRepositoryResponseImpl<I, T> _value,
      $Res Function(_$SingleRepositoryResponseImpl<I, T>) _then)
      : super(_value, _then);

  /// Create a copy of SingleRepositoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = freezed,
    Object? created = null,
    Object? updated = null,
    Object? removed = null,
  }) {
    return _then(_$SingleRepositoryResponseImpl<I, T>(
      item: freezed == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as T,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as bool,
      updated: null == updated
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as bool,
      removed: null == removed
          ? _value.removed
          : removed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$SingleRepositoryResponseImpl<I, T>
    extends _SingleRepositoryResponse<I, T> {
  const _$SingleRepositoryResponseImpl(
      {required this.item,
      required this.created,
      required this.updated,
      required this.removed})
      : super._();

  factory _$SingleRepositoryResponseImpl.fromJson(Map<String, dynamic> json,
          I Function(Object?) fromJsonI, T Function(Object?) fromJsonT) =>
      _$$SingleRepositoryResponseImplFromJson(json, fromJsonI, fromJsonT);

  @override
  final T item;
  @override
  final bool created;
  @override
  final bool updated;
  @override
  final bool removed;

  @override
  String toString() {
    return 'SingleRepositoryResponse<$I, $T>(item: $item, created: $created, updated: $updated, removed: $removed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SingleRepositoryResponseImpl<I, T> &&
            const DeepCollectionEquality().equals(other.item, item) &&
            (identical(other.created, created) || other.created == created) &&
            (identical(other.updated, updated) || other.updated == updated) &&
            (identical(other.removed, removed) || other.removed == removed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(item), created, updated, removed);

  /// Create a copy of SingleRepositoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SingleRepositoryResponseImplCopyWith<I, T,
          _$SingleRepositoryResponseImpl<I, T>>
      get copyWith => __$$SingleRepositoryResponseImplCopyWithImpl<I, T,
          _$SingleRepositoryResponseImpl<I, T>>(this, _$identity);

  @override
  Map<String, dynamic> toJson(
      Object? Function(I) toJsonI, Object? Function(T) toJsonT) {
    return _$$SingleRepositoryResponseImplToJson<I, T>(this, toJsonI, toJsonT);
  }
}

abstract class _SingleRepositoryResponse<I, T>
    extends SingleRepositoryResponse<I, T> {
  const factory _SingleRepositoryResponse(
      {required final T item,
      required final bool created,
      required final bool updated,
      required final bool removed}) = _$SingleRepositoryResponseImpl<I, T>;
  const _SingleRepositoryResponse._() : super._();

  factory _SingleRepositoryResponse.fromJson(Map<String, dynamic> json,
          I Function(Object?) fromJsonI, T Function(Object?) fromJsonT) =
      _$SingleRepositoryResponseImpl<I, T>.fromJson;

  @override
  T get item;
  @override
  bool get created;
  @override
  bool get updated;
  @override
  bool get removed;

  /// Create a copy of SingleRepositoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SingleRepositoryResponseImplCopyWith<I, T,
          _$SingleRepositoryResponseImpl<I, T>>
      get copyWith => throw _privateConstructorUsedError;
}

BulkRepositoryResponse<I, T> _$BulkRepositoryResponseFromJson<I, T>(
    Map<String, dynamic> json,
    I Function(Object?) fromJsonI,
    T Function(Object?) fromJsonT) {
  return _BulkRepositoryResponse<I, T>.fromJson(json, fromJsonI, fromJsonT);
}

/// @nodoc
mixin _$BulkRepositoryResponse<I, T> {
  List<T> get created => throw _privateConstructorUsedError;
  List<T> get updated => throw _privateConstructorUsedError;
  List<T> get removed => throw _privateConstructorUsedError;

  /// Serializes this BulkRepositoryResponse to a JSON map.
  Map<String, dynamic> toJson(
          Object? Function(I) toJsonI, Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;

  /// Create a copy of BulkRepositoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BulkRepositoryResponseCopyWith<I, T, BulkRepositoryResponse<I, T>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BulkRepositoryResponseCopyWith<I, T, $Res> {
  factory $BulkRepositoryResponseCopyWith(BulkRepositoryResponse<I, T> value,
          $Res Function(BulkRepositoryResponse<I, T>) then) =
      _$BulkRepositoryResponseCopyWithImpl<I, T, $Res,
          BulkRepositoryResponse<I, T>>;
  @useResult
  $Res call({List<T> created, List<T> updated, List<T> removed});
}

/// @nodoc
class _$BulkRepositoryResponseCopyWithImpl<I, T, $Res,
        $Val extends BulkRepositoryResponse<I, T>>
    implements $BulkRepositoryResponseCopyWith<I, T, $Res> {
  _$BulkRepositoryResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BulkRepositoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? created = null,
    Object? updated = null,
    Object? removed = null,
  }) {
    return _then(_value.copyWith(
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as List<T>,
      updated: null == updated
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as List<T>,
      removed: null == removed
          ? _value.removed
          : removed // ignore: cast_nullable_to_non_nullable
              as List<T>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BulkRepositoryResponseImplCopyWith<I, T, $Res>
    implements $BulkRepositoryResponseCopyWith<I, T, $Res> {
  factory _$$BulkRepositoryResponseImplCopyWith(
          _$BulkRepositoryResponseImpl<I, T> value,
          $Res Function(_$BulkRepositoryResponseImpl<I, T>) then) =
      __$$BulkRepositoryResponseImplCopyWithImpl<I, T, $Res>;
  @override
  @useResult
  $Res call({List<T> created, List<T> updated, List<T> removed});
}

/// @nodoc
class __$$BulkRepositoryResponseImplCopyWithImpl<I, T, $Res>
    extends _$BulkRepositoryResponseCopyWithImpl<I, T, $Res,
        _$BulkRepositoryResponseImpl<I, T>>
    implements _$$BulkRepositoryResponseImplCopyWith<I, T, $Res> {
  __$$BulkRepositoryResponseImplCopyWithImpl(
      _$BulkRepositoryResponseImpl<I, T> _value,
      $Res Function(_$BulkRepositoryResponseImpl<I, T>) _then)
      : super(_value, _then);

  /// Create a copy of BulkRepositoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? created = null,
    Object? updated = null,
    Object? removed = null,
  }) {
    return _then(_$BulkRepositoryResponseImpl<I, T>(
      created: null == created
          ? _value._created
          : created // ignore: cast_nullable_to_non_nullable
              as List<T>,
      updated: null == updated
          ? _value._updated
          : updated // ignore: cast_nullable_to_non_nullable
              as List<T>,
      removed: null == removed
          ? _value._removed
          : removed // ignore: cast_nullable_to_non_nullable
              as List<T>,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$BulkRepositoryResponseImpl<I, T> extends _BulkRepositoryResponse<I, T> {
  const _$BulkRepositoryResponseImpl(
      {required final List<T> created,
      required final List<T> updated,
      required final List<T> removed})
      : _created = created,
        _updated = updated,
        _removed = removed,
        super._();

  factory _$BulkRepositoryResponseImpl.fromJson(Map<String, dynamic> json,
          I Function(Object?) fromJsonI, T Function(Object?) fromJsonT) =>
      _$$BulkRepositoryResponseImplFromJson(json, fromJsonI, fromJsonT);

  final List<T> _created;
  @override
  List<T> get created {
    if (_created is EqualUnmodifiableListView) return _created;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_created);
  }

  final List<T> _updated;
  @override
  List<T> get updated {
    if (_updated is EqualUnmodifiableListView) return _updated;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_updated);
  }

  final List<T> _removed;
  @override
  List<T> get removed {
    if (_removed is EqualUnmodifiableListView) return _removed;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_removed);
  }

  @override
  String toString() {
    return 'BulkRepositoryResponse<$I, $T>(created: $created, updated: $updated, removed: $removed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BulkRepositoryResponseImpl<I, T> &&
            const DeepCollectionEquality().equals(other._created, _created) &&
            const DeepCollectionEquality().equals(other._updated, _updated) &&
            const DeepCollectionEquality().equals(other._removed, _removed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_created),
      const DeepCollectionEquality().hash(_updated),
      const DeepCollectionEquality().hash(_removed));

  /// Create a copy of BulkRepositoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BulkRepositoryResponseImplCopyWith<I, T,
          _$BulkRepositoryResponseImpl<I, T>>
      get copyWith => __$$BulkRepositoryResponseImplCopyWithImpl<I, T,
          _$BulkRepositoryResponseImpl<I, T>>(this, _$identity);

  @override
  Map<String, dynamic> toJson(
      Object? Function(I) toJsonI, Object? Function(T) toJsonT) {
    return _$$BulkRepositoryResponseImplToJson<I, T>(this, toJsonI, toJsonT);
  }
}

abstract class _BulkRepositoryResponse<I, T>
    extends BulkRepositoryResponse<I, T> {
  const factory _BulkRepositoryResponse(
      {required final List<T> created,
      required final List<T> updated,
      required final List<T> removed}) = _$BulkRepositoryResponseImpl<I, T>;
  const _BulkRepositoryResponse._() : super._();

  factory _BulkRepositoryResponse.fromJson(Map<String, dynamic> json,
          I Function(Object?) fromJsonI, T Function(Object?) fromJsonT) =
      _$BulkRepositoryResponseImpl<I, T>.fromJson;

  @override
  List<T> get created;
  @override
  List<T> get updated;
  @override
  List<T> get removed;

  /// Create a copy of BulkRepositoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BulkRepositoryResponseImplCopyWith<I, T,
          _$BulkRepositoryResponseImpl<I, T>>
      get copyWith => throw _privateConstructorUsedError;
}
