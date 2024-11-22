import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:optional/optional.dart';
import 'package:smart_dash_integration/smart_dash_integration.dart';
import 'package:smart_dash_snow/smart_dash_snow.dart';
import 'package:smart_dash_snow/src/data/snow_client.dart';

abstract class SnowDriver extends Driver<SnowDriver> {
  SnowDriver({
    required super.ref,
    required super.key,
    required super.config,
  }) : super(type: IntegrationType.snow);

  static const ttl = Duration(hours: 1);
  static const max = Duration(hours: 24);

  @protected
  SnowClient newClient();

  Future<Optional<SnowState>> getState(String location) async {
    final client = newClient();
    try {
      final state = await client.getState(location);
      if (state.isPresent) {
        raise(
          SnowDataEvent.now(key, [state.value]),
        );
      }
      return state;
    } finally {
      client.close();
    }
  }

  Future<Optional<List<SnowState>>> getStates() async {
    final client = newClient();
    try {
      final states = await client.getStates();
      if (states.isPresent) {
        raise(
          SnowDataEvent.now(key, states.value),
        );
        return states;
      }
      return const Optional.empty();
    } finally {
      client.close();
    }
  }
}

class SnowEvent extends DriverEvent {
  SnowEvent({
    required super.key,
    required super.last,
    required super.when,
  });
}

class SnowDataEvent extends DriverDataEvent<List<SnowState>> {
  SnowDataEvent(
    super.data, {
    required super.key,
    required super.last,
    required super.when,
  });

  factory SnowDataEvent.now(String key, List<SnowState> data) {
    final when = DateTime.now();
    return SnowDataEvent(
      data,
      key: key,
      when: when,
      last: when,
    );
  }
}
