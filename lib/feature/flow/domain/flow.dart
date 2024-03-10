import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_dash/feature/device/domain/device.dart';
import 'package:smart_dash/util/type.dart';

abstract class Flow {
  const Flow(this.key);

  final String key;

  bool when(Object event);

  @visibleForOverriding
  Stream<FlowEvent> evaluate(Object event);

  /// Default method
  Stream<FlowEvent> call(Object event) => evaluate(event);
}

class FlowTag<T> {
  FlowTag({
    required this.data,
    required this.when,
    required this.token,
  }) {
    assert(
      token.isType(data),
      'Token type [${token.type}] does not match data type [$type]',
    );
  }

  final T data;
  final Token token;
  final DateTime when;

  Type get type => typeOf<T>();
  String get name => token.name;

  bool isInt() => this.data is int;
  bool isBool() => this.data is bool;
  bool isNumber() => this.data is num;
  bool isDouble() => this.data is double;
  bool isType<E>() => this is FlowTag<E>;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FlowTag &&
          runtimeType == other.runtimeType &&
          token == other.token &&
          data == other.data;

  @override
  int get hashCode => token.hashCode ^ data.hashCode;

  @override
  String toString() {
    return 'FlowTag{token: ${token.name}, data: $data}';
  }
}

class FlowEvent {
  FlowEvent({
    required this.flow,
    required this.tags,
  });

  final String flow;
  final List<FlowTag> tags;

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
        '[${tags.map((e) => e.token.name).join()}]}';
  }
}
