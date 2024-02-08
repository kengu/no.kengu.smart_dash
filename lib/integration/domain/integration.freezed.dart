// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'integration.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Integration _$IntegrationFromJson(Map<String, dynamic> json) {
  return _Integration.fromJson(json);
}

/// @nodoc
mixin _$Integration {
  String get key => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  int get instances => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<ServiceField> get fields => throw _privateConstructorUsedError;
  List<IntegrationFeature> get features => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IntegrationCopyWith<Integration> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IntegrationCopyWith<$Res> {
  factory $IntegrationCopyWith(
          Integration value, $Res Function(Integration) then) =
      _$IntegrationCopyWithImpl<$Res, Integration>;
  @useResult
  $Res call(
      {String key,
      String name,
      String image,
      int instances,
      String category,
      String description,
      List<ServiceField> fields,
      List<IntegrationFeature> features});
}

/// @nodoc
class _$IntegrationCopyWithImpl<$Res, $Val extends Integration>
    implements $IntegrationCopyWith<$Res> {
  _$IntegrationCopyWithImpl(this._value, this._then);

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
    Object? features = null,
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
              as List<ServiceField>,
      features: null == features
          ? _value.features
          : features // ignore: cast_nullable_to_non_nullable
              as List<IntegrationFeature>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IntegrationImplCopyWith<$Res>
    implements $IntegrationCopyWith<$Res> {
  factory _$$IntegrationImplCopyWith(
          _$IntegrationImpl value, $Res Function(_$IntegrationImpl) then) =
      __$$IntegrationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String key,
      String name,
      String image,
      int instances,
      String category,
      String description,
      List<ServiceField> fields,
      List<IntegrationFeature> features});
}

/// @nodoc
class __$$IntegrationImplCopyWithImpl<$Res>
    extends _$IntegrationCopyWithImpl<$Res, _$IntegrationImpl>
    implements _$$IntegrationImplCopyWith<$Res> {
  __$$IntegrationImplCopyWithImpl(
      _$IntegrationImpl _value, $Res Function(_$IntegrationImpl) _then)
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
    Object? features = null,
  }) {
    return _then(_$IntegrationImpl(
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
              as List<ServiceField>,
      features: null == features
          ? _value._features
          : features // ignore: cast_nullable_to_non_nullable
              as List<IntegrationFeature>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IntegrationImpl implements _Integration {
  const _$IntegrationImpl(
      {required this.key,
      required this.name,
      required this.image,
      required this.instances,
      required this.category,
      required this.description,
      required final List<ServiceField> fields,
      required final List<IntegrationFeature> features})
      : _fields = fields,
        _features = features;

  factory _$IntegrationImpl.fromJson(Map<String, dynamic> json) =>
      _$$IntegrationImplFromJson(json);

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
  final List<ServiceField> _fields;
  @override
  List<ServiceField> get fields {
    if (_fields is EqualUnmodifiableListView) return _fields;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_fields);
  }

  final List<IntegrationFeature> _features;
  @override
  List<IntegrationFeature> get features {
    if (_features is EqualUnmodifiableListView) return _features;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_features);
  }

  @override
  String toString() {
    return 'Integration(key: $key, name: $name, image: $image, instances: $instances, category: $category, description: $description, fields: $fields, features: $features)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IntegrationImpl &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.instances, instances) ||
                other.instances == instances) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._fields, _fields) &&
            const DeepCollectionEquality().equals(other._features, _features));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      key,
      name,
      image,
      instances,
      category,
      description,
      const DeepCollectionEquality().hash(_fields),
      const DeepCollectionEquality().hash(_features));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IntegrationImplCopyWith<_$IntegrationImpl> get copyWith =>
      __$$IntegrationImplCopyWithImpl<_$IntegrationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IntegrationImplToJson(
      this,
    );
  }
}

abstract class _Integration implements Integration {
  const factory _Integration(
      {required final String key,
      required final String name,
      required final String image,
      required final int instances,
      required final String category,
      required final String description,
      required final List<ServiceField> fields,
      required final List<IntegrationFeature> features}) = _$IntegrationImpl;

  factory _Integration.fromJson(Map<String, dynamic> json) =
      _$IntegrationImpl.fromJson;

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
  List<ServiceField> get fields;
  @override
  List<IntegrationFeature> get features;
  @override
  @JsonKey(ignore: true)
  _$$IntegrationImplCopyWith<_$IntegrationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
