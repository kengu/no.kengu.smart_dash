// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data_array.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DataArray {
  /// Get the array's data (organized in
  /// columns). Each column is also known as
  /// a dimension.
  List<List<num>> get data;

  /// Get the array's coordinates
  /// (tick labels) to use for indexing
  /// along each dimension
  List<JsonObject> get coords;

  /// Get the array's name(s) of the data dimension(s)
  List<JsonObject> get dims;

  /// Create a copy of DataArray
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DataArrayCopyWith<DataArray> get copyWith =>
      _$DataArrayCopyWithImpl<DataArray>(this as DataArray, _$identity);

  /// Serializes this DataArray to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DataArray &&
            const DeepCollectionEquality().equals(other.data, data) &&
            const DeepCollectionEquality().equals(other.coords, coords) &&
            const DeepCollectionEquality().equals(other.dims, dims));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(data),
      const DeepCollectionEquality().hash(coords),
      const DeepCollectionEquality().hash(dims));

  @override
  String toString() {
    return 'DataArray(data: $data, coords: $coords, dims: $dims)';
  }
}

/// @nodoc
abstract mixin class $DataArrayCopyWith<$Res> {
  factory $DataArrayCopyWith(DataArray value, $Res Function(DataArray) _then) =
      _$DataArrayCopyWithImpl;
  @useResult
  $Res call(
      {List<List<num>> data, List<JsonObject> coords, List<JsonObject> dims});
}

/// @nodoc
class _$DataArrayCopyWithImpl<$Res> implements $DataArrayCopyWith<$Res> {
  _$DataArrayCopyWithImpl(this._self, this._then);

  final DataArray _self;
  final $Res Function(DataArray) _then;

  /// Create a copy of DataArray
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? coords = null,
    Object? dims = null,
  }) {
    return _then(_self.copyWith(
      data: null == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<List<num>>,
      coords: null == coords
          ? _self.coords
          : coords // ignore: cast_nullable_to_non_nullable
              as List<JsonObject>,
      dims: null == dims
          ? _self.dims
          : dims // ignore: cast_nullable_to_non_nullable
              as List<JsonObject>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _DataArray extends DataArray {
  const _DataArray(final List<List<num>> data,
      {required final List<JsonObject> coords,
      required final List<JsonObject> dims})
      : _data = data,
        _coords = coords,
        _dims = dims,
        super._();
  factory _DataArray.fromJson(Map<String, dynamic> json) =>
      _$DataArrayFromJson(json);

  /// Get the array's data (organized in
  /// columns). Each column is also known as
  /// a dimension.
  final List<List<num>> _data;

  /// Get the array's data (organized in
  /// columns). Each column is also known as
  /// a dimension.
  @override
  List<List<num>> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  /// Get the array's coordinates
  /// (tick labels) to use for indexing
  /// along each dimension
  final List<JsonObject> _coords;

  /// Get the array's coordinates
  /// (tick labels) to use for indexing
  /// along each dimension
  @override
  List<JsonObject> get coords {
    if (_coords is EqualUnmodifiableListView) return _coords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_coords);
  }

  /// Get the array's name(s) of the data dimension(s)
  final List<JsonObject> _dims;

  /// Get the array's name(s) of the data dimension(s)
  @override
  List<JsonObject> get dims {
    if (_dims is EqualUnmodifiableListView) return _dims;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dims);
  }

  /// Create a copy of DataArray
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DataArrayCopyWith<_DataArray> get copyWith =>
      __$DataArrayCopyWithImpl<_DataArray>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DataArrayToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DataArray &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            const DeepCollectionEquality().equals(other._coords, _coords) &&
            const DeepCollectionEquality().equals(other._dims, _dims));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_data),
      const DeepCollectionEquality().hash(_coords),
      const DeepCollectionEquality().hash(_dims));

  @override
  String toString() {
    return 'DataArray(data: $data, coords: $coords, dims: $dims)';
  }
}

/// @nodoc
abstract mixin class _$DataArrayCopyWith<$Res>
    implements $DataArrayCopyWith<$Res> {
  factory _$DataArrayCopyWith(
          _DataArray value, $Res Function(_DataArray) _then) =
      __$DataArrayCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<List<num>> data, List<JsonObject> coords, List<JsonObject> dims});
}

/// @nodoc
class __$DataArrayCopyWithImpl<$Res> implements _$DataArrayCopyWith<$Res> {
  __$DataArrayCopyWithImpl(this._self, this._then);

  final _DataArray _self;
  final $Res Function(_DataArray) _then;

  /// Create a copy of DataArray
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? data = null,
    Object? coords = null,
    Object? dims = null,
  }) {
    return _then(_DataArray(
      null == data
          ? _self._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<List<num>>,
      coords: null == coords
          ? _self._coords
          : coords // ignore: cast_nullable_to_non_nullable
              as List<JsonObject>,
      dims: null == dims
          ? _self._dims
          : dims // ignore: cast_nullable_to_non_nullable
              as List<JsonObject>,
    ));
  }
}

// dart format on
