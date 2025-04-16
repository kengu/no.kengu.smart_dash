// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'block.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BlockModel {
  String get id;
  String get type;
  String get label;
  bool get enabled;
  BlockState get state;
  String get description;
  BlockTrigger get trigger;
  List<BlockAction> get whenTrue;
  List<BlockAction> get whenFalse;
  List<BlockParameter> get parameters;
  List<BlockCondition> get conditions;

  /// Create a copy of BlockModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BlockModelCopyWith<BlockModel> get copyWith =>
      _$BlockModelCopyWithImpl<BlockModel>(this as BlockModel, _$identity);

  /// Serializes this BlockModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BlockModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.enabled, enabled) || other.enabled == enabled) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.trigger, trigger) || other.trigger == trigger) &&
            const DeepCollectionEquality().equals(other.whenTrue, whenTrue) &&
            const DeepCollectionEquality().equals(other.whenFalse, whenFalse) &&
            const DeepCollectionEquality()
                .equals(other.parameters, parameters) &&
            const DeepCollectionEquality()
                .equals(other.conditions, conditions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      type,
      label,
      enabled,
      state,
      description,
      trigger,
      const DeepCollectionEquality().hash(whenTrue),
      const DeepCollectionEquality().hash(whenFalse),
      const DeepCollectionEquality().hash(parameters),
      const DeepCollectionEquality().hash(conditions));

  @override
  String toString() {
    return 'BlockModel(id: $id, type: $type, label: $label, enabled: $enabled, state: $state, description: $description, trigger: $trigger, whenTrue: $whenTrue, whenFalse: $whenFalse, parameters: $parameters, conditions: $conditions)';
  }
}

