import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:optional/optional.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash/feature/device/domain/device.dart';
import 'package:smart_dash/feature/flow/application/flow_manager.dart';
import 'package:smart_dash/feature/home/application/home_service.dart';
import 'package:smart_dash/feature/home/domain/home.dart';
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
      _subscription?.cancel();
      _flow.dispose();
    });
  }

  final Ref ref;
  late final PresenceFlow _flow;

  final _presence = StreamController<PresenceEvent>.broadcast();

  Optional<Presence> get state => _flow.state;
  Optional<PresenceEvent> get lastEvent => _flow.lastEvent;

  bool get isHome => _flow.isHome;
  bool get isAway => _flow.isAway;
  int get membersAtHome => _flow.membersAtHome;

  Stream<PresenceEvent> get events => _presence.stream;

  StreamSubscription<NetworkDeviceEvent>? _subscription;

  /// Start listing to network device events
  Future<void> bind() async {
    assert(
      _subscription == null,
      '$PresenceService is already bound to $NetworkInfoService',
    );

    _flow = PresenceFlow(ref);
    await _flow.init();

    final service = ref.read(networkInfoServiceProvider);
    await Future.wait(
      service.devices.asEvents.map(_onHandle),
    );
    _subscription = service.stream.listen(_onHandle);
  }

  /// Stop listing to network device events.
  void unbind() {
    _flow.dispose();
    _subscription?.cancel();
    _subscription = null;
  }

  Future<void> _onHandle(NetworkDeviceEvent event) {
    return guard(() async {
      await for (final e in _flow(event).whereType<PresenceEvent>()) {
        _presence.add(e);
      }
    });
  }
}

class PresenceFlow extends Flow {
  PresenceFlow(this.ref) : super('presence') {
    ref.onDispose(() {
      _subscription?.cancel();
    });
  }

  final Ref ref;

  StreamSubscription? _subscription;

  Optional<PresenceEvent> get lastEvent => _lastEvent;
  Optional<PresenceEvent> _lastEvent = const Optional.empty();

  Optional<Presence> get state =>
      Optional.ofNullable(_lastEvent.orElseNull?.state);

  Optional<Home> get home => _home;
  Optional<Home> _home = const Optional.empty();
  Optional<Token> get token =>
      Optional.ofNullable(_lastEvent.orElseNull?.token);

  bool get isHome => _lastEvent.isPresent ? state.value.isHome : false;
  bool get isAway => _lastEvent.isPresent ? state.value.isAway : false;
  int get membersAtHome =>
      _lastEvent.isPresent ? state.value.members.length : 0;

  Future<void> init() async {
    HomeService homeService = await _setHome();
    _subscription = homeService.events.listen((event) async {
      if (event is NewHomeEvent || event is CurrentHomeSetEvent) {
        final token = Presence.toHomeToken(event.home);
        _setState(token);
      }
    });
  }

  Future<HomeService> _setHome() async {
    final homeService = ref.read(homeServiceProvider);
    final next = await homeService.getCurrentHome();
    if (next.isPresent && next.value.name != _home.orElseNull?.name) {
      _home = next;
      final home = _home.value;
      final token = Presence.toHomeToken(home);
      await _setState(token);
    }
    return homeService;
  }

  Future<void> _setState(Token token) async {
    final repo = ref.read(presenceRepositoryProvider);
    final state = await repo.getOrAdd(token);
    _lastEvent = state.isPresent
        ? Optional.of(PresenceEvent(state.value))
        : const Optional.empty();
  }

  @override
  Stream<FlowEvent> evaluate(Object event) async* {
    if (when(event)) {
      if (event is NetworkDeviceEvent) {
        // TODO: Fix eager lookup of current home
        await _setHome();

        late MemberPresenceEvent member;
        switch (event.runtimeType) {
          case const (NetworkDeviceAdded):
            if (event.data.isAvailable) {
              yield member = MemberPresenceIsHome.from(event.data);
              _lastEvent = Optional.of(_add(member));
              yield _lastEvent.value;
            }
          case const (NetworkDeviceOnline):
            yield member = MemberPresenceIsHome.from(event.data);
            _lastEvent = Optional.of(_add(member));
            yield _lastEvent.value;
          case const (NetworkDeviceOffline):
            // TODO: Implement grace period before actually remove to reduce false positives
            yield member = MemberPresenceIsAway.from(event.data);
            _lastEvent = Optional.of(_remove(member));
            yield _lastEvent.value;
          case const (NetworkDeviceRemoved):
            yield member = MemberPresenceIsAway.from(event.data);
            _lastEvent = Optional.of(_remove(member));
            yield _lastEvent.value;
        }
      }
    }
  }

  PresenceEvent _add(MemberPresenceEvent e) {
    return PresenceEvent(Presence(
      token: token.value,
      when: e.when,
      isHome: true,
      members: {...state.value.members, e.token}.toList(),
    ));
  }

  PresenceEvent _remove(MemberPresenceEvent e) {
    final members = state.value.members.toList()..remove(e.token);
    return PresenceEvent(Presence(
      token: token.value,
      when: e.when,
      members: members,
      isHome: members.isNotEmpty,
    ));
  }

  @override
  bool when(Object event) {
    if (event is! NetworkDeviceEvent) {
      return false;
    }

    final info = event.data;
    final token = Presence.toMemberToken(info);
    if (!_home.isPresent) {
      return false;
    }

    return _home.value.members.any(
      (e) => e.key == token.name,
    );
  }

  Future<void> dispose() async {
    _subscription?.cancel();
    return;
  }
}

class PresenceEvent extends FlowEvent<int> {
  PresenceEvent(this.state)
      : super(state.token, state.members.length, state.when);

  final Presence state;
}

class MemberPresenceEvent extends FlowEvent<bool> {
  MemberPresenceEvent(super.token, super.isHome, super.when);
}

class MemberPresenceIsHome extends MemberPresenceEvent {
  MemberPresenceIsHome(Token token, DateTime when) : super(token, true, when);

  factory MemberPresenceIsHome.from(NetworkDeviceInfo data, [DateTime? when]) =>
      MemberPresenceIsHome(
        Presence.toMemberToken(data),
        when ?? data.aliveWhen ?? DateTime.now(),
      );
}

class MemberPresenceIsAway extends MemberPresenceEvent {
  MemberPresenceIsAway(Token token, DateTime when) : super(token, false, when);

  factory MemberPresenceIsAway.from(NetworkDeviceInfo data, [DateTime? when]) =>
      MemberPresenceIsAway(
        Presence.toMemberToken(data),
        when ?? data.aliveWhen ?? DateTime.now(),
      );
}

@Riverpod(keepAlive: true)
PresenceService presenceService(PresenceServiceRef ref) => PresenceService(ref);
