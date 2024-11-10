// ignore_for_file: unused_import

import 'package:eval_ex/expression.dart' as exp;
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:optional/optional.dart';
import 'package:smart_dash_app/feature/device/application/device_driver.dart';
import 'package:smart_dash_app/feature/device/application/device_tokens_flow.dart';
import 'package:smart_dash_common/smart_dash_common.dart';
import 'package:smart_dash_flow/smart_dash_flow.dart';

class DeviceBlockFlow extends BlockFlow {
  DeviceBlockFlow({
    required super.ref,
    required super.id,
  });

  @override
  Stream<List<Tag<dynamic>>> toTags(Object event) async* {
    if (event is DevicesUpdatedEvent) {
      for (final device in event.devices) {
        yield DeviceTokensFlow.toTags(device);
      }
    }
  }

  @override
  BlockTriggerOnType toTrigger(Object event) {
    return switch (event.runtimeType) {
      const (DevicesUpdatedEvent) => BlockTriggerOnType.device,
      const (ThrottledDriverUpdatedEvent) => BlockTriggerOnType.device,
      _ => BlockTriggerOnType.none,
    };
  }
}
