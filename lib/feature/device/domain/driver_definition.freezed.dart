// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'driver_definition.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DriverDefinition _$DriverDefinitionFromJson(Map<String, dynamic> json) {
  return _DriverDefinition.fromJson(json);
}

/// @nodoc
mixin _$DriverDefinition {
  String get key => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  int get instances => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<String> get fields => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DriverDefinitionCopyWith<DriverDefinition> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DriverDefinitionCopyWith<$Res> {
  factory $DriverDefinitionCopyWith(
          DriverDefinition value, $Res Function(DriverDefinition) then) =
      _$DriverDefinitionCopyWithImpl<$Res, DriverDefinition>;
  @useResult
  $Res call(
      {String key,
      String name,
      String image,
      int instances,
      String category,
      String description,
      List<String> fields});
}

/// @nodoc
class _$DriverDefinitionCopyWithImpl<$Res, $Val extends DriverDefinition>
    implements $DriverDefinitionCopyWith<$Res> {
  _$DriverDefinitionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? name = null,
    Object? image = null,
    Object? instances = null,
    Object? category = null,
    Object? description = null,
    Object? fields = null,
  }) {
    return _then(_value.copyWith(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      instances: null == instances
          ? _value.instances
          : instances // ignore: cast_nullable_to_non_nullable
              as int,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      fields: null == fields
          ? _value.fields
          : fields // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DriverDefinitionImplCopyWith<$Res>
    implements $DriverDefinitionCopyWith<$Res> {
  factory _$$DriverDefinitionImplCopyWith(_$DriverDefinitionImpl value,
          $Res Function(_$DriverDefinitionImpl) then) =
      __$$DriverDefinitionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String key,
      String name,
      String image,
      int instances,
      String category,
      String description,
      List<String> fields});
}

/// @nodoc
class __$$DriverDefinitionImplCopyWithImpl<$Res>
    extends _$DriverDefinitionCopyWithImpl<$Res, _$DriverDefinitionImpl>
    implements _$$DriverDefinitionImplCopyWith<$Res> {
  __$$DriverDefinitionImplCopyWithImpl(_$DriverDefinitionImpl _value,
      $Res Function(_$DriverDefinitionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? name = null,
    Object? image = null,
    Object? instances = null,
    Object? category = null,
    Object? description = null,
    Object? fields = null,
  }) {
    return _then(_$DriverDefinitionImpl(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      instances: null == instances
          ? _value.instances
          : instances // ignore: cast_nullable_to_non_nullable
              as int,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      fields: null == fields
          ? _value._fields
          : fields // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DriverDefinitionImpl implements _DriverDefinition {
  const _$DriverDefinitionImpl(
      {required this.key,
      required this.name,
      required this.image,
      required this.instances,
      required this.category,
      required this.description,
      required final List<String> fields})
      : _fields = fields;

  factory _$DriverDefinitionImpl.fromJson(Map<String, dynamic> json) =>
      _$$DriverDefinitionImplFromJson(json);

  @override
  final String key;
  @override
  final String name;
  @override
  final String image;
  @override
  final int instances;
  @override
  final String category;
  @override
  final String description;
  final List<String> _fields;
  @override
  List<String> get fields {
    if (_fields is EqualUnmodifiableListView) return _fields;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_fields);
  }

  @override
  String toString() {
    return 'DriverDefinition(key: $key, name: $name, image: $image, instances: $instances, category: $category, description: $description, fields: $fields)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DriverDefinitionImpl &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.instances, instances) ||
                other.instances == instances) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._fields, _fields));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, key, name, image, instances,
      category, description, const DeepCollectionEquality().hash(_fields));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DriverDefinitionImplCopyWith<_$DriverDefinitionImpl> get copyWith =>
      __$$DriverDefinitionImplCopyWithImpl<_$DriverDefinitionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DriverDefinitionImplToJson(
      this,
    );
  }
}

abstract class _DriverDefinition implements DriverDefinition {
  const factory _DriverDefinition(
      {required final String key,
      required final String name,
      required final String image,
      required final int instances,
      required final String category,
      required final String description,
      required final List<String> fields}) = _$DriverDefinitionImpl;

  factory _DriverDefinition.fromJson(Map<String, dynamic> json) =
      _$DriverDefinitionImpl.fromJson;

  @override
  String get key;
  @override
  String get name;
  @override
  String get image;
  @override
  int get instances;
  @override
  String get category;
  @override
  String get description;
  @override
  List<String> get fields;
  @override
  @JsonKey(ignore: true)
  _$$DriverDefinitionImplCopyWith<_$DriverDefinitionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
