import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_dash/feature/device/domain/device.dart';

import 'flow.dart';

part 'block.freezed.dart';
part 'block.g.dart';

/// Block model
@freezed
class BlockModel with _$BlockModel {
  const BlockModel._();

  const factory BlockModel({
    required String name,
    required String label,
    required BlockState state,
    required String description,
    required BlockTrigger trigger,
    required List<BlockAction> whenTrue,
    required List<BlockAction> whenFalse,
    required List<BlockCondition> conditions,
  }) = _BlockModel;

  factory BlockModel.fromJson(Map<String, Object?> json) =>
      _$BlockModelFromJson(json);
}

/// Block state model
@freezed
class BlockState with _$BlockState {
  const BlockState._();

  const factory BlockState({
    required bool value,
    required int repeated,
    required List<BlockParameter> parameters,
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

  factory BlockState.fromTags({
    required bool value,
    required int repeated,
    required List<FlowTag> tags,
    required DateTime? lastChanged,
  }) {
    return BlockState(
      value: value,
      repeated: repeated,
      lastChanged: lastChanged ?? DateTime.now(),
      parameters: tags.map(BlockParameter.fromTag).toList(),
    );
  }
  factory BlockState.fromJson(Map<String, Object?> json) =>
      _$BlockStateFromJson(json);
}

enum BlockTriggerOnType {
  any,
  none,
  device;
}

/// Block trigger model
@freezed
class BlockTrigger with _$BlockTrigger {
  const BlockTrigger._();

  const factory BlockTrigger({
    required bool any,
    required String label,
    required int repeatCount,
    required int repeatAfter,
    required int debounceCount,
    required int debounceAfter,
    required String description,
    required List<String> onTags,
    required List<BlockTriggerOnType> onTypes,
  }) = _BlockTrigger;

  factory BlockTrigger.fromJson(Map<String, Object?> json) =>
      _$BlockTriggerFromJson(json);
}

/// Block condition model
@freezed
class BlockCondition with _$BlockCondition {
  const BlockCondition._();

  const factory BlockCondition({
    required String label,
    required String expression,
    required String description,
    required List<BlockVariable> variables,
    required List<BlockParameter> parameters,
  }) = _BlockCondition;

  factory BlockCondition.fromJson(Map<String, Object?> json) =>
      _$BlockConditionFromJson(json);
}

/// Block variable model
@freezed
class BlockVariable with _$BlockVariable {
  const BlockVariable._();

  const factory BlockVariable({
    required String tag,
    required String name,
    required String label,
    required TokenType type,
    required TokenUnit unit,
    required String description,
  }) = _BlockVariable;

  Token toToken() => Token(
        tag: tag,
        name: name,
        unit: unit,
        type: type,
        label: label,
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
}

/// Model of block action performed when all conditions are met
@freezed
class BlockAction with _$BlockAction {
  const BlockAction._();

  const factory BlockAction({
    required String label,
    required String description,
    required BlockActionType type,
    required List<BlockParameter> parameters,
  }) = _BlockAction;

  factory BlockAction.fromJson(Map<String, Object?> json) =>
      _$BlockActionFromJson(json);
}

/// Block parameter model
@freezed
class BlockParameter with _$BlockParameter {
  const BlockParameter._();

  const factory BlockParameter({
    required String tag,
    required String name,
    required Object value,
    required TokenType type,
    required TokenUnit unit,
  }) = _BlockParameter;

  factory BlockParameter.fromTag(FlowTag tag) {
    return BlockParameter(
      tag: tag.token.tag,
      name: tag.token.tag,
      value: tag.data,
      type: tag.token.type,
      unit: tag.token.unit,
    );
  }

  factory BlockParameter.fromJson(Map<String, Object?> json) =>
      _$BlockParameterFromJson(json);
}
