import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_dash_common/smart_dash_common.dart';

part 'block.freezed.dart';
part 'block.g.dart';

class BlockFields {
  static const String id = 'id';
  static const String type = 'type';
  static const String label = 'label';
  static const String state = 'state';
  static const String enabled = 'enabled';
  static const String trigger = 'trigger';
  static const String whenTrue = 'whenTrue';
  static const String whenFalse = 'whenFalse';
  static const String parameters = 'parameters';
  static const String conditions = 'conditions';
  static const String description = 'description';
}

/// Block model
@freezed
sealed class BlockModel with _$BlockModel {
  const BlockModel._();

  const factory BlockModel({
    required String id,
    required String type,
    required String label,
    required bool enabled,
    required BlockState state,
    required String description,
    required BlockTrigger trigger,
    required List<BlockAction> whenTrue,
    required List<BlockAction> whenFalse,
    required List<BlockParameter> parameters,
    required List<BlockCondition> conditions,
  }) = _BlockModel;

  factory BlockModel.empty({
    required String type,
    required String id,
    required String label,
  }) {
    return BlockModel(
      id: id,
      type: type,
      label: label,
      enabled: true,
      state: BlockState.empty(),
      description: label,
      trigger: const BlockTrigger(
        any: false,
        repeatCount: 0,
        repeatAfter: 300,
        debounceCount: 0,
        debounceAfter: 0,
        onTags: [],
        onTypes: [
          BlockTriggerOnType.device,
        ],
      ),
      whenTrue: const [],
      whenFalse: const [],
      parameters: const [],
      conditions: const [],
    );
  }
  factory BlockModel.fromJson(Map<String, Object?> json) =>
      _$BlockModelFromJson(json);
}

class BlockParameterFields {
  static const String tag = 'tag';
  static const String type = 'type';
  static const String unit = 'unit';
  static const String name = 'name';
  static const String value = 'value';
}

/// Block parameter model
@freezed
sealed class BlockParameter with _$BlockParameter {
  const BlockParameter._();

  const factory BlockParameter({
    required String tag,
    required String name,
    required Object value,
    required ValueType type,
    required ValueUnit unit,
  }) = _BlockParameter;

  factory BlockParameter.fromTag(Tag tag) {
    return BlockParameter(
      tag: tag.token.tag,
      name: tag.token.tag,
      value: tag.data,
      type: tag.token.type,
      unit: tag.token.unit,
    );
  }

  String toStringValue() {
    switch (type) {
      case ValueType.bool:
        return value.toString();
      case ValueType.int:
        return (value as int).format(unit.symbol);
      case ValueType.double:
        return (value as double).format(unit.symbol);
    }
  }

  factory BlockParameter.fromJson(Map<String, Object?> json) =>
      _$BlockParameterFromJson(json);
}

/// Block state model
@freezed
sealed class BlockState with _$BlockState {
  const BlockState._();

  const factory BlockState({
    required bool value,
    required int repeated,
    required List<BlockParameter> tags,
    DateTime? lastChanged,
  }) = _BlockState;

  /// Check if [ttl] exceeds duration from [lastChanged] to now.
  ///
  /// If [ttl] is equal to or less than zero this function returns false.
  bool isExpired(int ttl, {DateTime? ifNull}) {
    final when = lastChanged ?? ifNull;
    return ttl > 0 &&
        (when == null || DateTime.now().difference(when).inSeconds > ttl);
  }

  factory BlockState.empty() {
    return BlockState(
      tags: [],
      repeated: 0,
      value: false,
      lastChanged: DateTime.now(),
    );
  }

  factory BlockState.fromTags({
    required bool value,
    required int repeated,
    required List<Tag> tags,
    required DateTime? lastChanged,
  }) {
    return BlockState(
      value: value,
      repeated: repeated,
      lastChanged: lastChanged ?? DateTime.now(),
      tags: tags.map(BlockParameter.fromTag).toList(),
    );
  }
  factory BlockState.fromJson(Map<String, Object?> json) =>
      _$BlockStateFromJson(json);
}

enum BlockTriggerOnType {
  any,
  none,
  device;

  bool get isAny => this == any;
  bool get isNone => this == none;
  bool get isSpecific => !(isAny || isNone);

  static List<BlockTriggerOnType> get specific =>
      values.where((e) => e.isSpecific).toList();

  static List<BlockTriggerOnType> reminder(List<BlockTriggerOnType> exists) =>
      values.where((e) => e.isSpecific && !exists.contains(e)).toList();

  static BlockTriggerOnType of(String name) =>
      values.firstWhere((e) => e.name == name, orElse: () => any);
}

class BlockTriggerFields {
  static const String any = 'any';
  static const String onTags = 'onTags';
  static const String onTypes = 'onTypes';
  static const String repeatCount = 'repeatCount';
  static const String repeatAfter = 'repeatAfter';
  static const String debounceCount = 'debounceCount';
  static const String debounceAfter = 'debounceAfter';
}

/// Block trigger model
@freezed
sealed class BlockTrigger with _$BlockTrigger {
  const BlockTrigger._();

  const factory BlockTrigger({
    required bool any,
    required int repeatCount,
    required int repeatAfter,
    required int debounceCount,
    required int debounceAfter,
    required List<String> onTags,
    required List<BlockTriggerOnType> onTypes,
  }) = _BlockTrigger;

  factory BlockTrigger.fromJson(Map<String, Object?> json) =>
      _$BlockTriggerFromJson(json);
}

class BlockConditionFields {
  static const String label = 'label';
  static const String expression = 'expression';
  static const String description = 'description';
  static const String variables = 'variables';
}

/// Block condition model
@freezed
sealed class BlockCondition with _$BlockCondition {
  const BlockCondition._();

  const factory BlockCondition({
    required String label,
    required String expression,
    required String description,
    required List<BlockVariable> variables,
  }) = _BlockCondition;

  factory BlockCondition.fromJson(Map<String, Object?> json) =>
      _$BlockConditionFromJson(json);
}

class BlockVariableFields {
  static const String tag = 'tag';
  static const String name = 'name';
  static const String type = 'type';
  static const String unit = 'unit';
  static const String label = 'label';
  static const String description = 'description';
}

/// Block variable model
@freezed
sealed class BlockVariable with _$BlockVariable {
  const BlockVariable._();

  const factory BlockVariable({
    required String tag,
    required String name,
    required String label,
    required ValueType type,
    required ValueUnit unit,
    required String description,
  }) = _BlockVariable;

  Token toToken() => Token(
        tag: tag,
        name: name,
        label: label,
        capability: Capability.any,
      );

  factory BlockVariable.fromToken(
    Token token, {
    String description = '',
  }) {
    return BlockVariable(
      tag: token.tag,
      name: token.name,
      type: token.type,
      unit: token.unit,
      label: token.label,
      description: description,
    );
  }

  factory BlockVariable.fromJson(Map<String, Object?> json) =>
      _$BlockVariableFromJson(json);
}

enum BlockActionType {
  notification;

  static BlockActionType of(String name) =>
      values.firstWhere((e) => e.name == name,
          orElse: () => BlockActionType.notification);
}

class BlockActionFields {
  static const String label = 'label';
  static const String description = 'description';
  static const String type = 'type';
}

/// Model of block action performed when all conditions are met
@freezed
sealed class BlockAction with _$BlockAction {
  const BlockAction._();

  const factory BlockAction({
    required String label,
    required String description,
    required BlockActionType type,
  }) = _BlockAction;

  factory BlockAction.fromJson(Map<String, Object?> json) =>
      _$BlockActionFromJson(json);
}
