// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sikom_gateway.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SikomGateway _$SikomGatewayFromJson(Map<String, dynamic> json) {
  return _SikomGateway.fromJson(json);
}

/// @nodoc
mixin _$SikomGateway {
  @JsonKey(name: 'GatewayId')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'Controller')
  SikomGatewayController get controller => throw _privateConstructorUsedError;
  @JsonKey(name: 'Properties')
  SikomGatewayProperties get properties => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SikomGatewayCopyWith<SikomGateway> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SikomGatewayCopyWith<$Res> {
  factory $SikomGatewayCopyWith(
          SikomGateway value, $Res Function(SikomGateway) then) =
      _$SikomGatewayCopyWithImpl<$Res, SikomGateway>;
  @useResult
  $Res call(
      {@JsonKey(name: 'GatewayId') int id,
      @JsonKey(name: 'Controller') SikomGatewayController controller,
      @JsonKey(name: 'Properties') SikomGatewayProperties properties});

  $SikomGatewayControllerCopyWith<$Res> get controller;
  $SikomGatewayPropertiesCopyWith<$Res> get properties;
}

/// @nodoc
class _$SikomGatewayCopyWithImpl<$Res, $Val extends SikomGateway>
    implements $SikomGatewayCopyWith<$Res> {
  _$SikomGatewayCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? controller = null,
    Object? properties = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      controller: null == controller
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as SikomGatewayController,
      properties: null == properties
          ? _value.properties
          : properties // ignore: cast_nullable_to_non_nullable
              as SikomGatewayProperties,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SikomGatewayControllerCopyWith<$Res> get controller {
    return $SikomGatewayControllerCopyWith<$Res>(_value.controller, (value) {
      return _then(_value.copyWith(controller: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SikomGatewayPropertiesCopyWith<$Res> get properties {
    return $SikomGatewayPropertiesCopyWith<$Res>(_value.properties, (value) {
      return _then(_value.copyWith(properties: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SikomGatewayImplCopyWith<$Res>
    implements $SikomGatewayCopyWith<$Res> {
  factory _$$SikomGatewayImplCopyWith(
          _$SikomGatewayImpl value, $Res Function(_$SikomGatewayImpl) then) =
      __$$SikomGatewayImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'GatewayId') int id,
      @JsonKey(name: 'Controller') SikomGatewayController controller,
      @JsonKey(name: 'Properties') SikomGatewayProperties properties});

  @override
  $SikomGatewayControllerCopyWith<$Res> get controller;
  @override
  $SikomGatewayPropertiesCopyWith<$Res> get properties;
}

/// @nodoc
class __$$SikomGatewayImplCopyWithImpl<$Res>
    extends _$SikomGatewayCopyWithImpl<$Res, _$SikomGatewayImpl>
    implements _$$SikomGatewayImplCopyWith<$Res> {
  __$$SikomGatewayImplCopyWithImpl(
      _$SikomGatewayImpl _value, $Res Function(_$SikomGatewayImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? controller = null,
    Object? properties = null,
  }) {
    return _then(_$SikomGatewayImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      controller: null == controller
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as SikomGatewayController,
      properties: null == properties
          ? _value.properties
          : properties // ignore: cast_nullable_to_non_nullable
              as SikomGatewayProperties,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SikomGatewayImpl extends _SikomGateway {
  const _$SikomGatewayImpl(
      {@JsonKey(name: 'GatewayId') required this.id,
      @JsonKey(name: 'Controller') required this.controller,
      @JsonKey(name: 'Properties') required this.properties})
      : super._();

  factory _$SikomGatewayImpl.fromJson(Map<String, dynamic> json) =>
      _$$SikomGatewayImplFromJson(json);

  @override
  @JsonKey(name: 'GatewayId')
  final int id;
  @override
  @JsonKey(name: 'Controller')
  final SikomGatewayController controller;
  @override
  @JsonKey(name: 'Properties')
  final SikomGatewayProperties properties;

  @override
  String toString() {
    return 'SikomGateway(id: $id, controller: $controller, properties: $properties)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SikomGatewayImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.controller, controller) ||
                other.controller == controller) &&
            (identical(other.properties, properties) ||
                other.properties == properties));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, controller, properties);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SikomGatewayImplCopyWith<_$SikomGatewayImpl> get copyWith =>
      __$$SikomGatewayImplCopyWithImpl<_$SikomGatewayImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SikomGatewayImplToJson(
      this,
    );
  }
}

abstract class _SikomGateway extends SikomGateway {
  const factory _SikomGateway(
      {@JsonKey(name: 'GatewayId') required final int id,
      @JsonKey(name: 'Controller')
      required final SikomGatewayController controller,
      @JsonKey(name: 'Properties')
      required final SikomGatewayProperties properties}) = _$SikomGatewayImpl;
  const _SikomGateway._() : super._();

  factory _SikomGateway.fromJson(Map<String, dynamic> json) =
      _$SikomGatewayImpl.fromJson;

  @override
  @JsonKey(name: 'GatewayId')
  int get id;
  @override
  @JsonKey(name: 'Controller')
  SikomGatewayController get controller;
  @override
  @JsonKey(name: 'Properties')
  SikomGatewayProperties get properties;
  @override
  @JsonKey(ignore: true)
  _$$SikomGatewayImplCopyWith<_$SikomGatewayImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SikomGatewayController _$SikomGatewayControllerFromJson(
    Map<String, dynamic> json) {
  return _SikomGatewayController.fromJson(json);
}

/// @nodoc
mixin _$SikomGatewayController {
  @JsonKey(name: 'Properties')
  SikomGatewayControllerProperties get properties =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SikomGatewayControllerCopyWith<SikomGatewayController> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SikomGatewayControllerCopyWith<$Res> {
  factory $SikomGatewayControllerCopyWith(SikomGatewayController value,
          $Res Function(SikomGatewayController) then) =
      _$SikomGatewayControllerCopyWithImpl<$Res, SikomGatewayController>;
  @useResult
  $Res call(
      {@JsonKey(name: 'Properties')
      SikomGatewayControllerProperties properties});

  $SikomGatewayControllerPropertiesCopyWith<$Res> get properties;
}

/// @nodoc
class _$SikomGatewayControllerCopyWithImpl<$Res,
        $Val extends SikomGatewayController>
    implements $SikomGatewayControllerCopyWith<$Res> {
  _$SikomGatewayControllerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? properties = null,
  }) {
    return _then(_value.copyWith(
      properties: null == properties
          ? _value.properties
          : properties // ignore: cast_nullable_to_non_nullable
              as SikomGatewayControllerProperties,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SikomGatewayControllerPropertiesCopyWith<$Res> get properties {
    return $SikomGatewayControllerPropertiesCopyWith<$Res>(_value.properties,
        (value) {
      return _then(_value.copyWith(properties: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SikomGatewayControllerImplCopyWith<$Res>
    implements $SikomGatewayControllerCopyWith<$Res> {
  factory _$$SikomGatewayControllerImplCopyWith(
          _$SikomGatewayControllerImpl value,
          $Res Function(_$SikomGatewayControllerImpl) then) =
      __$$SikomGatewayControllerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'Properties')
      SikomGatewayControllerProperties properties});

  @override
  $SikomGatewayControllerPropertiesCopyWith<$Res> get properties;
}

/// @nodoc
class __$$SikomGatewayControllerImplCopyWithImpl<$Res>
    extends _$SikomGatewayControllerCopyWithImpl<$Res,
        _$SikomGatewayControllerImpl>
    implements _$$SikomGatewayControllerImplCopyWith<$Res> {
  __$$SikomGatewayControllerImplCopyWithImpl(
      _$SikomGatewayControllerImpl _value,
      $Res Function(_$SikomGatewayControllerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? properties = null,
  }) {
    return _then(_$SikomGatewayControllerImpl(
      properties: null == properties
          ? _value.properties
          : properties // ignore: cast_nullable_to_non_nullable
              as SikomGatewayControllerProperties,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SikomGatewayControllerImpl extends _SikomGatewayController {
  const _$SikomGatewayControllerImpl(
      {@JsonKey(name: 'Properties') required this.properties})
      : super._();

  factory _$SikomGatewayControllerImpl.fromJson(Map<String, dynamic> json) =>
      _$$SikomGatewayControllerImplFromJson(json);

  @override
  @JsonKey(name: 'Properties')
  final SikomGatewayControllerProperties properties;

  @override
  String toString() {
    return 'SikomGatewayController(properties: $properties)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SikomGatewayControllerImpl &&
            (identical(other.properties, properties) ||
                other.properties == properties));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, properties);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SikomGatewayControllerImplCopyWith<_$SikomGatewayControllerImpl>
      get copyWith => __$$SikomGatewayControllerImplCopyWithImpl<
          _$SikomGatewayControllerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SikomGatewayControllerImplToJson(
      this,
    );
  }
}

abstract class _SikomGatewayController extends SikomGatewayController {
  const factory _SikomGatewayController(
          {@JsonKey(name: 'Properties')
          required final SikomGatewayControllerProperties properties}) =
      _$SikomGatewayControllerImpl;
  const _SikomGatewayController._() : super._();

  factory _SikomGatewayController.fromJson(Map<String, dynamic> json) =
      _$SikomGatewayControllerImpl.fromJson;

  @override
  @JsonKey(name: 'Properties')
  SikomGatewayControllerProperties get properties;
  @override
  @JsonKey(ignore: true)
  _$$SikomGatewayControllerImplCopyWith<_$SikomGatewayControllerImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SikomGatewayProperties _$SikomGatewayPropertiesFromJson(
    Map<String, dynamic> json) {
  return _SikomGatewayProperties.fromJson(json);
}

/// @nodoc
mixin _$SikomGatewayProperties {
  @JsonKey(name: 'gateway_type')
  SikomProperty get gatewayType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SikomGatewayPropertiesCopyWith<SikomGatewayProperties> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SikomGatewayPropertiesCopyWith<$Res> {
  factory $SikomGatewayPropertiesCopyWith(SikomGatewayProperties value,
          $Res Function(SikomGatewayProperties) then) =
      _$SikomGatewayPropertiesCopyWithImpl<$Res, SikomGatewayProperties>;
  @useResult
  $Res call({@JsonKey(name: 'gateway_type') SikomProperty gatewayType});

  $SikomPropertyCopyWith<$Res> get gatewayType;
}

/// @nodoc
class _$SikomGatewayPropertiesCopyWithImpl<$Res,
        $Val extends SikomGatewayProperties>
    implements $SikomGatewayPropertiesCopyWith<$Res> {
  _$SikomGatewayPropertiesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gatewayType = null,
  }) {
    return _then(_value.copyWith(
      gatewayType: null == gatewayType
          ? _value.gatewayType
          : gatewayType // ignore: cast_nullable_to_non_nullable
              as SikomProperty,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SikomPropertyCopyWith<$Res> get gatewayType {
    return $SikomPropertyCopyWith<$Res>(_value.gatewayType, (value) {
      return _then(_value.copyWith(gatewayType: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SikomGatewayPropertiesImplCopyWith<$Res>
    implements $SikomGatewayPropertiesCopyWith<$Res> {
  factory _$$SikomGatewayPropertiesImplCopyWith(
          _$SikomGatewayPropertiesImpl value,
          $Res Function(_$SikomGatewayPropertiesImpl) then) =
      __$$SikomGatewayPropertiesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'gateway_type') SikomProperty gatewayType});

  @override
  $SikomPropertyCopyWith<$Res> get gatewayType;
}

/// @nodoc
class __$$SikomGatewayPropertiesImplCopyWithImpl<$Res>
    extends _$SikomGatewayPropertiesCopyWithImpl<$Res,
        _$SikomGatewayPropertiesImpl>
    implements _$$SikomGatewayPropertiesImplCopyWith<$Res> {
  __$$SikomGatewayPropertiesImplCopyWithImpl(
      _$SikomGatewayPropertiesImpl _value,
      $Res Function(_$SikomGatewayPropertiesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gatewayType = null,
  }) {
    return _then(_$SikomGatewayPropertiesImpl(
      gatewayType: null == gatewayType
          ? _value.gatewayType
          : gatewayType // ignore: cast_nullable_to_non_nullable
              as SikomProperty,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SikomGatewayPropertiesImpl extends _SikomGatewayProperties {
  const _$SikomGatewayPropertiesImpl(
      {@JsonKey(name: 'gateway_type') required this.gatewayType})
      : super._();

  factory _$SikomGatewayPropertiesImpl.fromJson(Map<String, dynamic> json) =>
      _$$SikomGatewayPropertiesImplFromJson(json);

  @override
  @JsonKey(name: 'gateway_type')
  final SikomProperty gatewayType;

  @override
  String toString() {
    return 'SikomGatewayProperties(gatewayType: $gatewayType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SikomGatewayPropertiesImpl &&
            (identical(other.gatewayType, gatewayType) ||
                other.gatewayType == gatewayType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, gatewayType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SikomGatewayPropertiesImplCopyWith<_$SikomGatewayPropertiesImpl>
      get copyWith => __$$SikomGatewayPropertiesImplCopyWithImpl<
          _$SikomGatewayPropertiesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SikomGatewayPropertiesImplToJson(
      this,
    );
  }
}

abstract class _SikomGatewayProperties extends SikomGatewayProperties {
  const factory _SikomGatewayProperties(
      {@JsonKey(name: 'gateway_type')
      required final SikomProperty gatewayType}) = _$SikomGatewayPropertiesImpl;
  const _SikomGatewayProperties._() : super._();

  factory _SikomGatewayProperties.fromJson(Map<String, dynamic> json) =
      _$SikomGatewayPropertiesImpl.fromJson;

  @override
  @JsonKey(name: 'gateway_type')
  SikomProperty get gatewayType;
  @override
  @JsonKey(ignore: true)
  _$$SikomGatewayPropertiesImplCopyWith<_$SikomGatewayPropertiesImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SikomGatewayControllerProperties _$SikomGatewayControllerPropertiesFromJson(
    Map<String, dynamic> json) {
  return _SikomGatewayControllerProperties.fromJson(json);
}

/// @nodoc
mixin _$SikomGatewayControllerProperties {
  @JsonKey(name: 'best_effort_name')
  SikomProperty get bestEffortName => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_defined_name')
  SikomProperty? get userDefinedName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SikomGatewayControllerPropertiesCopyWith<SikomGatewayControllerProperties>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SikomGatewayControllerPropertiesCopyWith<$Res> {
  factory $SikomGatewayControllerPropertiesCopyWith(
          SikomGatewayControllerProperties value,
          $Res Function(SikomGatewayControllerProperties) then) =
      _$SikomGatewayControllerPropertiesCopyWithImpl<$Res,
          SikomGatewayControllerProperties>;
  @useResult
  $Res call(
      {@JsonKey(name: 'best_effort_name') SikomProperty bestEffortName,
      @JsonKey(name: 'user_defined_name') SikomProperty? userDefinedName});

  $SikomPropertyCopyWith<$Res> get bestEffortName;
  $SikomPropertyCopyWith<$Res>? get userDefinedName;
}

/// @nodoc
class _$SikomGatewayControllerPropertiesCopyWithImpl<$Res,
        $Val extends SikomGatewayControllerProperties>
    implements $SikomGatewayControllerPropertiesCopyWith<$Res> {
  _$SikomGatewayControllerPropertiesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bestEffortName = null,
    Object? userDefinedName = freezed,
  }) {
    return _then(_value.copyWith(
      bestEffortName: null == bestEffortName
          ? _value.bestEffortName
          : bestEffortName // ignore: cast_nullable_to_non_nullable
              as SikomProperty,
      userDefinedName: freezed == userDefinedName
          ? _value.userDefinedName
          : userDefinedName // ignore: cast_nullable_to_non_nullable
              as SikomProperty?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SikomPropertyCopyWith<$Res> get bestEffortName {
    return $SikomPropertyCopyWith<$Res>(_value.bestEffortName, (value) {
      return _then(_value.copyWith(bestEffortName: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SikomPropertyCopyWith<$Res>? get userDefinedName {
    if (_value.userDefinedName == null) {
      return null;
    }

    return $SikomPropertyCopyWith<$Res>(_value.userDefinedName!, (value) {
      return _then(_value.copyWith(userDefinedName: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SikomGatewayControllerPropertiesImplCopyWith<$Res>
    implements $SikomGatewayControllerPropertiesCopyWith<$Res> {
  factory _$$SikomGatewayControllerPropertiesImplCopyWith(
          _$SikomGatewayControllerPropertiesImpl value,
          $Res Function(_$SikomGatewayControllerPropertiesImpl) then) =
      __$$SikomGatewayControllerPropertiesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'best_effort_name') SikomProperty bestEffortName,
      @JsonKey(name: 'user_defined_name') SikomProperty? userDefinedName});

  @override
  $SikomPropertyCopyWith<$Res> get bestEffortName;
  @override
  $SikomPropertyCopyWith<$Res>? get userDefinedName;
}

/// @nodoc
class __$$SikomGatewayControllerPropertiesImplCopyWithImpl<$Res>
    extends _$SikomGatewayControllerPropertiesCopyWithImpl<$Res,
        _$SikomGatewayControllerPropertiesImpl>
    implements _$$SikomGatewayControllerPropertiesImplCopyWith<$Res> {
  __$$SikomGatewayControllerPropertiesImplCopyWithImpl(
      _$SikomGatewayControllerPropertiesImpl _value,
      $Res Function(_$SikomGatewayControllerPropertiesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bestEffortName = null,
    Object? userDefinedName = freezed,
  }) {
    return _then(_$SikomGatewayControllerPropertiesImpl(
      bestEffortName: null == bestEffortName
          ? _value.bestEffortName
          : bestEffortName // ignore: cast_nullable_to_non_nullable
              as SikomProperty,
      userDefinedName: freezed == userDefinedName
          ? _value.userDefinedName
          : userDefinedName // ignore: cast_nullable_to_non_nullable
              as SikomProperty?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SikomGatewayControllerPropertiesImpl
    extends _SikomGatewayControllerProperties {
  const _$SikomGatewayControllerPropertiesImpl(
      {@JsonKey(name: 'best_effort_name') required this.bestEffortName,
      @JsonKey(name: 'user_defined_name') this.userDefinedName})
      : super._();

  factory _$SikomGatewayControllerPropertiesImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$SikomGatewayControllerPropertiesImplFromJson(json);

  @override
  @JsonKey(name: 'best_effort_name')
  final SikomProperty bestEffortName;
  @override
  @JsonKey(name: 'user_defined_name')
  final SikomProperty? userDefinedName;

  @override
  String toString() {
    return 'SikomGatewayControllerProperties(bestEffortName: $bestEffortName, userDefinedName: $userDefinedName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SikomGatewayControllerPropertiesImpl &&
            (identical(other.bestEffortName, bestEffortName) ||
                other.bestEffortName == bestEffortName) &&
            (identical(other.userDefinedName, userDefinedName) ||
                other.userDefinedName == userDefinedName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, bestEffortName, userDefinedName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SikomGatewayControllerPropertiesImplCopyWith<
          _$SikomGatewayControllerPropertiesImpl>
      get copyWith => __$$SikomGatewayControllerPropertiesImplCopyWithImpl<
          _$SikomGatewayControllerPropertiesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SikomGatewayControllerPropertiesImplToJson(
      this,
    );
  }
}

abstract class _SikomGatewayControllerProperties
    extends SikomGatewayControllerProperties {
  const factory _SikomGatewayControllerProperties(
          {@JsonKey(name: 'best_effort_name')
          required final SikomProperty bestEffortName,
          @JsonKey(name: 'user_defined_name')
          final SikomProperty? userDefinedName}) =
      _$SikomGatewayControllerPropertiesImpl;
  const _SikomGatewayControllerProperties._() : super._();

  factory _SikomGatewayControllerProperties.fromJson(
          Map<String, dynamic> json) =
      _$SikomGatewayControllerPropertiesImpl.fromJson;

  @override
  @JsonKey(name: 'best_effort_name')
  SikomProperty get bestEffortName;
  @override
  @JsonKey(name: 'user_defined_name')
  SikomProperty? get userDefinedName;
  @override
  @JsonKey(ignore: true)
  _$$SikomGatewayControllerPropertiesImplCopyWith<
          _$SikomGatewayControllerPropertiesImpl>
      get copyWith => throw _privateConstructorUsedError;
}
