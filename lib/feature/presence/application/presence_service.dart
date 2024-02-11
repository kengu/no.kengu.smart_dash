import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:optional/optional.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash/feature/device/domain/device.dart';
import 'package:smart_dash/feature/flow/application/flow_manager.dart';
import 'package:smart_dash/feature/system/application/network_info_service.dart';
import 'package:smart_dash/feature/system/domain/network_info.dart';
import 'package:smart_dash/util/guard.dart';
import 'package:stream_transform/stream_transform.dart';

part 'presence_service.g.dart';

class PresenceService {
  PresenceService(this.ref) {
    ref.onDispose(() {
      unbind();
      _events?.cancel();
    });
  }

  final Ref ref;
  late final PresenceFlow flow;

  Optional<PresenceEvent> get state => _state;
  Optional<PresenceEvent> _state = const Optional.empty();

  StreamSubscription<NetworkDeviceEvent>? _events;
  final _presence = StreamController<PresenceEvent>.broadcast();

  Stream<PresenceEvent> get presence => _presence.stream;

  /// Start listing to network device events
  void bind() {
    assert(
      _events == null,
      '$PresenceService is already bound to $NetworkInfoService',
    );

    flow = PresenceFlow(ref);
    _events = ref.read(networkInfoServiceProvider).events.listen(_onHandle);
  }

  /// Stop listing to network device events.
  void unbind() {
    _events?.cancel();
    _events = null;
  }

  Future<void> _onHandle(e) {
    return guard(() async {
      await for (final e in flow(e).whereType<PresenceEvent>()) {
        _state = Optional.of(e);
        _presence.add(e);
      }
    });
  }
}

class PresenceFlow extends Flow {
  const PresenceFlow(this.ref) : super('presence');

  final Ref ref;

  @override
  Stream<FlowEvent> evaluate(Object event) async* {
    if (when(event)) {
      if (event is NetworkDeviceEvent) {
        switch (event.runtimeType) {
          case const (NetworkDeviceAdded):
            yield PresenceIsHome(event.data, DateTime.now());
          case const (NetworkDeviceOnline):
            yield PresenceIsHome(event.data, DateTime.now());
          case const (NetworkDeviceOffline):
            yield PresenceIsAway(event.data, DateTime.now());
          case const (NetworkDeviceRemoved):
            yield PresenceIsAway(event.data, DateTime.now());
        }
      }
    }
  }

  @override
  bool when(Object event) =>
      // TODO: Lookup presence registered with account
      event is NetworkDeviceEvent && event.data.hostId == '30';
}

class PresenceEvent extends FlowEvent<bool> {
  PresenceEvent(NetworkDeviceInfo data, DateTime when)
      : super(
          Token(
            tag: 'presence',
            label: data.readableName,
            unit: TokenUnit.onOff,
            type: DeviceCapability.onOff.type,
            name: 'presence:${data.macAddress}',
          ),
          data.isAvailable,
          when,
        );
}

class PresenceIsHome extends PresenceEvent {
  PresenceIsHome(super.data, super.when);
}

class PresenceIsAway extends PresenceEvent {
  PresenceIsAway(super.data, super.when);
}

@Riverpod(keepAlive: true)
PresenceService presenceService(PresenceServiceRef ref) => PresenceService(ref);