/// @nodoc
abstract mixin class $BlockModelCopyWith<$Res> {
  factory $BlockModelCopyWith(
          BlockModel value, $Res Function(BlockModel) _then) =
      _$BlockModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String type,
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
class _$BlockModelCopyWithImpl<$Res> implements $BlockModelCopyWith<$Res> {
  _$BlockModelCopyWithImpl(this._self, this._then);

  final BlockModel _self;
  final $Res Function(BlockModel) _then;

  /// Create a copy of BlockModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
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
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _self.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      enabled: null == enabled
          ? _self.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
      state: null == state
          ? _self.state
          : state // ignore: cast_nullable_to_non_nullable
              as BlockState,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      trigger: null == trigger
          ? _self.trigger
          : trigger // ignore: cast_nullable_to_non_nullable
              as BlockTrigger,
      whenTrue: null == whenTrue
          ? _self.whenTrue
          : whenTrue // ignore: cast_nullable_to_non_nullable
              as List<BlockAction>,
      whenFalse: null == whenFalse
          ? _self.whenFalse
          : whenFalse // ignore: cast_nullable_to_non_nullable
              as List<BlockAction>,
      parameters: null == parameters
          ? _self.parameters
          : parameters // ignore: cast_nullable_to_non_nullable
              as List<BlockParameter>,
      conditions: null == conditions
          ? _self.conditions
          : conditions // ignore: cast_nullable_to_non_nullable
              as List<BlockCondition>,
    ));
  }

  /// Create a copy of BlockModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BlockStateCopyWith<$Res> get state {
    return $BlockStateCopyWith<$Res>(_self.state, (value) {
      return _then(_self.copyWith(state: value));
    });
  }

  /// Create a copy of BlockModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BlockTriggerCopyWith<$Res> get trigger {
    return $BlockTriggerCopyWith<$Res>(_self.trigger, (value) {
      return _then(_self.copyWith(trigger: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _BlockModel extends BlockModel {
  const _BlockModel(
      {required this.id,
      required this.type,
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
  factory _BlockModel.fromJson(Map<String, dynamic> json) =>
      _$BlockModelFromJson(json);

  @override
  final String id;
  @override
  final String type;
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

  /// Create a copy of BlockModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BlockModelCopyWith<_BlockModel> get copyWith =>
      __$BlockModelCopyWithImpl<_BlockModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BlockModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BlockModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      type,
      label,
      enabled,
      state,
      description,
      trigger,
      const DeepCollectionEquality().hash(_whenTrue),
      const DeepCollectionEquality().hash(_whenFalse),
      const DeepCollectionEquality().hash(_parameters),
      const DeepCollectionEquality().hash(_conditions));

  @override
  String toString() {
    return 'BlockModel(id: $id, type: $type, label: $label, enabled: $enabled, state: $state, description: $description, trigger: $trigger, whenTrue: $whenTrue, whenFalse: $whenFalse, parameters: $parameters, conditions: $conditions)';
  }
}

/// @nodoc
abstract mixin class _$BlockModelCopyWith<$Res>
    implements $BlockModelCopyWith<$Res> {
  factory _$BlockModelCopyWith(
          _BlockModel value, $Res Function(_BlockModel) _then) =
      __$BlockModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String type,
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
class __$BlockModelCopyWithImpl<$Res> implements _$BlockModelCopyWith<$Res> {
  __$BlockModelCopyWithImpl(this._self, this._then);

  final _BlockModel _self;
  final $Res Function(_BlockModel) _then;

  /// Create a copy of BlockModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? type = null,
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
    return _then(_BlockModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _self.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      enabled: null == enabled
          ? _self.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
      state: null == state
          ? _self.state
          : state // ignore: cast_nullable_to_non_nullable
              as BlockState,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      trigger: null == trigger
          ? _self.trigger
          : trigger // ignore: cast_nullable_to_non_nullable
              as BlockTrigger,
      whenTrue: null == whenTrue
          ? _self._whenTrue
          : whenTrue // ignore: cast_nullable_to_non_nullable
              as List<BlockAction>,
      whenFalse: null == whenFalse
          ? _self._whenFalse
          : whenFalse // ignore: cast_nullable_to_non_nullable
              as List<BlockAction>,
      parameters: null == parameters
          ? _self._parameters
          : parameters // ignore: cast_nullable_to_non_nullable
              as List<BlockParameter>,
      conditions: null == conditions
          ? _self._conditions
          : conditions // ignore: cast_nullable_to_non_nullable
              as List<BlockCondition>,
    ));
  }

  /// Create a copy of BlockModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BlockStateCopyWith<$Res> get state {
    return $BlockStateCopyWith<$Res>(_self.state, (value) {
      return _then(_self.copyWith(state: value));
    });
  }

  /// Create a copy of BlockModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BlockTriggerCopyWith<$Res> get trigger {
    return $BlockTriggerCopyWith<$Res>(_self.trigger, (value) {
      return _then(_self.copyWith(trigger: value));
    });
  }
}

/// @nodoc
mixin _$BlockParameter {
  String get tag;
  String get name;
  Object get value;
  ValueType get type;
  ValueUnit get unit;

  /// Create a copy of BlockParameter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BlockParameterCopyWith<BlockParameter> get copyWith =>
      _$BlockParameterCopyWithImpl<BlockParameter>(
          this as BlockParameter, _$identity);

  /// Serializes this BlockParameter to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BlockParameter &&
            (identical(other.tag, tag) || other.tag == tag) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other.value, value) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.unit, unit) || other.unit == unit));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, tag, name,
      const DeepCollectionEquality().hash(value), type, unit);

  @override
  String toString() {
    return 'BlockParameter(tag: $tag, name: $name, value: $value, type: $type, unit: $unit)';
  }
}

/// @nodoc
abstract mixin class $BlockParameterCopyWith<$Res> {
  factory $BlockParameterCopyWith(
          BlockParameter value, $Res Function(BlockParameter) _then) =
      _$BlockParameterCopyWithImpl;
  @useResult
  $Res call(
      {String tag, String name, Object value, ValueType type, ValueUnit unit});
}

/// @nodoc
class _$BlockParameterCopyWithImpl<$Res>
    implements $BlockParameterCopyWith<$Res> {
  _$BlockParameterCopyWithImpl(this._self, this._then);

  final BlockParameter _self;
  final $Res Function(BlockParameter) _then;

  /// Create a copy of BlockParameter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tag = null,
    Object? name = null,
    Object? value = null,
    Object? type = null,
    Object? unit = null,
  }) {
    return _then(_self.copyWith(
      tag: null == tag
          ? _self.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value ? _self.value : value,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as ValueType,
      unit: null == unit
          ? _self.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as ValueUnit,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _BlockParameter extends BlockParameter {
  const _BlockParameter(
      {required this.tag,
      required this.name,
      required this.value,
      required this.type,
      required this.unit})
      : super._();
  factory _BlockParameter.fromJson(Map<String, dynamic> json) =>
      _$BlockParameterFromJson(json);

  @override
  final String tag;
  @override
  final String name;
  @override
  final Object value;
  @override
  final ValueType type;
  @override
  final ValueUnit unit;

  /// Create a copy of BlockParameter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BlockParameterCopyWith<_BlockParameter> get copyWith =>
      __$BlockParameterCopyWithImpl<_BlockParameter>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BlockParameterToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BlockParameter &&
            (identical(other.tag, tag) || other.tag == tag) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other.value, value) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.unit, unit) || other.unit == unit));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, tag, name,
      const DeepCollectionEquality().hash(value), type, unit);

  @override
  String toString() {
    return 'BlockParameter(tag: $tag, name: $name, value: $value, type: $type, unit: $unit)';
  }
}

