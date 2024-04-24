import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_dash_common/smart_dash_common.dart';

abstract class Flow {
  const Flow(this.key);

  final String key;

  bool when(Object event);

  @visibleForOverriding
  Stream<FlowEvent> evaluate(Object event);

  /// Default method
  Stream<FlowEvent> call(Object event) => evaluate(event);
}

class FlowEvent {
  FlowEvent({
    required this.flow,
    required this.tags,
    DateTime? when,
  }) : when = when ?? DateTime.now();

  final String flow;
  final List<Tag> tags;
  final DateTime when;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FlowEvent &&
          runtimeType == other.runtimeType &&
          flow == other.flow &&
          tags == other.tags;

  @override
  int get hashCode => flow.hashCode ^ tags.hashCode;

  @override
  String toString() {
    return 'FlowEvent{flow: $flow, tags: '
        '[${tags.map((e) => e.token.name).join(',')}]}';
  }
}
