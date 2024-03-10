import 'package:optional/optional.dart';
import 'package:smart_dash/feature/device/application/device_driver.dart';
import 'package:smart_dash/feature/device/application/device_flow.dart';
import 'package:smart_dash/feature/flow/domain/block.dart';
import 'package:smart_dash/feature/flow/domain/flow.dart';
import 'package:eval_ex/expression.dart' as exp;
import 'package:smart_dash/util/guard.dart';

class BlockFlow extends Flow {
  BlockFlow({
    required BlockModel model,
  })  : _model = model,
        super('$BlockFlow[${model.name}]');

  BlockModel get model => _model;
  BlockModel _model;

  @override
  Stream<FlowEvent> evaluate(Object event) async* {
    if (event is DevicesUpdatedEvent) {
      for (final device in event.devices) {
        final tags = DeviceTokensFlow.toTags(device);
        if (_isNameMatch(tags)) {
          for (final condition in model.conditions) {
            if (!_evaluate(condition, tags)) {
              yield* _handle(false, model.whenFalse, tags);
              return;
            }
          }
          yield* _handle(true, _model.whenTrue, tags);
        }
      }
      return;
    }
  }

  bool _isNameMatch(List<FlowTag<dynamic>> tags) {
    if (model.trigger.onTags.isEmpty) return true;
    final names = tags.map((e) => e.name).toList();
    return model.trigger.onTags.any((tag) => names.contains(tag));
  }

  bool _evaluate(BlockCondition condition, List<FlowTag<dynamic>> tags) {
    return guardSync(
      () {
        // TODO: Cache expressions for better performance?
        final expr = exp.Expression(condition.expression);
        for (final name in expr.getUsedVariables()) {
          final match = tags.firstWhereOptional(
            (e) => e.token.tag == name || e.token.name == name,
          );

          if (!match.isPresent) {
            return false;
          }
          expr.setStringVariable(
            name,
            match.value.data.toString(),
          );
        }
        final result = expr.eval().toString();
        return result == "1";
      },
      task: '_evaluate',
      name: '$BlockFlow[$key]',
    );
  }

  Stream<FlowEvent> _handle(
    bool value,
    List<BlockAction> actions,
    List<FlowTag<dynamic>> tags,
  ) async* {
    final state = model.state;
    final trigger = model.trigger;
    final changed = state.value != value;
    final repeated = changed ? 0 : state.repeated + 1;
    final expired = state.isExpired(trigger.repeatAfter);

    _model = _model.copyWith(
      state: BlockState.fromTags(
        tags: tags,
        value: value,
        repeated: repeated,
        lastChanged: changed || expired ? DateTime.now() : state.lastChanged,
      ),
    );

    final shouldDebounce = state.isExpired(
      trigger.debounceAfter,
      ifNull: DateTime.now(),
    );

    if (repeated < trigger.debounceCount ||
        trigger.debounceAfter > 0 && !shouldDebounce) return;

    final shouldRepeat = repeated <= trigger.repeatCount;

    if (changed || shouldRepeat || expired) {
      for (final action in actions) {
        switch (action.type) {
          case BlocActionType.notification:
            yield BlockNotificationEvent(action, flow: key, tags: tags);
        }
      }
    }
  }

  @override
  bool when(Object event) {
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

class BlocEvent extends FlowEvent {
  BlocEvent({
    required super.flow,
    required super.tags,
  });
}

class BlockNotificationEvent extends BlocEvent {
  BlockNotificationEvent(
    this.action, {
    required super.flow,
    required super.tags,
  });
  final BlockAction action;
}