/// @nodoc
abstract mixin class _$BlockParameterCopyWith<$Res>
    implements $BlockParameterCopyWith<$Res> {
  factory _$BlockParameterCopyWith(
          _BlockParameter value, $Res Function(_BlockParameter) _then) =
      __$BlockParameterCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String tag, String name, Object value, ValueType type, ValueUnit unit});
}

/// @nodoc
class __$BlockParameterCopyWithImpl<$Res>
    implements _$BlockParameterCopyWith<$Res> {
  __$BlockParameterCopyWithImpl(this._self, this._then);

  final _BlockParameter _self;
  final $Res Function(_BlockParameter) _then;

  /// Create a copy of BlockParameter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? tag = null,
    Object? name = null,
    Object? value = null,
    Object? type = null,
    Object? unit = null,
  }) {
    return _then(_BlockParameter(
      tag: null == tag
          ? _self.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value ? _self.value : value,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as ValueType,
      unit: null == unit
          ? _self.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as ValueUnit,
    ));
  }
}

/// @nodoc
mixin _$BlockState {
  bool get value;
  int get repeated;
  List<BlockParameter> get tags;
  DateTime? get lastChanged;

  /// Create a copy of BlockState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BlockStateCopyWith<BlockState> get copyWith =>
      _$BlockStateCopyWithImpl<BlockState>(this as BlockState, _$identity);

  /// Serializes this BlockState to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BlockState &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.repeated, repeated) ||
                other.repeated == repeated) &&
            const DeepCollectionEquality().equals(other.tags, tags) &&
            (identical(other.lastChanged, lastChanged) ||
                other.lastChanged == lastChanged));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, value, repeated,
      const DeepCollectionEquality().hash(tags), lastChanged);

  @override
  String toString() {
    return 'BlockState(value: $value, repeated: $repeated, tags: $tags, lastChanged: $lastChanged)';
  }
}

/// @nodoc
abstract mixin class $BlockStateCopyWith<$Res> {
  factory $BlockStateCopyWith(
          BlockState value, $Res Function(BlockState) _then) =
      _$BlockStateCopyWithImpl;
  @useResult
  $Res call(
      {bool value,
      int repeated,
      List<BlockParameter> tags,
      DateTime? lastChanged});
}

/// @nodoc
class _$BlockStateCopyWithImpl<$Res> implements $BlockStateCopyWith<$Res> {
  _$BlockStateCopyWithImpl(this._self, this._then);

  final BlockState _self;
  final $Res Function(BlockState) _then;

  /// Create a copy of BlockState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? repeated = null,
    Object? tags = null,
    Object? lastChanged = freezed,
  }) {
    return _then(_self.copyWith(
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as bool,
      repeated: null == repeated
          ? _self.repeated
          : repeated // ignore: cast_nullable_to_non_nullable
              as int,
      tags: null == tags
          ? _self.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<BlockParameter>,
      lastChanged: freezed == lastChanged
          ? _self.lastChanged
          : lastChanged // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _BlockState extends BlockState {
  const _BlockState(
      {required this.value,
      required this.repeated,
      required final List<BlockParameter> tags,
      this.lastChanged})
      : _tags = tags,
        super._();
  factory _BlockState.fromJson(Map<String, dynamic> json) =>
      _$BlockStateFromJson(json);

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

  /// Create a copy of BlockState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BlockStateCopyWith<_BlockState> get copyWith =>
      __$BlockStateCopyWithImpl<_BlockState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BlockStateToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BlockState &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.repeated, repeated) ||
                other.repeated == repeated) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.lastChanged, lastChanged) ||
                other.lastChanged == lastChanged));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, value, repeated,
      const DeepCollectionEquality().hash(_tags), lastChanged);

  @override
  String toString() {
    return 'BlockState(value: $value, repeated: $repeated, tags: $tags, lastChanged: $lastChanged)';
  }
}

