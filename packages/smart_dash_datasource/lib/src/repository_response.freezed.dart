// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'repository_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SingleRepositoryResponse<I, T> {
  T get item;
  bool get created;
  bool get updated;
  bool get removed;

  /// Create a copy of SingleRepositoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SingleRepositoryResponseCopyWith<I, T, SingleRepositoryResponse<I, T>>
      get copyWith => _$SingleRepositoryResponseCopyWithImpl<I, T,
              SingleRepositoryResponse<I, T>>(
          this as SingleRepositoryResponse<I, T>, _$identity);

  /// Serializes this SingleRepositoryResponse to a JSON map.
  Map<String, dynamic> toJson(
      Object? Function(I) toJsonI, Object? Function(T) toJsonT);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SingleRepositoryResponse<I, T> &&
            const DeepCollectionEquality().equals(other.item, item) &&
            (identical(other.created, created) || other.created == created) &&
            (identical(other.updated, updated) || other.updated == updated) &&
            (identical(other.removed, removed) || other.removed == removed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(item), created, updated, removed);

  @override
  String toString() {
    return 'SingleRepositoryResponse<$I, $T>(item: $item, created: $created, updated: $updated, removed: $removed)';
  }
}

/// @nodoc
abstract mixin class $SingleRepositoryResponseCopyWith<I, T, $Res> {
  factory $SingleRepositoryResponseCopyWith(
          SingleRepositoryResponse<I, T> value,
          $Res Function(SingleRepositoryResponse<I, T>) _then) =
      _$SingleRepositoryResponseCopyWithImpl;
  @useResult
  $Res call({T item, bool created, bool updated, bool removed});
}

