// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data_array.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DataArray _$DataArrayFromJson(Map<String, dynamic> json) {
  return _DataArray.fromJson(json);
}

/// @nodoc
mixin _$DataArray {
  /// Get the array's data (organized in
  /// columns). Each column is also known as
  /// a dimension.
  List<List<num>> get data => throw _privateConstructorUsedError;

  /// Get the array's coordinates
  /// (tick labels) to use for indexing
  /// along each dimension
  List<Map<String, Object?>> get coords => throw _privateConstructorUsedError;

  /// Get the array's name(s) of the data dimension(s)
  List<Map<String, Object?>> get dims => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataArrayCopyWith<DataArray> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataArrayCopyWith<$Res> {
  factory $DataArrayCopyWith(DataArray value, $Res Function(DataArray) then) =
      _$DataArrayCopyWithImpl<$Res, DataArray>;
  @useResult
  $Res call(
      {List<List<num>> data,
      List<Map<String, Object?>> coords,
      List<Map<String, Object?>> dims});
}

/// @nodoc
class _$DataArrayCopyWithImpl<$Res, $Val extends DataArray>
    implements $DataArrayCopyWith<$Res> {
  _$DataArrayCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? coords = null,
    Object? dims = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<List<num>>,
      coords: null == coords
          ? _value.coords
          : coords // ignore: cast_nullable_to_non_nullable
              as List<Map<String, Object?>>,
      dims: null == dims
          ? _value.dims
          : dims // ignore: cast_nullable_to_non_nullable
              as List<Map<String, Object?>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DataArrayImplCopyWith<$Res>
    implements $DataArrayCopyWith<$Res> {
  factory _$$DataArrayImplCopyWith(
          _$DataArrayImpl value, $Res Function(_$DataArrayImpl) then) =
      __$$DataArrayImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<List<num>> data,
      List<Map<String, Object?>> coords,
      List<Map<String, Object?>> dims});
}

/// @nodoc
class __$$DataArrayImplCopyWithImpl<$Res>
    extends _$DataArrayCopyWithImpl<$Res, _$DataArrayImpl>
    implements _$$DataArrayImplCopyWith<$Res> {
  __$$DataArrayImplCopyWithImpl(
      _$DataArrayImpl _value, $Res Function(_$DataArrayImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? coords = null,
    Object? dims = null,
  }) {
    return _then(_$DataArrayImpl(
      null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<List<num>>,
      coords: null == coords
          ? _value._coords
          : coords // ignore: cast_nullable_to_non_nullable
              as List<Map<String, Object?>>,
      dims: null == dims
          ? _value._dims
          : dims // ignore: cast_nullable_to_non_nullable
              as List<Map<String, Object?>>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DataArrayImpl extends _DataArray {
  const _$DataArrayImpl(final List<List<num>> data,
      {required final List<Map<String, Object?>> coords,
      required final List<Map<String, Object?>> dims})
      : _data = data,
        _coords = coords,
        _dims = dims,
        super._();

  factory _$DataArrayImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataArrayImplFromJson(json);

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
  final List<Map<String, Object?>> _coords;

  /// Get the array's coordinates
  /// (tick labels) to use for indexing
  /// along each dimension
  @override
  List<Map<String, Object?>> get coords {
    if (_coords is EqualUnmodifiableListView) return _coords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_coords);
  }

  /// Get the array's name(s) of the data dimension(s)
  final List<Map<String, Object?>> _dims;

  /// Get the array's name(s) of the data dimension(s)
  @override
  List<Map<String, Object?>> get dims {
    if (_dims is EqualUnmodifiableListView) return _dims;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dims);
  }

  @override
  String toString() {
    return 'DataArray(data: $data, coords: $coords, dims: $dims)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataArrayImpl &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            const DeepCollectionEquality().equals(other._coords, _coords) &&
            const DeepCollectionEquality().equals(other._dims, _dims));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_data),
      const DeepCollectionEquality().hash(_coords),
      const DeepCollectionEquality().hash(_dims));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataArrayImplCopyWith<_$DataArrayImpl> get copyWith =>
      __$$DataArrayImplCopyWithImpl<_$DataArrayImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DataArrayImplToJson(
      this,
    );
  }
}

abstract class _DataArray extends DataArray {
  const factory _DataArray(final List<List<num>> data,
      {required final List<Map<String, Object?>> coords,
      required final List<Map<String, Object?>> dims}) = _$DataArrayImpl;
  const _DataArray._() : super._();

  factory _DataArray.fromJson(Map<String, dynamic> json) =
      _$DataArrayImpl.fromJson;

  @override

  /// Get the array's data (organized in
  /// columns). Each column is also known as
  /// a dimension.
  List<List<num>> get data;
  @override

  /// Get the array's coordinates
  /// (tick labels) to use for indexing
  /// along each dimension
  List<Map<String, Object?>> get coords;
  @override

  /// Get the array's name(s) of the data dimension(s)
  List<Map<String, Object?>> get dims;
  @override
  @JsonKey(ignore: true)
  _$$DataArrayImplCopyWith<_$DataArrayImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