/// @nodoc
abstract mixin class _$BlockStateCopyWith<$Res>
    implements $BlockStateCopyWith<$Res> {
  factory _$BlockStateCopyWith(
          _BlockState value, $Res Function(_BlockState) _then) =
      __$BlockStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool value,
      int repeated,
      List<BlockParameter> tags,
      DateTime? lastChanged});
}

/// @nodoc
class __$BlockStateCopyWithImpl<$Res> implements _$BlockStateCopyWith<$Res> {
  __$BlockStateCopyWithImpl(this._self, this._then);

  final _BlockState _self;
  final $Res Function(_BlockState) _then;

  /// Create a copy of BlockState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? value = null,
    Object? repeated = null,
    Object? tags = null,
    Object? lastChanged = freezed,
  }) {
    return _then(_BlockState(
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as bool,
      repeated: null == repeated
          ? _self.repeated
          : repeated // ignore: cast_nullable_to_non_nullable
              as int,
      tags: null == tags
          ? _self._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<BlockParameter>,
      lastChanged: freezed == lastChanged
          ? _self.lastChanged
          : lastChanged // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
mixin _$BlockTrigger {
  bool get any;
  int get repeatCount;
  int get repeatAfter;
  int get debounceCount;
  int get debounceAfter;
  List<String> get onTags;
  List<BlockTriggerOnType> get onTypes;

  /// Create a copy of BlockTrigger
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BlockTriggerCopyWith<BlockTrigger> get copyWith =>
      _$BlockTriggerCopyWithImpl<BlockTrigger>(
          this as BlockTrigger, _$identity);

  /// Serializes this BlockTrigger to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BlockTrigger &&
            (identical(other.any, any) || other.any == any) &&
            (identical(other.repeatCount, repeatCount) ||
                other.repeatCount == repeatCount) &&
            (identical(other.repeatAfter, repeatAfter) ||
                other.repeatAfter == repeatAfter) &&
            (identical(other.debounceCount, debounceCount) ||
                other.debounceCount == debounceCount) &&
            (identical(other.debounceAfter, debounceAfter) ||
                other.debounceAfter == debounceAfter) &&
            const DeepCollectionEquality().equals(other.onTags, onTags) &&
            const DeepCollectionEquality().equals(other.onTypes, onTypes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      any,
      repeatCount,
      repeatAfter,
      debounceCount,
      debounceAfter,
      const DeepCollectionEquality().hash(onTags),
      const DeepCollectionEquality().hash(onTypes));

  @override
  String toString() {
    return 'BlockTrigger(any: $any, repeatCount: $repeatCount, repeatAfter: $repeatAfter, debounceCount: $debounceCount, debounceAfter: $debounceAfter, onTags: $onTags, onTypes: $onTypes)';
  }
}

/// @nodoc
abstract mixin class $BlockTriggerCopyWith<$Res> {
  factory $BlockTriggerCopyWith(
          BlockTrigger value, $Res Function(BlockTrigger) _then) =
      _$BlockTriggerCopyWithImpl;
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
class _$BlockTriggerCopyWithImpl<$Res> implements $BlockTriggerCopyWith<$Res> {
  _$BlockTriggerCopyWithImpl(this._self, this._then);

  final BlockTrigger _self;
  final $Res Function(BlockTrigger) _then;

  /// Create a copy of BlockTrigger
  /// with the given fields replaced by the non-null parameter values.
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
    return _then(_self.copyWith(
      any: null == any
          ? _self.any
          : any // ignore: cast_nullable_to_non_nullable
              as bool,
      repeatCount: null == repeatCount
          ? _self.repeatCount
          : repeatCount // ignore: cast_nullable_to_non_nullable
              as int,
      repeatAfter: null == repeatAfter
          ? _self.repeatAfter
          : repeatAfter // ignore: cast_nullable_to_non_nullable
              as int,
      debounceCount: null == debounceCount
          ? _self.debounceCount
          : debounceCount // ignore: cast_nullable_to_non_nullable
              as int,
      debounceAfter: null == debounceAfter
          ? _self.debounceAfter
          : debounceAfter // ignore: cast_nullable_to_non_nullable
              as int,
      onTags: null == onTags
          ? _self.onTags
          : onTags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      onTypes: null == onTypes
          ? _self.onTypes
          : onTypes // ignore: cast_nullable_to_non_nullable
              as List<BlockTriggerOnType>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _BlockTrigger extends BlockTrigger {
  const _BlockTrigger(
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
  factory _BlockTrigger.fromJson(Map<String, dynamic> json) =>
      _$BlockTriggerFromJson(json);

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

  /// Create a copy of BlockTrigger
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BlockTriggerCopyWith<_BlockTrigger> get copyWith =>
      __$BlockTriggerCopyWithImpl<_BlockTrigger>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BlockTriggerToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BlockTrigger &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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

  @override
  String toString() {
    return 'BlockTrigger(any: $any, repeatCount: $repeatCount, repeatAfter: $repeatAfter, debounceCount: $debounceCount, debounceAfter: $debounceAfter, onTags: $onTags, onTypes: $onTypes)';
  }
}

/// @nodoc
abstract mixin class _$BlockTriggerCopyWith<$Res>
    implements $BlockTriggerCopyWith<$Res> {
  factory _$BlockTriggerCopyWith(
          _BlockTrigger value, $Res Function(_BlockTrigger) _then) =
      __$BlockTriggerCopyWithImpl;
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
class __$BlockTriggerCopyWithImpl<$Res>
    implements _$BlockTriggerCopyWith<$Res> {
  __$BlockTriggerCopyWithImpl(this._self, this._then);

  final _BlockTrigger _self;
  final $Res Function(_BlockTrigger) _then;

  /// Create a copy of BlockTrigger
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? any = null,
    Object? repeatCount = null,
    Object? repeatAfter = null,
    Object? debounceCount = null,
    Object? debounceAfter = null,
    Object? onTags = null,
    Object? onTypes = null,
  }) {
    return _then(_BlockTrigger(
      any: null == any
          ? _self.any
          : any // ignore: cast_nullable_to_non_nullable
              as bool,
      repeatCount: null == repeatCount
          ? _self.repeatCount
          : repeatCount // ignore: cast_nullable_to_non_nullable
              as int,
      repeatAfter: null == repeatAfter
          ? _self.repeatAfter
          : repeatAfter // ignore: cast_nullable_to_non_nullable
              as int,
      debounceCount: null == debounceCount
          ? _self.debounceCount
          : debounceCount // ignore: cast_nullable_to_non_nullable
              as int,
      debounceAfter: null == debounceAfter
          ? _self.debounceAfter
          : debounceAfter // ignore: cast_nullable_to_non_nullable
              as int,
      onTags: null == onTags
          ? _self._onTags
          : onTags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      onTypes: null == onTypes
          ? _self._onTypes
          : onTypes // ignore: cast_nullable_to_non_nullable
              as List<BlockTriggerOnType>,
    ));
  }
}

/// @nodoc
mixin _$BlockCondition {
  String get label;
  String get expression;
  String get description;
  List<BlockVariable> get variables;

  /// Create a copy of BlockCondition
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BlockConditionCopyWith<BlockCondition> get copyWith =>
      _$BlockConditionCopyWithImpl<BlockCondition>(
          this as BlockCondition, _$identity);

  /// Serializes this BlockCondition to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BlockCondition &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.expression, expression) ||
                other.expression == expression) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other.variables, variables));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, label, expression, description,
      const DeepCollectionEquality().hash(variables));

  @override
  String toString() {
    return 'BlockCondition(label: $label, expression: $expression, description: $description, variables: $variables)';
  }
}

/// @nodoc
abstract mixin class $BlockConditionCopyWith<$Res> {
  factory $BlockConditionCopyWith(
          BlockCondition value, $Res Function(BlockCondition) _then) =
      _$BlockConditionCopyWithImpl;
  @useResult
  $Res call(
      {String label,
      String expression,
      String description,
      List<BlockVariable> variables});
}

/// @nodoc
class _$BlockConditionCopyWithImpl<$Res>
    implements $BlockConditionCopyWith<$Res> {
  _$BlockConditionCopyWithImpl(this._self, this._then);

  final BlockCondition _self;
  final $Res Function(BlockCondition) _then;

  /// Create a copy of BlockCondition
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? expression = null,
    Object? description = null,
    Object? variables = null,
  }) {
    return _then(_self.copyWith(
      label: null == label
          ? _self.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      expression: null == expression
          ? _self.expression
          : expression // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      variables: null == variables
          ? _self.variables
          : variables // ignore: cast_nullable_to_non_nullable
              as List<BlockVariable>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _BlockCondition extends BlockCondition {
  const _BlockCondition(
      {required this.label,
      required this.expression,
      required this.description,
      required final List<BlockVariable> variables})
      : _variables = variables,
        super._();
  factory _BlockCondition.fromJson(Map<String, dynamic> json) =>
      _$BlockConditionFromJson(json);

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

  /// Create a copy of BlockCondition
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BlockConditionCopyWith<_BlockCondition> get copyWith =>
      __$BlockConditionCopyWithImpl<_BlockCondition>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BlockConditionToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BlockCondition &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.expression, expression) ||
                other.expression == expression) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._variables, _variables));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, label, expression, description,
      const DeepCollectionEquality().hash(_variables));

  @override
  String toString() {
    return 'BlockCondition(label: $label, expression: $expression, description: $description, variables: $variables)';
  }
}

