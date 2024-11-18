import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:optional/optional.dart';
import 'package:smart_dash_integration/smart_dash_integration.dart';
import 'package:smart_dash_snow/smart_dash_snow.dart';

abstract class SnowDriver extends Driver<SnowDriver> {
  SnowDriver({
    required super.ref,
    required super.key,
    required super.config,
  }) {
    ref.onDispose(
      () => _controller.close(),
    );
  }

  static const Duration period = Duration(seconds: 3);

  final StreamController<List<SnowState>> _controller =
      StreamController.broadcast();

  Stream<List<SnowState>> get events => _controller.stream;

  @protected
  SnowClient newClient();

  Future<Optional<List<SnowState>>> getStates() async {
    final client = newClient();
    try {
      final states = await client.getStates();
      if (states.isPresent) {
        _controller.add(states.value);
        return states;
      }
      return const Optional.empty();
    } finally {
      client.close();
    }
  }
}
