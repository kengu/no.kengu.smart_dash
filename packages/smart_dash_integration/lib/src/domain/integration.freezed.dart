// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'integration.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Integration {
  String get key;
  String get name;
  bool get system;
  String get image;
  bool get enabled;
  int get instances;
  String get category;
  String get description;
  IntegrationType get type;
  List<String> get dependsOn;
  List<IntegrationField> get fields;

  /// Create a copy of Integration
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $IntegrationCopyWith<Integration> get copyWith =>
      _$IntegrationCopyWithImpl<Integration>(this as Integration, _$identity);

  /// Serializes this Integration to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Integration &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.system, system) || other.system == system) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.enabled, enabled) || other.enabled == enabled) &&
            (identical(other.instances, instances) ||
                other.instances == instances) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other.dependsOn, dependsOn) &&
            const DeepCollectionEquality().equals(other.fields, fields));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      key,
      name,
      system,
      image,
      enabled,
      instances,
      category,
      description,
      type,
      const DeepCollectionEquality().hash(dependsOn),
      const DeepCollectionEquality().hash(fields));

  @override
  String toString() {
    return 'Integration(key: $key, name: $name, system: $system, image: $image, enabled: $enabled, instances: $instances, category: $category, description: $description, type: $type, dependsOn: $dependsOn, fields: $fields)';
  }
}

/// @nodoc
abstract mixin class $IntegrationCopyWith<$Res> {
  factory $IntegrationCopyWith(
          Integration value, $Res Function(Integration) _then) =
      _$IntegrationCopyWithImpl;
  @useResult
  $Res call(
      {String key,
      String name,
      bool system,
      String image,
      bool enabled,
      int instances,
      String category,
      String description,
      IntegrationType type,
      List<String> dependsOn,
      List<IntegrationField> fields});
}

/// @nodoc
class _$IntegrationCopyWithImpl<$Res> implements $IntegrationCopyWith<$Res> {
  _$IntegrationCopyWithImpl(this._self, this._then);

  final Integration _self;
  final $Res Function(Integration) _then;

  /// Create a copy of Integration
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? name = null,
    Object? system = null,
    Object? image = null,
    Object? enabled = null,
    Object? instances = null,
    Object? category = null,
    Object? description = null,
    Object? type = null,
    Object? dependsOn = null,
    Object? fields = null,
  }) {
    return _then(_self.copyWith(
      key: null == key
          ? _self.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      system: null == system
          ? _self.system
          : system // ignore: cast_nullable_to_non_nullable
              as bool,
      image: null == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      enabled: null == enabled
          ? _self.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
      instances: null == instances
          ? _self.instances
          : instances // ignore: cast_nullable_to_non_nullable
              as int,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as IntegrationType,
      dependsOn: null == dependsOn
          ? _self.dependsOn
          : dependsOn // ignore: cast_nullable_to_non_nullable
              as List<String>,
      fields: null == fields
          ? _self.fields
          : fields // ignore: cast_nullable_to_non_nullable
              as List<IntegrationField>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Integration implements Integration {
  const _Integration(
      {required this.key,
      required this.name,
      required this.system,
      required this.image,
      required this.enabled,
      required this.instances,
      required this.category,
      required this.description,
      required this.type,
      required final List<String> dependsOn,
      required final List<IntegrationField> fields})
      : _dependsOn = dependsOn,
        _fields = fields;
  factory _Integration.fromJson(Map<String, dynamic> json) =>
      _$IntegrationFromJson(json);

  @override
  final String key;
  @override
  final String name;
  @override
  final bool system;
  @override
  final String image;
  @override
  final bool enabled;
  @override
  final int instances;
  @override
  final String category;
  @override
  final String description;
  @override
  final IntegrationType type;
  final List<String> _dependsOn;
  @override
  List<String> get dependsOn {
    if (_dependsOn is EqualUnmodifiableListView) return _dependsOn;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dependsOn);
  }

  final List<IntegrationField> _fields;
  @override
  List<IntegrationField> get fields {
    if (_fields is EqualUnmodifiableListView) return _fields;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_fields);
  }

  /// Create a copy of Integration
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$IntegrationCopyWith<_Integration> get copyWith =>
      __$IntegrationCopyWithImpl<_Integration>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$IntegrationToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Integration &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.system, system) || other.system == system) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.enabled, enabled) || other.enabled == enabled) &&
            (identical(other.instances, instances) ||
                other.instances == instances) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality()
                .equals(other._dependsOn, _dependsOn) &&
            const DeepCollectionEquality().equals(other._fields, _fields));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      key,
      name,
      system,
      image,
      enabled,
      instances,
      category,
      description,
      type,
      const DeepCollectionEquality().hash(_dependsOn),
      const DeepCollectionEquality().hash(_fields));

  @override
  String toString() {
    return 'Integration(key: $key, name: $name, system: $system, image: $image, enabled: $enabled, instances: $instances, category: $category, description: $description, type: $type, dependsOn: $dependsOn, fields: $fields)';
  }
}

/// @nodoc
abstract mixin class _$IntegrationCopyWith<$Res>
    implements $IntegrationCopyWith<$Res> {
  factory _$IntegrationCopyWith(
          _Integration value, $Res Function(_Integration) _then) =
      __$IntegrationCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String key,
      String name,
      bool system,
      String image,
      bool enabled,
      int instances,
      String category,
      String description,
      IntegrationType type,
      List<String> dependsOn,
      List<IntegrationField> fields});
}

/// @nodoc
class __$IntegrationCopyWithImpl<$Res> implements _$IntegrationCopyWith<$Res> {
  __$IntegrationCopyWithImpl(this._self, this._then);

  final _Integration _self;
  final $Res Function(_Integration) _then;

  /// Create a copy of Integration
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? key = null,
    Object? name = null,
    Object? system = null,
    Object? image = null,
    Object? enabled = null,
    Object? instances = null,
    Object? category = null,
    Object? description = null,
    Object? type = null,
    Object? dependsOn = null,
    Object? fields = null,
  }) {
    return _then(_Integration(
      key: null == key
          ? _self.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      system: null == system
          ? _self.system
          : system // ignore: cast_nullable_to_non_nullable
              as bool,
      image: null == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      enabled: null == enabled
          ? _self.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
      instances: null == instances
          ? _self.instances
          : instances // ignore: cast_nullable_to_non_nullable
              as int,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as IntegrationType,
      dependsOn: null == dependsOn
          ? _self._dependsOn
          : dependsOn // ignore: cast_nullable_to_non_nullable
              as List<String>,
      fields: null == fields
          ? _self._fields
          : fields // ignore: cast_nullable_to_non_nullable
              as List<IntegrationField>,
    ));
  }
}

// dart format on