/// @nodoc
abstract mixin class _$BlockConditionCopyWith<$Res>
    implements $BlockConditionCopyWith<$Res> {
  factory _$BlockConditionCopyWith(
          _BlockCondition value, $Res Function(_BlockCondition) _then) =
      __$BlockConditionCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String label,
      String expression,
      String description,
      List<BlockVariable> variables});
}

/// @nodoc
class __$BlockConditionCopyWithImpl<$Res>
    implements _$BlockConditionCopyWith<$Res> {
  __$BlockConditionCopyWithImpl(this._self, this._then);

  final _BlockCondition _self;
  final $Res Function(_BlockCondition) _then;

  /// Create a copy of BlockCondition
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? label = null,
    Object? expression = null,
    Object? description = null,
    Object? variables = null,
  }) {
    return _then(_BlockCondition(
      label: null == label
          ? _self.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      expression: null == expression
          ? _self.expression
          : expression // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      variables: null == variables
          ? _self._variables
          : variables // ignore: cast_nullable_to_non_nullable
              as List<BlockVariable>,
    ));
  }
}

/// @nodoc
mixin _$BlockVariable {
  String get tag;
  String get name;
  String get label;
  ValueType get type;
  ValueUnit get unit;
  String get description;

  /// Create a copy of BlockVariable
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BlockVariableCopyWith<BlockVariable> get copyWith =>
      _$BlockVariableCopyWithImpl<BlockVariable>(
          this as BlockVariable, _$identity);

  /// Serializes this BlockVariable to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BlockVariable &&
            (identical(other.tag, tag) || other.tag == tag) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, tag, name, label, type, unit, description);

  @override
  String toString() {
    return 'BlockVariable(tag: $tag, name: $name, label: $label, type: $type, unit: $unit, description: $description)';
  }
}

