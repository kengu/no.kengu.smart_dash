// ignore_for_file: unused_import

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:optional/optional.dart';
import 'package:smart_dash/feature/device/application/device_driver.dart';
import 'package:smart_dash/feature/device/application/device_flow.dart';
import 'package:smart_dash/feature/flow/data/block_repository.dart';
import 'package:smart_dash/feature/flow/domain/block.dart';
import 'package:smart_dash/feature/flow/domain/flow.dart';
import 'package:eval_ex/expression.dart' as exp;
import 'package:smart_dash/util/guard.dart';
import 'package:smart_dash/util/string.dart';

class BlockFlow extends Flow {
  BlockFlow({
    required this.ref,
    required this.id,
  }) : super(toKey(id));

  final Ref ref;
  final String id;

  static String toKey(String id) => '$BlockFlow[$id]';

  Optional<BlockModel> get model => _model;
  Optional<BlockModel> _model = const Optional.empty();

  Future<Optional<BlockModel>> init() async {
    return _model = await ref.read(blockRepositoryProvider).get(id);
  }

  @override
  Stream<FlowEvent> evaluate(Object event) async* {
    if (event is DevicesUpdatedEvent) {
      final result = await ref.read(blockRepositoryProvider).get(id);
      if (result.isPresent) {
        final model = result.value;
        _model = result;

        for (final device in event.devices) {
          final tags = DeviceTokensFlow.toTags(device);
          if (_isNameMatch(model, tags)) {
            for (final condition in model.conditions) {
              if (!_evaluate(model, condition, tags)) {
                yield* _handle(false, model.whenFalse, tags);
                return;
              }
            }
            yield* _handle(true, model.whenTrue, tags);
          }
        }
      }
      return;
    }
  }

  bool _isNameMatch(BlockModel model, List<FlowTag<dynamic>> tags) {
    if (model.trigger.onTags.isEmpty) return true;
    final names = tags.map((e) => e.name).toList();
    return model.trigger.onTags.any((tag) => names.contains(tag));
  }

  bool _evaluate(
    BlockModel model,
    BlockCondition condition,
    List<FlowTag<dynamic>> tags,
  ) {
    return guardSync(
      () {
        // TODO: Cache expressions for better performance?
        final expr = exp.Expression(condition.expression);
        for (final name in expr.getUsedVariables()) {
          if (!_setTagValue(expr, name, tags)) {
            if (!_setParamValue(expr, name, model.parameters)) {
              return false;
            }
          }
        }
        final result = expr.eval().toString();
        return result == "1";
      },
      task: '_evaluate',
      name: '$BlockFlow[$key]',
    );
  }

  bool _setTagValue(
    exp.Expression expr,
    String name,
    List<FlowTag<dynamic>> tags,
  ) {
    final tag = tags.firstWhereOptional(
      (e) => e.token.tag == name || e.token.name == name,
    );

    if (!tag.isPresent) return false;

    expr.setStringVariable(
      name,
      tag.value.data.toString(),
    );
    return true;
  }

  bool _setParamValue(
    exp.Expression expr,
    String name,
    List<BlockParameter> parameters,
  ) {
    final param = parameters.firstWhereOptional(
      (e) => e.tag == name || e.name == name,
    );

    if (!param.isPresent) return false;

    expr.setStringVariable(
      name,
      param.value.value.toString(),
    );

    return true;
  }

