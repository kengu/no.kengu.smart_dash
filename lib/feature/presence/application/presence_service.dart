import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash/feature/device/domain/device.dart';
import 'package:smart_dash/feature/flow/application/flow_manager.dart';
import 'package:smart_dash/feature/presence/data/presence_repository.dart';
import 'package:smart_dash/feature/presence/domain/presence.dart';
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
  late final PresenceFlow _flow;

  late final PresenceRepository _repo;

  StreamSubscription<NetworkDeviceEvent>? _events;
  final _presence = StreamController<PresenceEvent>.broadcast();

  Presence get state => _flow.state;

  bool get isHome => _flow.state.isHome;
  bool get isAway => _flow.state.isAway;
  int get membersAtHome => _flow.state.members.length;

  Stream<PresenceEvent> get events => _presence.stream;

  /// TODO: Get token from account
  final Token _token = const Token(
    tag: 'presence',
    label: 'Tindefjell',
    type: TokenType.int,
    unit: TokenUnit.count,
    name: 'presence:tindefjell',
  );

  /// Start listing to network device events
  Future<void> bind() async {
    assert(
      _events == null,
      '$PresenceService is already bound to $NetworkInfoService',
    );

    _repo = ref.read(presenceRepositoryProvider);
    _events = ref.read(networkInfoServiceProvider).events.listen(_onHandle);

    final state = await _repo.get(_token);
    _flow = PresenceFlow(
      _token,
      state.orElseNull ?? Presence.empty(_token),
    );
  }

  /// Stop listing to network device events.
  void unbind() {
    _events?.cancel();
    _events = null;
  }

  Future<void> _onHandle(e) {
    return guard(() async {
      await for (final e in _flow(e).whereType<PresenceEvent>()) {
        _presence.add(e);
      }
    });
  }
}

class PresenceFlow extends Flow {
  PresenceFlow(this.token, Presence state)
      : _state = state,
        super('presence');

  final Token token;

  Presence get state => _state;
  Presence _state;

  @override
  Stream<FlowEvent> evaluate(Object event) async* {
    if (when(event)) {
      if (event is NetworkDeviceEvent) {
        late MemberPresenceEvent member;
        switch (event.runtimeType) {
          case const (NetworkDeviceAdded):
            if (event.data.isAvailable) {
              yield member = MemberPresenceIsHome.from(event.data);
              yield PresenceEvent(_state = _add(member));
            }
          case const (NetworkDeviceOnline):
            yield member = MemberPresenceIsHome.from(event.data);
            yield PresenceEvent(_state = _add(member));
          case const (NetworkDeviceOffline):
            // TODO: Implement grace period before actually remove to reduce false positives
            yield member = MemberPresenceIsAway.from(event.data);
            yield PresenceEvent(_state = _remove(member));
            yield MemberPresenceIsAway.from(event.data);
          case const (NetworkDeviceRemoved):
            yield member = MemberPresenceIsAway.from(event.data);
            yield PresenceEvent(_state = _remove(member));
            yield MemberPresenceIsAway.from(event.data);
        }
      }
    }
  }

  Presence _add(MemberPresenceEvent e) {
    return Presence(
      token: token,
      when: e.when,
      isHome: true,
      members: {...state.members, e.token}.toList(),
    );
  }

  Presence _remove(MemberPresenceEvent e) {
    final members = state.members.toList()..remove(e.token);
    return Presence(
      token: token,
      when: e.when,
      members: members,
      isHome: members.isNotEmpty,
    );
  }

  @override
  bool when(Object event) =>
      // TODO: Lookup presence registered with account
      event is NetworkDeviceEvent && event.data.hostId == '30';
}

class PresenceEvent extends FlowEvent<int> {
  PresenceEvent(this.state)
      : super(state.token, state.members.length, state.when);

  final Presence state;
}

class MemberPresenceEvent extends FlowEvent<bool> {
  MemberPresenceEvent(super.token, super.isHome, super.when);

  static Token toToken(NetworkDeviceInfo data) {
    return Token(
      tag: 'presence',
      label: data.readableName,
      unit: TokenUnit.count,
      type: DeviceCapability.onOff.type,
      name: 'presence:${data.macAddress}',
    );
  }
}

class MemberPresenceIsHome extends MemberPresenceEvent {
  MemberPresenceIsHome(Token token, DateTime when) : super(token, true, when);

  factory MemberPresenceIsHome.from(NetworkDeviceInfo data, [DateTime? when]) =>
      MemberPresenceIsHome(
        MemberPresenceEvent.toToken(data),
        when ?? data.aliveWhen ?? DateTime.now(),
      );
}

class MemberPresenceIsAway extends MemberPresenceEvent {
  MemberPresenceIsAway(Token token, DateTime when) : super(token, false, when);

  factory MemberPresenceIsAway.from(NetworkDeviceInfo data, [DateTime? when]) =>
      MemberPresenceIsAway(
        MemberPresenceEvent.toToken(data),
        when ?? data.aliveWhen ?? DateTime.now(),
      );
}

@Riverpod(keepAlive: true)
PresenceService presenceService(PresenceServiceRef ref) => PresenceService(ref);