/// @nodoc
abstract mixin class $BlockVariableCopyWith<$Res> {
  factory $BlockVariableCopyWith(
          BlockVariable value, $Res Function(BlockVariable) _then) =
      _$BlockVariableCopyWithImpl;
  @useResult
  $Res call(
      {String tag,
      String name,
      String label,
      ValueType type,
      ValueUnit unit,
      String description});
}

/// @nodoc
class _$BlockVariableCopyWithImpl<$Res>
    implements $BlockVariableCopyWith<$Res> {
  _$BlockVariableCopyWithImpl(this._self, this._then);

  final BlockVariable _self;
  final $Res Function(BlockVariable) _then;

  /// Create a copy of BlockVariable
  /// with the given fields replaced by the non-null parameter values.
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
    return _then(_self.copyWith(
      tag: null == tag
          ? _self.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _self.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as ValueType,
      unit: null == unit
          ? _self.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as ValueUnit,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _BlockVariable extends BlockVariable {
  const _BlockVariable(
      {required this.tag,
      required this.name,
      required this.label,
      required this.type,
      required this.unit,
      required this.description})
      : super._();
  factory _BlockVariable.fromJson(Map<String, dynamic> json) =>
      _$BlockVariableFromJson(json);

  @override
  final String tag;
  @override
  final String name;
  @override
  final String label;
  @override
  final ValueType type;
  @override
  final ValueUnit unit;
  @override
  final String description;

  /// Create a copy of BlockVariable
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BlockVariableCopyWith<_BlockVariable> get copyWith =>
      __$BlockVariableCopyWithImpl<_BlockVariable>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BlockVariableToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BlockVariable &&
            (identical(other.tag, tag) || other.tag == tag) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, tag, name, label, type, unit, description);

  @override
  String toString() {
    return 'BlockVariable(tag: $tag, name: $name, label: $label, type: $type, unit: $unit, description: $description)';
  }
}

/// @nodoc
abstract mixin class _$BlockVariableCopyWith<$Res>
    implements $BlockVariableCopyWith<$Res> {
  factory _$BlockVariableCopyWith(
          _BlockVariable value, $Res Function(_BlockVariable) _then) =
      __$BlockVariableCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String tag,
      String name,
      String label,
      ValueType type,
      ValueUnit unit,
      String description});
}