/// @nodoc
class _$SingleRepositoryResponseCopyWithImpl<I, T, $Res>
    implements $SingleRepositoryResponseCopyWith<I, T, $Res> {
  _$SingleRepositoryResponseCopyWithImpl(this._self, this._then);

  final SingleRepositoryResponse<I, T> _self;
  final $Res Function(SingleRepositoryResponse<I, T>) _then;

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
    return _then(_self.copyWith(
      item: freezed == item
          ? _self.item
          : item // ignore: cast_nullable_to_non_nullable
              as T,
      created: null == created
          ? _self.created
          : created // ignore: cast_nullable_to_non_nullable
              as bool,
      updated: null == updated
          ? _self.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as bool,
      removed: null == removed
          ? _self.removed
          : removed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _SingleRepositoryResponse<I, T> extends SingleRepositoryResponse<I, T> {
  const _SingleRepositoryResponse(
      {required this.item,
      required this.created,
      required this.updated,
      required this.removed})
      : super._();
  factory _SingleRepositoryResponse.fromJson(Map<String, dynamic> json,
          I Function(Object?) fromJsonI, T Function(Object?) fromJsonT) =>
      _$SingleRepositoryResponseFromJson(json, fromJsonI, fromJsonT);

  @override
  final T item;
  @override
  final bool created;
  @override
  final bool updated;
  @override
  final bool removed;

  /// Create a copy of SingleRepositoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SingleRepositoryResponseCopyWith<I, T, _SingleRepositoryResponse<I, T>>
      get copyWith => __$SingleRepositoryResponseCopyWithImpl<I, T,
          _SingleRepositoryResponse<I, T>>(this, _$identity);

  @override
  Map<String, dynamic> toJson(
      Object? Function(I) toJsonI, Object? Function(T) toJsonT) {
    return _$SingleRepositoryResponseToJson<I, T>(this, toJsonI, toJsonT);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SingleRepositoryResponse<I, T> &&
            const DeepCollectionEquality().equals(other.item, item) &&
            (identical(other.created, created) || other.created == created) &&
            (identical(other.updated, updated) || other.updated == updated) &&
            (identical(other.removed, removed) || other.removed == removed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(item), created, updated, removed);

  @override
  String toString() {
    return 'SingleRepositoryResponse<$I, $T>(item: $item, created: $created, updated: $updated, removed: $removed)';
  }
}

/// @nodoc
abstract mixin class _$SingleRepositoryResponseCopyWith<I, T, $Res>
    implements $SingleRepositoryResponseCopyWith<I, T, $Res> {
  factory _$SingleRepositoryResponseCopyWith(
          _SingleRepositoryResponse<I, T> value,
          $Res Function(_SingleRepositoryResponse<I, T>) _then) =
      __$SingleRepositoryResponseCopyWithImpl;
  @override
  @useResult
  $Res call({T item, bool created, bool updated, bool removed});
}

/// @nodoc
class __$SingleRepositoryResponseCopyWithImpl<I, T, $Res>
    implements _$SingleRepositoryResponseCopyWith<I, T, $Res> {
  __$SingleRepositoryResponseCopyWithImpl(this._self, this._then);

  final _SingleRepositoryResponse<I, T> _self;
  final $Res Function(_SingleRepositoryResponse<I, T>) _then;

  /// Create a copy of SingleRepositoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? item = freezed,
    Object? created = null,
    Object? updated = null,
    Object? removed = null,
  }) {
    return _then(_SingleRepositoryResponse<I, T>(
      item: freezed == item
          ? _self.item
          : item // ignore: cast_nullable_to_non_nullable
              as T,
      created: null == created
          ? _self.created
          : created // ignore: cast_nullable_to_non_nullable
              as bool,
      updated: null == updated
          ? _self.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as bool,
      removed: null == removed
          ? _self.removed
          : removed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
mixin _$BulkRepositoryResponse<I, T> {
  List<T> get created;
  List<T> get updated;
  List<T> get removed;

  /// Create a copy of BulkRepositoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BulkRepositoryResponseCopyWith<I, T, BulkRepositoryResponse<I, T>>
      get copyWith => _$BulkRepositoryResponseCopyWithImpl<I, T,
              BulkRepositoryResponse<I, T>>(
          this as BulkRepositoryResponse<I, T>, _$identity);

  /// Serializes this BulkRepositoryResponse to a JSON map.
  Map<String, dynamic> toJson(
      Object? Function(I) toJsonI, Object? Function(T) toJsonT);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BulkRepositoryResponse<I, T> &&
            const DeepCollectionEquality().equals(other.created, created) &&
            const DeepCollectionEquality().equals(other.updated, updated) &&
            const DeepCollectionEquality().equals(other.removed, removed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(created),
      const DeepCollectionEquality().hash(updated),
      const DeepCollectionEquality().hash(removed));

  @override
  String toString() {
    return 'BulkRepositoryResponse<$I, $T>(created: $created, updated: $updated, removed: $removed)';
  }
}

/// @nodoc
abstract mixin class $BulkRepositoryResponseCopyWith<I, T, $Res> {
  factory $BulkRepositoryResponseCopyWith(BulkRepositoryResponse<I, T> value,
          $Res Function(BulkRepositoryResponse<I, T>) _then) =
      _$BulkRepositoryResponseCopyWithImpl;
  @useResult
  $Res call({List<T> created, List<T> updated, List<T> removed});
}

/// @nodoc
class _$BulkRepositoryResponseCopyWithImpl<I, T, $Res>
    implements $BulkRepositoryResponseCopyWith<I, T, $Res> {
  _$BulkRepositoryResponseCopyWithImpl(this._self, this._then);

  final BulkRepositoryResponse<I, T> _self;
  final $Res Function(BulkRepositoryResponse<I, T>) _then;

  /// Create a copy of BulkRepositoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? created = null,
    Object? updated = null,
    Object? removed = null,
  }) {
    return _then(_self.copyWith(
      created: null == created
          ? _self.created
          : created // ignore: cast_nullable_to_non_nullable
              as List<T>,
      updated: null == updated
          ? _self.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as List<T>,
      removed: null == removed
          ? _self.removed
          : removed // ignore: cast_nullable_to_non_nullable
              as List<T>,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _BulkRepositoryResponse<I, T> extends BulkRepositoryResponse<I, T> {
  const _BulkRepositoryResponse(
      {required final List<T> created,
      required final List<T> updated,
      required final List<T> removed})
      : _created = created,
        _updated = updated,
        _removed = removed,
        super._();
  factory _BulkRepositoryResponse.fromJson(Map<String, dynamic> json,
          I Function(Object?) fromJsonI, T Function(Object?) fromJsonT) =>
      _$BulkRepositoryResponseFromJson(json, fromJsonI, fromJsonT);

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

  /// Create a copy of BulkRepositoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BulkRepositoryResponseCopyWith<I, T, _BulkRepositoryResponse<I, T>>
      get copyWith => __$BulkRepositoryResponseCopyWithImpl<I, T,
          _BulkRepositoryResponse<I, T>>(this, _$identity);

  @override
  Map<String, dynamic> toJson(
      Object? Function(I) toJsonI, Object? Function(T) toJsonT) {
    return _$BulkRepositoryResponseToJson<I, T>(this, toJsonI, toJsonT);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BulkRepositoryResponse<I, T> &&
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

  @override
  String toString() {
    return 'BulkRepositoryResponse<$I, $T>(created: $created, updated: $updated, removed: $removed)';
  }
}

/// @nodoc
abstract mixin class _$BulkRepositoryResponseCopyWith<I, T, $Res>
    implements $BulkRepositoryResponseCopyWith<I, T, $Res> {
  factory _$BulkRepositoryResponseCopyWith(_BulkRepositoryResponse<I, T> value,
          $Res Function(_BulkRepositoryResponse<I, T>) _then) =
      __$BulkRepositoryResponseCopyWithImpl;
  @override
  @useResult
  $Res call({List<T> created, List<T> updated, List<T> removed});
}

/// @nodoc
class __$BulkRepositoryResponseCopyWithImpl<I, T, $Res>
    implements _$BulkRepositoryResponseCopyWith<I, T, $Res> {
  __$BulkRepositoryResponseCopyWithImpl(this._self, this._then);

  final _BulkRepositoryResponse<I, T> _self;
  final $Res Function(_BulkRepositoryResponse<I, T>) _then;

  /// Create a copy of BulkRepositoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? created = null,
    Object? updated = null,
    Object? removed = null,
  }) {
    return _then(_BulkRepositoryResponse<I, T>(
      created: null == created
          ? _self._created
          : created // ignore: cast_nullable_to_non_nullable
              as List<T>,
      updated: null == updated
          ? _self._updated
          : updated // ignore: cast_nullable_to_non_nullable
              as List<T>,
      removed: null == removed
          ? _self._removed
          : removed // ignore: cast_nullable_to_non_nullable
              as List<T>,
    ));
  }
}

// dart format on