  Stream<FlowEvent> _handle(
    bool value,
    List<BlockAction> actions,
    List<FlowTag<dynamic>> tags,
  ) async* {
    final result = await ref.read(blockRepositoryProvider).get(id);

    if (result.isPresent) {
      final model = result.value;
      final state = model.state;
      final trigger = model.trigger;
      final changed = state.value != value;
      final repeated = changed ? 0 : state.repeated + 1;
      final expired = state.isExpired(trigger.repeatAfter);

      final next = BlockState.fromTags(
        tags: tags,
        value: value,
        repeated: repeated,
        lastChanged: changed || expired ? DateTime.now() : state.lastChanged,
      );

      if (next != state) {
        // Only proceed if still flow exists
        if (await _save(next)) {
          yield BlockUpdatedEvent(
            flow: key,
            tags: tags,
            model: _model.value,
          );
        }
      }

      // Only proceed if still flow exists
      if (_model.isPresent) {
        final shouldDebounce = state.isExpired(
          trigger.debounceAfter,
        );

        if (repeated < trigger.debounceCount ||
            trigger.debounceAfter > 0 && !shouldDebounce) {
          return;
        }

        final shouldRepeat = repeated <= trigger.repeatCount;

        if (changed || shouldRepeat || expired || shouldDebounce) {
          for (final action in actions) {
            switch (action.type) {
              // TODO: Add more action types
              case BlockActionType.notification:
                yield BlockNotificationEvent(
                  action,
                  flow: key,
                  tags: tags,
                  model: _model.value,
                );
            }
          }
        }
      }
    }
  }

  Future<bool> _save(BlockState state) async {
    final repo = ref.read(blockRepositoryProvider);
    _model = await repo.get(id);
    if (_model.isPresent) {
      final next = _model.value.copyWith(state: state);
      _model = Optional.of(next);
      await ref.read(blockRepositoryProvider).updateAll([next]);
      Logger('$runtimeType').fine(
        '$BlockFlow: Updated Block ['
        'id: $id, '
        'value: ${next.state.value}, '
        'repeated: ${next.state.repeated}]',
      );
    }
    return _model.isPresent;
  }

  @override
  bool when(Object event) {
    if (!_model.isPresent || !_model.value.enabled) {
      return false;
    }

    final model = _model.value;

    final type = switch (event.runtimeType) {
      const (DevicesUpdatedEvent) => BlockTriggerOnType.device,
      const (ThrottledDriverUpdatedEvent) => BlockTriggerOnType.device,
      _ => BlockTriggerOnType.none,
    };
    if (type == BlockTriggerOnType.none) return false;
    return model.trigger.any
        ? model.trigger.onTypes.any((e) => e == type)
        : model.trigger.onTypes.every((e) => e == type);
  }
}

abstract class BlockEvent extends FlowEvent {
  BlockEvent({
    required super.flow,
    required super.tags,
    required this.model,
  });

  final BlockModel model;

  final _values = <String, String>{};

  String setVariables(String text) {
    final vars = text.getVariables();
    if (vars.isNotEmpty) {
      if (_values.isEmpty) {
        for (final tag in tags) {
          if (vars.contains(tag.name)) {
            _values[tag.name] = tag.toStringValue();
          }
          if (vars.contains(tag.token.tag)) {
            _values[tag.token.tag] = tag.toStringValue();
          }
        }
        for (final param in model.parameters) {
          if (vars.contains(param.name)) {
            _values[param.name] = param.toStringValue();
          }
          if (vars.contains(param.tag)) {
            _values[param.tag] = param.toStringValue();
          }
        }
      }
      return text.setVariables(_values);
    }
    return text;
  }
}

class BlockAddedEvent extends BlockEvent {
  BlockAddedEvent({
    required super.flow,
    required super.model,
    super.tags = const [],
  });
}

class BlockUpdatedEvent extends BlockEvent {
  BlockUpdatedEvent({
    required super.flow,
    required super.tags,
    required super.model,
  });
}

class BlockDeletedEvent extends BlockEvent {
  BlockDeletedEvent({
    required super.flow,
    required super.model,
    super.tags = const [],
  });
}

class BlockNotificationEvent extends BlockEvent {
  BlockNotificationEvent(
    this.action, {
    required super.flow,
    required super.tags,
    required super.model,
  });
  final BlockAction action;

  String get label => setVariables(action.label);
  String get description => setVariables(action.description);
}