/// @nodoc
class __$BlockVariableCopyWithImpl<$Res>
    implements _$BlockVariableCopyWith<$Res> {
  __$BlockVariableCopyWithImpl(this._self, this._then);

  final _BlockVariable _self;
  final $Res Function(_BlockVariable) _then;

  /// Create a copy of BlockVariable
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? tag = null,
    Object? name = null,
    Object? label = null,
    Object? type = null,
    Object? unit = null,
    Object? description = null,
  }) {
    return _then(_BlockVariable(
      tag: null == tag
          ? _self.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _self.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as ValueType,
      unit: null == unit
          ? _self.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as ValueUnit,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$BlockAction {
  String get label;
  String get description;
  BlockActionType get type;

  /// Create a copy of BlockAction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BlockActionCopyWith<BlockAction> get copyWith =>
      _$BlockActionCopyWithImpl<BlockAction>(this as BlockAction, _$identity);

  /// Serializes this BlockAction to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BlockAction &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, label, description, type);

  @override
  String toString() {
    return 'BlockAction(label: $label, description: $description, type: $type)';
  }
}

/// @nodoc
abstract mixin class $BlockActionCopyWith<$Res> {
  factory $BlockActionCopyWith(
          BlockAction value, $Res Function(BlockAction) _then) =
      _$BlockActionCopyWithImpl;
  @useResult
  $Res call({String label, String description, BlockActionType type});
}

/// @nodoc
class _$BlockActionCopyWithImpl<$Res> implements $BlockActionCopyWith<$Res> {
  _$BlockActionCopyWithImpl(this._self, this._then);

  final BlockAction _self;
  final $Res Function(BlockAction) _then;

  /// Create a copy of BlockAction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? label = null,
    Object? description = null,
    Object? type = null,
  }) {
    return _then(_self.copyWith(
      label: null == label
          ? _self.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as BlockActionType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _BlockAction extends BlockAction {
  const _BlockAction(
      {required this.label, required this.description, required this.type})
      : super._();
  factory _BlockAction.fromJson(Map<String, dynamic> json) =>
      _$BlockActionFromJson(json);

  @override
  final String label;
  @override
  final String description;
  @override
  final BlockActionType type;

  /// Create a copy of BlockAction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BlockActionCopyWith<_BlockAction> get copyWith =>
      __$BlockActionCopyWithImpl<_BlockAction>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BlockActionToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BlockAction &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, label, description, type);

  @override
  String toString() {
    return 'BlockAction(label: $label, description: $description, type: $type)';
  }
}

/// @nodoc
abstract mixin class _$BlockActionCopyWith<$Res>
    implements $BlockActionCopyWith<$Res> {
  factory _$BlockActionCopyWith(
          _BlockAction value, $Res Function(_BlockAction) _then) =
      __$BlockActionCopyWithImpl;
  @override
  @useResult
  $Res call({String label, String description, BlockActionType type});
}

/// @nodoc
class __$BlockActionCopyWithImpl<$Res> implements _$BlockActionCopyWith<$Res> {
  __$BlockActionCopyWithImpl(this._self, this._then);

  final _BlockAction _self;
  final $Res Function(_BlockAction) _then;

  /// Create a copy of BlockAction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? label = null,
    Object? description = null,
    Object? type = null,
  }) {
    return _then(_BlockAction(
      label: null == label
          ? _self.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as BlockActionType,
    ));
  }
}

// dart format on
