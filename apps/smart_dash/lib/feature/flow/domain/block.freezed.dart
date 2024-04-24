// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'block.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BlockModel _$BlockModelFromJson(Map<String, dynamic> json) {
  return _BlockModel.fromJson(json);
}

/// @nodoc
mixin _$BlockModel {
  String get id => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  bool get enabled => throw _privateConstructorUsedError;
  BlockState get state => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  BlockTrigger get trigger => throw _privateConstructorUsedError;
  List<BlockAction> get whenTrue => throw _privateConstructorUsedError;
  List<BlockAction> get whenFalse => throw _privateConstructorUsedError;
  List<BlockParameter> get parameters => throw _privateConstructorUsedError;
  List<BlockCondition> get conditions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BlockModelCopyWith<BlockModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BlockModelCopyWith<$Res> {
  factory $BlockModelCopyWith(
          BlockModel value, $Res Function(BlockModel) then) =
      _$BlockModelCopyWithImpl<$Res, BlockModel>;
  @useResult
  $Res call(
      {String id,
      String label,
      bool enabled,
      BlockState state,
      String description,
      BlockTrigger trigger,
      List<BlockAction> whenTrue,
      List<BlockAction> whenFalse,
      List<BlockParameter> parameters,
      List<BlockCondition> conditions});

  $BlockStateCopyWith<$Res> get state;
  $BlockTriggerCopyWith<$Res> get trigger;
}

/// @nodoc
class _$BlockModelCopyWithImpl<$Res, $Val extends BlockModel>
    implements $BlockModelCopyWith<$Res> {
  _$BlockModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? enabled = null,
    Object? state = null,
    Object? description = null,
    Object? trigger = null,
    Object? whenTrue = null,
    Object? whenFalse = null,
    Object? parameters = null,
    Object? conditions = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      enabled: null == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as BlockState,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      trigger: null == trigger
          ? _value.trigger
          : trigger // ignore: cast_nullable_to_non_nullable
              as BlockTrigger,
      whenTrue: null == whenTrue
          ? _value.whenTrue
          : whenTrue // ignore: cast_nullable_to_non_nullable
              as List<BlockAction>,
      whenFalse: null == whenFalse
          ? _value.whenFalse
          : whenFalse // ignore: cast_nullable_to_non_nullable
              as List<BlockAction>,
      parameters: null == parameters
          ? _value.parameters
          : parameters // ignore: cast_nullable_to_non_nullable
              as List<BlockParameter>,
      conditions: null == conditions
          ? _value.conditions
          : conditions // ignore: cast_nullable_to_non_nullable
              as List<BlockCondition>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BlockStateCopyWith<$Res> get state {
    return $BlockStateCopyWith<$Res>(_value.state, (value) {
      return _then(_value.copyWith(state: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $BlockTriggerCopyWith<$Res> get trigger {
    return $BlockTriggerCopyWith<$Res>(_value.trigger, (value) {
      return _then(_value.copyWith(trigger: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BlockModelImplCopyWith<$Res>
    implements $BlockModelCopyWith<$Res> {
  factory _$$BlockModelImplCopyWith(
          _$BlockModelImpl value, $Res Function(_$BlockModelImpl) then) =
      __$$BlockModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String label,
      bool enabled,
      BlockState state,
      String description,
      BlockTrigger trigger,
      List<BlockAction> whenTrue,
      List<BlockAction> whenFalse,
      List<BlockParameter> parameters,
      List<BlockCondition> conditions});

  @override
  $BlockStateCopyWith<$Res> get state;
  @override
  $BlockTriggerCopyWith<$Res> get trigger;
}

/// @nodoc
class __$$BlockModelImplCopyWithImpl<$Res>
    extends _$BlockModelCopyWithImpl<$Res, _$BlockModelImpl>
    implements _$$BlockModelImplCopyWith<$Res> {
  __$$BlockModelImplCopyWithImpl(
      _$BlockModelImpl _value, $Res Function(_$BlockModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? enabled = null,
    Object? state = null,
    Object? description = null,
    Object? trigger = null,
    Object? whenTrue = null,
    Object? whenFalse = null,
    Object? parameters = null,
    Object? conditions = null,
  }) {
    return _then(_$BlockModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      enabled: null == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as BlockState,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      trigger: null == trigger
          ? _value.trigger
          : trigger // ignore: cast_nullable_to_non_nullable
              as BlockTrigger,
      whenTrue: null == whenTrue
          ? _value._whenTrue
          : whenTrue // ignore: cast_nullable_to_non_nullable
              as List<BlockAction>,
      whenFalse: null == whenFalse
          ? _value._whenFalse
          : whenFalse // ignore: cast_nullable_to_non_nullable
              as List<BlockAction>,
      parameters: null == parameters
          ? _value._parameters
          : parameters // ignore: cast_nullable_to_non_nullable
              as List<BlockParameter>,
      conditions: null == conditions
          ? _value._conditions
          : conditions // ignore: cast_nullable_to_non_nullable
              as List<BlockCondition>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BlockModelImpl extends _BlockModel {
  const _$BlockModelImpl(
      {required this.id,
      required this.label,
      required this.enabled,
      required this.state,
      required this.description,
      required this.trigger,
      required final List<BlockAction> whenTrue,
      required final List<BlockAction> whenFalse,
      required final List<BlockParameter> parameters,
      required final List<BlockCondition> conditions})
      : _whenTrue = whenTrue,
        _whenFalse = whenFalse,
        _parameters = parameters,
        _conditions = conditions,
        super._();

  factory _$BlockModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BlockModelImplFromJson(json);

  @override
  final String id;
  @override
  final String label;
  @override
  final bool enabled;
  @override
  final BlockState state;
  @override
  final String description;
  @override
  final BlockTrigger trigger;
  final List<BlockAction> _whenTrue;
  @override
  List<BlockAction> get whenTrue {
    if (_whenTrue is EqualUnmodifiableListView) return _whenTrue;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_whenTrue);
  }

  final List<BlockAction> _whenFalse;
  @override
  List<BlockAction> get whenFalse {
    if (_whenFalse is EqualUnmodifiableListView) return _whenFalse;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_whenFalse);
  }

  final List<BlockParameter> _parameters;
  @override
  List<BlockParameter> get parameters {
    if (_parameters is EqualUnmodifiableListView) return _parameters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_parameters);
  }

  final List<BlockCondition> _conditions;
  @override
  List<BlockCondition> get conditions {
    if (_conditions is EqualUnmodifiableListView) return _conditions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_conditions);
  }

  @override
  String toString() {
    return 'BlockModel(id: $id, label: $label, enabled: $enabled, state: $state, description: $description, trigger: $trigger, whenTrue: $whenTrue, whenFalse: $whenFalse, parameters: $parameters, conditions: $conditions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BlockModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.enabled, enabled) || other.enabled == enabled) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.trigger, trigger) || other.trigger == trigger) &&
            const DeepCollectionEquality().equals(other._whenTrue, _whenTrue) &&
            const DeepCollectionEquality()
                .equals(other._whenFalse, _whenFalse) &&
            const DeepCollectionEquality()
                .equals(other._parameters, _parameters) &&
            const DeepCollectionEquality()
                .equals(other._conditions, _conditions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      label,
      enabled,
      state,
      description,
      trigger,
      const DeepCollectionEquality().hash(_whenTrue),
      const DeepCollectionEquality().hash(_whenFalse),
      const DeepCollectionEquality().hash(_parameters),
      const DeepCollectionEquality().hash(_conditions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BlockModelImplCopyWith<_$BlockModelImpl> get copyWith =>
      __$$BlockModelImplCopyWithImpl<_$BlockModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BlockModelImplToJson(
      this,
    );
  }
}

abstract class _BlockModel extends BlockModel {
  const factory _BlockModel(
      {required final String id,
      required final String label,
      required final bool enabled,
      required final BlockState state,
      required final String description,
      required final BlockTrigger trigger,
      required final List<BlockAction> whenTrue,
      required final List<BlockAction> whenFalse,
      required final List<BlockParameter> parameters,
      required final List<BlockCondition> conditions}) = _$BlockModelImpl;
  const _BlockModel._() : super._();

  factory _BlockModel.fromJson(Map<String, dynamic> json) =
      _$BlockModelImpl.fromJson;

  @override
  String get id;
  @override
  String get label;
  @override
  bool get enabled;
  @override
  BlockState get state;
  @override
  String get description;
  @override
  BlockTrigger get trigger;
  @override
  List<BlockAction> get whenTrue;
  @override
  List<BlockAction> get whenFalse;
  @override
  List<BlockParameter> get parameters;
  @override
  List<BlockCondition> get conditions;
  @override
  @JsonKey(ignore: true)
  _$$BlockModelImplCopyWith<_$BlockModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BlockParameter _$BlockParameterFromJson(Map<String, dynamic> json) {
  return _BlockParameter.fromJson(json);
}

/// @nodoc
mixin _$BlockParameter {
  String get tag => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  Object get value => throw _privateConstructorUsedError;
  TokenType get type => throw _privateConstructorUsedError;
  TokenUnit get unit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BlockParameterCopyWith<BlockParameter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BlockParameterCopyWith<$Res> {
  factory $BlockParameterCopyWith(
          BlockParameter value, $Res Function(BlockParameter) then) =
      _$BlockParameterCopyWithImpl<$Res, BlockParameter>;
  @useResult
  $Res call(
      {String tag, String name, Object value, TokenType type, TokenUnit unit});
}

/// @nodoc
class _$BlockParameterCopyWithImpl<$Res, $Val extends BlockParameter>
    implements $BlockParameterCopyWith<$Res> {
  _$BlockParameterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tag = null,
    Object? name = null,
    Object? value = null,
    Object? type = null,
    Object? unit = null,
  }) {
    return _then(_value.copyWith(
      tag: null == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value ? _value.value : value,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TokenType,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as TokenUnit,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BlockParameterImplCopyWith<$Res>
    implements $BlockParameterCopyWith<$Res> {
  factory _$$BlockParameterImplCopyWith(_$BlockParameterImpl value,
          $Res Function(_$BlockParameterImpl) then) =
      __$$BlockParameterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String tag, String name, Object value, TokenType type, TokenUnit unit});
}

/// @nodoc
class __$$BlockParameterImplCopyWithImpl<$Res>
    extends _$BlockParameterCopyWithImpl<$Res, _$BlockParameterImpl>
    implements _$$BlockParameterImplCopyWith<$Res> {
  __$$BlockParameterImplCopyWithImpl(
      _$BlockParameterImpl _value, $Res Function(_$BlockParameterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tag = null,
    Object? name = null,
    Object? value = null,
    Object? type = null,
    Object? unit = null,
  }) {
    return _then(_$BlockParameterImpl(
      tag: null == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value ? _value.value : value,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TokenType,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as TokenUnit,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BlockParameterImpl extends _BlockParameter {
  const _$BlockParameterImpl(
      {required this.tag,
      required this.name,
      required this.value,
      required this.type,
      required this.unit})
      : super._();

  factory _$BlockParameterImpl.fromJson(Map<String, dynamic> json) =>
      _$$BlockParameterImplFromJson(json);

  @override
  final String tag;
  @override
  final String name;
  @override
  final Object value;
  @override
  final TokenType type;
  @override
  final TokenUnit unit;

  @override
  String toString() {
    return 'BlockParameter(tag: $tag, name: $name, value: $value, type: $type, unit: $unit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BlockParameterImpl &&
            (identical(other.tag, tag) || other.tag == tag) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other.value, value) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.unit, unit) || other.unit == unit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, tag, name,
      const DeepCollectionEquality().hash(value), type, unit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BlockParameterImplCopyWith<_$BlockParameterImpl> get copyWith =>
      __$$BlockParameterImplCopyWithImpl<_$BlockParameterImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BlockParameterImplToJson(
      this,
    );
  }
}

abstract class _BlockParameter extends BlockParameter {
  const factory _BlockParameter(
      {required final String tag,
      required final String name,
      required final Object value,
      required final TokenType type,
      required final TokenUnit unit}) = _$BlockParameterImpl;
  const _BlockParameter._() : super._();

  factory _BlockParameter.fromJson(Map<String, dynamic> json) =
      _$BlockParameterImpl.fromJson;

  @override
  String get tag;
  @override
  String get name;
  @override
  Object get value;
  @override
  TokenType get type;
  @override
  TokenUnit get unit;
  @override
  @JsonKey(ignore: true)
  _$$BlockParameterImplCopyWith<_$BlockParameterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BlockState _$BlockStateFromJson(Map<String, dynamic> json) {
  return _BlockState.fromJson(json);
}

/// @nodoc
mixin _$BlockState {
  bool get value => throw _privateConstructorUsedError;
  int get repeated => throw _privateConstructorUsedError;
  List<BlockParameter> get tags => throw _privateConstructorUsedError;
  DateTime? get lastChanged => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BlockStateCopyWith<BlockState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BlockStateCopyWith<$Res> {
  factory $BlockStateCopyWith(
          BlockState value, $Res Function(BlockState) then) =
      _$BlockStateCopyWithImpl<$Res, BlockState>;
  @useResult
  $Res call(
      {bool value,
      int repeated,
      List<BlockParameter> tags,
      DateTime? lastChanged});
}

/// @nodoc
class _$BlockStateCopyWithImpl<$Res, $Val extends BlockState>
    implements $BlockStateCopyWith<$Res> {
  _$BlockStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? repeated = null,
    Object? tags = null,
    Object? lastChanged = freezed,
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as bool,
      repeated: null == repeated
          ? _value.repeated
          : repeated // ignore: cast_nullable_to_non_nullable
              as int,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<BlockParameter>,
      lastChanged: freezed == lastChanged
          ? _value.lastChanged
          : lastChanged // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BlockStateImplCopyWith<$Res>
    implements $BlockStateCopyWith<$Res> {
  factory _$$BlockStateImplCopyWith(
          _$BlockStateImpl value, $Res Function(_$BlockStateImpl) then) =
      __$$BlockStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool value,
      int repeated,
      List<BlockParameter> tags,
      DateTime? lastChanged});
}

/// @nodoc
class __$$BlockStateImplCopyWithImpl<$Res>
    extends _$BlockStateCopyWithImpl<$Res, _$BlockStateImpl>
    implements _$$BlockStateImplCopyWith<$Res> {
  __$$BlockStateImplCopyWithImpl(
      _$BlockStateImpl _value, $Res Function(_$BlockStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? repeated = null,
    Object? tags = null,
    Object? lastChanged = freezed,
  }) {
    return _then(_$BlockStateImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as bool,
      repeated: null == repeated
          ? _value.repeated
          : repeated // ignore: cast_nullable_to_non_nullable
              as int,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<BlockParameter>,
      lastChanged: freezed == lastChanged
          ? _value.lastChanged
          : lastChanged // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BlockStateImpl extends _BlockState {
  const _$BlockStateImpl(
      {required this.value,
      required this.repeated,
      required final List<BlockParameter> tags,
      this.lastChanged})
      : _tags = tags,
        super._();

  factory _$BlockStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$BlockStateImplFromJson(json);

  @override
  final bool value;
  @override
  final int repeated;
  final List<BlockParameter> _tags;
  @override
  List<BlockParameter> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  final DateTime? lastChanged;

  @override
  String toString() {
    return 'BlockState(value: $value, repeated: $repeated, tags: $tags, lastChanged: $lastChanged)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BlockStateImpl &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.repeated, repeated) ||
                other.repeated == repeated) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.lastChanged, lastChanged) ||
                other.lastChanged == lastChanged));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, value, repeated,
      const DeepCollectionEquality().hash(_tags), lastChanged);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BlockStateImplCopyWith<_$BlockStateImpl> get copyWith =>
      __$$BlockStateImplCopyWithImpl<_$BlockStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BlockStateImplToJson(
      this,
    );
  }
}

abstract class _BlockState extends BlockState {
  const factory _BlockState(
      {required final bool value,
      required final int repeated,
      required final List<BlockParameter> tags,
      final DateTime? lastChanged}) = _$BlockStateImpl;
  const _BlockState._() : super._();

  factory _BlockState.fromJson(Map<String, dynamic> json) =
      _$BlockStateImpl.fromJson;

  @override
  bool get value;
  @override
  int get repeated;
  @override
  List<BlockParameter> get tags;
  @override
  DateTime? get lastChanged;
  @override
  @JsonKey(ignore: true)
  _$$BlockStateImplCopyWith<_$BlockStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BlockTrigger _$BlockTriggerFromJson(Map<String, dynamic> json) {
  return _BlockTrigger.fromJson(json);
}

/// @nodoc
mixin _$BlockTrigger {
  bool get any => throw _privateConstructorUsedError;
  int get repeatCount => throw _privateConstructorUsedError;
  int get repeatAfter => throw _privateConstructorUsedError;
  int get debounceCount => throw _privateConstructorUsedError;
  int get debounceAfter => throw _privateConstructorUsedError;
  List<String> get onTags => throw _privateConstructorUsedError;
  List<BlockTriggerOnType> get onTypes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BlockTriggerCopyWith<BlockTrigger> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BlockTriggerCopyWith<$Res> {
  factory $BlockTriggerCopyWith(
          BlockTrigger value, $Res Function(BlockTrigger) then) =
      _$BlockTriggerCopyWithImpl<$Res, BlockTrigger>;
  @useResult
  $Res call(
      {bool any,
      int repeatCount,
      int repeatAfter,
      int debounceCount,
      int debounceAfter,
      List<String> onTags,
      List<BlockTriggerOnType> onTypes});
}

/// @nodoc
class _$BlockTriggerCopyWithImpl<$Res, $Val extends BlockTrigger>
    implements $BlockTriggerCopyWith<$Res> {
  _$BlockTriggerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? any = null,
    Object? repeatCount = null,
    Object? repeatAfter = null,
    Object? debounceCount = null,
    Object? debounceAfter = null,
    Object? onTags = null,
    Object? onTypes = null,
  }) {
    return _then(_value.copyWith(
      any: null == any
          ? _value.any
          : any // ignore: cast_nullable_to_non_nullable
              as bool,
      repeatCount: null == repeatCount
          ? _value.repeatCount
          : repeatCount // ignore: cast_nullable_to_non_nullable
              as int,
      repeatAfter: null == repeatAfter
          ? _value.repeatAfter
          : repeatAfter // ignore: cast_nullable_to_non_nullable
              as int,
      debounceCount: null == debounceCount
          ? _value.debounceCount
          : debounceCount // ignore: cast_nullable_to_non_nullable
              as int,
      debounceAfter: null == debounceAfter
          ? _value.debounceAfter
          : debounceAfter // ignore: cast_nullable_to_non_nullable
              as int,
      onTags: null == onTags
          ? _value.onTags
          : onTags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      onTypes: null == onTypes
          ? _value.onTypes
          : onTypes // ignore: cast_nullable_to_non_nullable
              as List<BlockTriggerOnType>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BlockTriggerImplCopyWith<$Res>
    implements $BlockTriggerCopyWith<$Res> {
  factory _$$BlockTriggerImplCopyWith(
          _$BlockTriggerImpl value, $Res Function(_$BlockTriggerImpl) then) =
      __$$BlockTriggerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool any,
      int repeatCount,
      int repeatAfter,
      int debounceCount,
      int debounceAfter,
      List<String> onTags,
      List<BlockTriggerOnType> onTypes});
}

/// @nodoc
class __$$BlockTriggerImplCopyWithImpl<$Res>
    extends _$BlockTriggerCopyWithImpl<$Res, _$BlockTriggerImpl>
    implements _$$BlockTriggerImplCopyWith<$Res> {
  __$$BlockTriggerImplCopyWithImpl(
      _$BlockTriggerImpl _value, $Res Function(_$BlockTriggerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? any = null,
    Object? repeatCount = null,
    Object? repeatAfter = null,
    Object? debounceCount = null,
    Object? debounceAfter = null,
    Object? onTags = null,
    Object? onTypes = null,
  }) {
    return _then(_$BlockTriggerImpl(
      any: null == any
          ? _value.any
          : any // ignore: cast_nullable_to_non_nullable
              as bool,
      repeatCount: null == repeatCount
          ? _value.repeatCount
          : repeatCount // ignore: cast_nullable_to_non_nullable
              as int,
      repeatAfter: null == repeatAfter
          ? _value.repeatAfter
          : repeatAfter // ignore: cast_nullable_to_non_nullable
              as int,
      debounceCount: null == debounceCount
          ? _value.debounceCount
          : debounceCount // ignore: cast_nullable_to_non_nullable
              as int,
      debounceAfter: null == debounceAfter
          ? _value.debounceAfter
          : debounceAfter // ignore: cast_nullable_to_non_nullable
              as int,
      onTags: null == onTags
          ? _value._onTags
          : onTags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      onTypes: null == onTypes
          ? _value._onTypes
          : onTypes // ignore: cast_nullable_to_non_nullable
              as List<BlockTriggerOnType>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BlockTriggerImpl extends _BlockTrigger {
  const _$BlockTriggerImpl(
      {required this.any,
      required this.repeatCount,
      required this.repeatAfter,
      required this.debounceCount,
      required this.debounceAfter,
      required final List<String> onTags,
      required final List<BlockTriggerOnType> onTypes})
      : _onTags = onTags,
        _onTypes = onTypes,
        super._();

  factory _$BlockTriggerImpl.fromJson(Map<String, dynamic> json) =>
      _$$BlockTriggerImplFromJson(json);

  @override
  final bool any;
  @override
  final int repeatCount;
  @override
  final int repeatAfter;
  @override
  final int debounceCount;
  @override
  final int debounceAfter;
  final List<String> _onTags;
  @override
  List<String> get onTags {
    if (_onTags is EqualUnmodifiableListView) return _onTags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_onTags);
  }

  final List<BlockTriggerOnType> _onTypes;
  @override
  List<BlockTriggerOnType> get onTypes {
    if (_onTypes is EqualUnmodifiableListView) return _onTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_onTypes);
  }

  @override
  String toString() {
    return 'BlockTrigger(any: $any, repeatCount: $repeatCount, repeatAfter: $repeatAfter, debounceCount: $debounceCount, debounceAfter: $debounceAfter, onTags: $onTags, onTypes: $onTypes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BlockTriggerImpl &&
            (identical(other.any, any) || other.any == any) &&
            (identical(other.repeatCount, repeatCount) ||
                other.repeatCount == repeatCount) &&
            (identical(other.repeatAfter, repeatAfter) ||
                other.repeatAfter == repeatAfter) &&
            (identical(other.debounceCount, debounceCount) ||
                other.debounceCount == debounceCount) &&
            (identical(other.debounceAfter, debounceAfter) ||
                other.debounceAfter == debounceAfter) &&
            const DeepCollectionEquality().equals(other._onTags, _onTags) &&
            const DeepCollectionEquality().equals(other._onTypes, _onTypes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      any,
      repeatCount,
      repeatAfter,
      debounceCount,
      debounceAfter,
      const DeepCollectionEquality().hash(_onTags),
      const DeepCollectionEquality().hash(_onTypes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BlockTriggerImplCopyWith<_$BlockTriggerImpl> get copyWith =>
      __$$BlockTriggerImplCopyWithImpl<_$BlockTriggerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BlockTriggerImplToJson(
      this,
    );
  }
}

abstract class _BlockTrigger extends BlockTrigger {
  const factory _BlockTrigger(
      {required final bool any,
      required final int repeatCount,
      required final int repeatAfter,
      required final int debounceCount,
      required final int debounceAfter,
      required final List<String> onTags,
      required final List<BlockTriggerOnType> onTypes}) = _$BlockTriggerImpl;
  const _BlockTrigger._() : super._();

  factory _BlockTrigger.fromJson(Map<String, dynamic> json) =
      _$BlockTriggerImpl.fromJson;

  @override
  bool get any;
  @override
  int get repeatCount;
  @override
  int get repeatAfter;
  @override
  int get debounceCount;
  @override
  int get debounceAfter;
  @override
  List<String> get onTags;
  @override
  List<BlockTriggerOnType> get onTypes;
  @override
  @JsonKey(ignore: true)
  _$$BlockTriggerImplCopyWith<_$BlockTriggerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BlockCondition _$BlockConditionFromJson(Map<String, dynamic> json) {
  return _BlockCondition.fromJson(json);
}

/// @nodoc
mixin _$BlockCondition {
  String get label => throw _privateConstructorUsedError;
  String get expression => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<BlockVariable> get variables => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BlockConditionCopyWith<BlockCondition> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BlockConditionCopyWith<$Res> {
  factory $BlockConditionCopyWith(
          BlockCondition value, $Res Function(BlockCondition) then) =
      _$BlockConditionCopyWithImpl<$Res, BlockCondition>;
  @useResult
  $Res call(
      {String label,
      String expression,
      String description,
      List<BlockVariable> variables});
}

/// @nodoc
class _$BlockConditionCopyWithImpl<$Res, $Val extends BlockCondition>
    implements $BlockConditionCopyWith<$Res> {
  _$BlockConditionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? expression = null,
    Object? description = null,
    Object? variables = null,
  }) {
    return _then(_value.copyWith(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      expression: null == expression
          ? _value.expression
          : expression // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      variables: null == variables
          ? _value.variables
          : variables // ignore: cast_nullable_to_non_nullable
              as List<BlockVariable>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BlockConditionImplCopyWith<$Res>
    implements $BlockConditionCopyWith<$Res> {
  factory _$$BlockConditionImplCopyWith(_$BlockConditionImpl value,
          $Res Function(_$BlockConditionImpl) then) =
      __$$BlockConditionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String label,
      String expression,
      String description,
      List<BlockVariable> variables});
}

/// @nodoc
class __$$BlockConditionImplCopyWithImpl<$Res>
    extends _$BlockConditionCopyWithImpl<$Res, _$BlockConditionImpl>
    implements _$$BlockConditionImplCopyWith<$Res> {
  __$$BlockConditionImplCopyWithImpl(
      _$BlockConditionImpl _value, $Res Function(_$BlockConditionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? expression = null,
    Object? description = null,
    Object? variables = null,
  }) {
    return _then(_$BlockConditionImpl(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      expression: null == expression
          ? _value.expression
          : expression // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      variables: null == variables
          ? _value._variables
          : variables // ignore: cast_nullable_to_non_nullable
              as List<BlockVariable>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BlockConditionImpl extends _BlockCondition {
  const _$BlockConditionImpl(
      {required this.label,
      required this.expression,
      required this.description,
      required final List<BlockVariable> variables})
      : _variables = variables,
        super._();

  factory _$BlockConditionImpl.fromJson(Map<String, dynamic> json) =>
      _$$BlockConditionImplFromJson(json);

  @override
  final String label;
  @override
  final String expression;
  @override
  final String description;
  final List<BlockVariable> _variables;
  @override
  List<BlockVariable> get variables {
    if (_variables is EqualUnmodifiableListView) return _variables;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_variables);
  }

  @override
  String toString() {
    return 'BlockCondition(label: $label, expression: $expression, description: $description, variables: $variables)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BlockConditionImpl &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.expression, expression) ||
                other.expression == expression) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._variables, _variables));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, label, expression, description,
      const DeepCollectionEquality().hash(_variables));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BlockConditionImplCopyWith<_$BlockConditionImpl> get copyWith =>
      __$$BlockConditionImplCopyWithImpl<_$BlockConditionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BlockConditionImplToJson(
      this,
    );
  }
}

abstract class _BlockCondition extends BlockCondition {
  const factory _BlockCondition(
      {required final String label,
      required final String expression,
      required final String description,
      required final List<BlockVariable> variables}) = _$BlockConditionImpl;
  const _BlockCondition._() : super._();

  factory _BlockCondition.fromJson(Map<String, dynamic> json) =
      _$BlockConditionImpl.fromJson;

  @override
  String get label;
  @override
  String get expression;
  @override
  String get description;
  @override
  List<BlockVariable> get variables;
  @override
  @JsonKey(ignore: true)
  _$$BlockConditionImplCopyWith<_$BlockConditionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BlockVariable _$BlockVariableFromJson(Map<String, dynamic> json) {
  return _BlockVariable.fromJson(json);
}

/// @nodoc
mixin _$BlockVariable {
  String get tag => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  TokenType get type => throw _privateConstructorUsedError;
  TokenUnit get unit => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BlockVariableCopyWith<BlockVariable> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BlockVariableCopyWith<$Res> {
  factory $BlockVariableCopyWith(
          BlockVariable value, $Res Function(BlockVariable) then) =
      _$BlockVariableCopyWithImpl<$Res, BlockVariable>;
  @useResult
  $Res call(
      {String tag,
      String name,
      String label,
      TokenType type,
      TokenUnit unit,
      String description});
}

/// @nodoc
class _$BlockVariableCopyWithImpl<$Res, $Val extends BlockVariable>
    implements $BlockVariableCopyWith<$Res> {
  _$BlockVariableCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tag = null,
    Object? name = null,
    Object? label = null,
    Object? type = null,
    Object? unit = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      tag: null == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TokenType,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as TokenUnit,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BlockVariableImplCopyWith<$Res>
    implements $BlockVariableCopyWith<$Res> {
  factory _$$BlockVariableImplCopyWith(
          _$BlockVariableImpl value, $Res Function(_$BlockVariableImpl) then) =
      __$$BlockVariableImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String tag,
      String name,
      String label,
      TokenType type,
      TokenUnit unit,
      String description});
}

/// @nodoc
class __$$BlockVariableImplCopyWithImpl<$Res>
    extends _$BlockVariableCopyWithImpl<$Res, _$BlockVariableImpl>
    implements _$$BlockVariableImplCopyWith<$Res> {
  __$$BlockVariableImplCopyWithImpl(
      _$BlockVariableImpl _value, $Res Function(_$BlockVariableImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tag = null,
    Object? name = null,
    Object? label = null,
    Object? type = null,
    Object? unit = null,
    Object? description = null,
  }) {
    return _then(_$BlockVariableImpl(
      tag: null == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TokenType,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as TokenUnit,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BlockVariableImpl extends _BlockVariable {
  const _$BlockVariableImpl(
      {required this.tag,
      required this.name,
      required this.label,
      required this.type,
      required this.unit,
      required this.description})
      : super._();

  factory _$BlockVariableImpl.fromJson(Map<String, dynamic> json) =>
      _$$BlockVariableImplFromJson(json);

  @override
  final String tag;
  @override
  final String name;
  @override
  final String label;
  @override
  final TokenType type;
  @override
  final TokenUnit unit;
  @override
  final String description;

  @override
  String toString() {
    return 'BlockVariable(tag: $tag, name: $name, label: $label, type: $type, unit: $unit, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BlockVariableImpl &&
            (identical(other.tag, tag) || other.tag == tag) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, tag, name, label, type, unit, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BlockVariableImplCopyWith<_$BlockVariableImpl> get copyWith =>
      __$$BlockVariableImplCopyWithImpl<_$BlockVariableImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BlockVariableImplToJson(
      this,
    );
  }
}

abstract class _BlockVariable extends BlockVariable {
  const factory _BlockVariable(
      {required final String tag,
      required final String name,
      required final String label,
      required final TokenType type,
      required final TokenUnit unit,
      required final String description}) = _$BlockVariableImpl;
  const _BlockVariable._() : super._();

  factory _BlockVariable.fromJson(Map<String, dynamic> json) =
      _$BlockVariableImpl.fromJson;

  @override
  String get tag;
  @override
  String get name;
  @override
  String get label;
  @override
  TokenType get type;
  @override
  TokenUnit get unit;
  @override
  String get description;
  @override
  @JsonKey(ignore: true)
  _$$BlockVariableImplCopyWith<_$BlockVariableImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BlockAction _$BlockActionFromJson(Map<String, dynamic> json) {
  return _BlockAction.fromJson(json);
}

/// @nodoc
mixin _$BlockAction {
  String get label => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  BlockActionType get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BlockActionCopyWith<BlockAction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BlockActionCopyWith<$Res> {
  factory $BlockActionCopyWith(
          BlockAction value, $Res Function(BlockAction) then) =
      _$BlockActionCopyWithImpl<$Res, BlockAction>;
  @useResult
  $Res call({String label, String description, BlockActionType type});
}

/// @nodoc
class _$BlockActionCopyWithImpl<$Res, $Val extends BlockAction>
    implements $BlockActionCopyWith<$Res> {
  _$BlockActionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? description = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as BlockActionType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BlockActionImplCopyWith<$Res>
    implements $BlockActionCopyWith<$Res> {
  factory _$$BlockActionImplCopyWith(
          _$BlockActionImpl value, $Res Function(_$BlockActionImpl) then) =
      __$$BlockActionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String label, String description, BlockActionType type});
}

/// @nodoc
class __$$BlockActionImplCopyWithImpl<$Res>
    extends _$BlockActionCopyWithImpl<$Res, _$BlockActionImpl>
    implements _$$BlockActionImplCopyWith<$Res> {
  __$$BlockActionImplCopyWithImpl(
      _$BlockActionImpl _value, $Res Function(_$BlockActionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? description = null,
    Object? type = null,
  }) {
    return _then(_$BlockActionImpl(
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as BlockActionType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BlockActionImpl extends _BlockAction {
  const _$BlockActionImpl(
      {required this.label, required this.description, required this.type})
      : super._();

  factory _$BlockActionImpl.fromJson(Map<String, dynamic> json) =>
      _$$BlockActionImplFromJson(json);

  @override
  final String label;
  @override
  final String description;
  @override
  final BlockActionType type;

  @override
  String toString() {
    return 'BlockAction(label: $label, description: $description, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BlockActionImpl &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, label, description, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BlockActionImplCopyWith<_$BlockActionImpl> get copyWith =>
      __$$BlockActionImplCopyWithImpl<_$BlockActionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BlockActionImplToJson(
      this,
    );
  }
}

abstract class _BlockAction extends BlockAction {
  const factory _BlockAction(
      {required final String label,
      required final String description,
      required final BlockActionType type}) = _$BlockActionImpl;
  const _BlockAction._() : super._();

  factory _BlockAction.fromJson(Map<String, dynamic> json) =
      _$BlockActionImpl.fromJson;

  @override
  String get label;
  @override
  String get description;
  @override
  BlockActionType get type;
  @override
  @JsonKey(ignore: true)
  _$$BlockActionImplCopyWith<_$BlockActionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
