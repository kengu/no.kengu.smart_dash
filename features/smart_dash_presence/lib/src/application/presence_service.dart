import 'dart:async';

import 'package:logging/logging.dart';
import 'package:optional/optional.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash_account/smart_dash_account_app.dart';
import 'package:smart_dash_flow/smart_dash_flow.dart';
import 'package:smart_dash_presence/smart_dash_presence.dart';
import 'package:stream_transform/stream_transform.dart';

part 'presence_service.g.dart';

class PresenceService {
  static const String key = 'presence';

  PresenceService(this.ref) {
    ref.onDispose(() {
      stop();
      _subscription?.cancel();
      _flow.dispose();
    });
  }

  final Ref ref;
  late final PresenceFlow _flow;

  final _log = Logger('$PresenceService');

  final _presence = StreamController<PresenceEvent>.broadcast();

  Optional<Presence> get state => _flow.state;
  Optional<PresenceEvent> get lastEvent => _flow.lastEvent;

  bool get isHome => _flow.isHome;
  bool get isAway => _flow.isAway;

  Stream<PresenceEvent> get events => _presence.stream;

  List<HomeMember> get membersAway => _flow.membersAway;
  List<HomeMember> get membersAtHome => _flow.membersAtHome;

  StreamSubscription<NetworkDeviceEvent>? _subscription;

  bool get isStarted => _subscription != null;

  /// Start listing to network device events
  Future<void> start() async {
    assert(
      !isStarted,
      '$PresenceService is already started',
    );

    _flow = PresenceFlow(ref);
    await _flow.build();

    final service = ref.read(networkInfoServiceProvider);
    if (service.isEnabled) {
      // Update current presence from current devices
      await Future.wait(
        service.devices.asEvents.map(_onHandle),
      );
    } else {
      _log.warning(
        '$NetworkInfoService is not started. '
        'Presence detection will not start until it is!',
      );
    }

    _subscription = service.events.listen(
      _onHandle,
      cancelOnError: false,
    );
  }

  /// Stop listing to network device events.
  void stop() {
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
  PresenceFlow(this.ref) : super(PresenceService.key) {
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
      Optional.ofNullable(_lastEvent.orElseNull?.state.token);

  List<HomeMember> get membersAway {
    if (!_home.isPresent) {
      return [];
    }
    return _lastEvent.isPresent
        ? _lastEvent.value.membersAway
        : _home.value.members;
  }

  List<HomeMember> get membersAtHome {
    if (!_home.isPresent || _lastEvent.isPresent) {
      return [];
    }
    return _lastEvent.value.membersAtHome;
  }

  bool get isAway => _lastEvent.isPresent ? state.value.isAway : false;
  bool get isHome => _lastEvent.isPresent ? state.value.isHome : false;

  Future<void> build() async {
    AccountService service = await _setCurrentHome();
    _subscription = service.changes.whereType<HomeEvent>().listen(
      (event) async {
        if (event is NewHomeEvent || event is CurrentHomeSetEvent) {
          final token = Presence.toHomeToken(event.home);
          _setState(token);
        }
      },
      cancelOnError: false,
    );
  }

  Future<AccountService> _setCurrentHome() async {
    final accountService = ref.read(accountServiceProvider);
    final next = await accountService.getCurrentHome();
    if (next.isPresent && next.value.id != _home.orElseNull?.id) {
      _home = next;
      final home = _home.value;
      final token = Presence.toHomeToken(home);
      await _setState(token);
    }
    return accountService;
  }

  Future<void> _setState(Token token) async {
    final repo = ref.read(presenceRepositoryProvider);
    final state = await repo.put(token);
    _lastEvent = state.isPresent
        ? Optional.of(
            PresenceEvent(
              _home.value,
              state.value,
            ),
          )
        : const Optional.empty();
  }

  @override
  Stream<FlowEvent> evaluate(Object event) async* {
    if (when(event)) {
      if (event is NetworkDeviceEvent) {
        // TODO: Fix eager lookup of current home
        await _setCurrentHome();

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
    return PresenceEvent(
      _home.value,
      Presence(
        token: token.value,
        when: e.when,
        isHome: true,
        members: {...state.value.members, e.token}.toList(),
      ),
    );
  }

  PresenceEvent _remove(MemberPresenceEvent e) {
    final members = state.value.members.toList()..remove(e.token);
    return PresenceEvent(
      _home.value,
      Presence(
        token: token.value,
        when: e.when,
        members: members,
        isHome: members.isNotEmpty,
      ),
    );
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

class PresenceEvent extends FlowEvent {
  PresenceEvent(this.home, this.state)
      : super(
          flow: PresenceService.key,
          tags: [
            Tag<int>(
              when: state.when,
              token: state.token,
              data: state.members.length,
            )
          ],
        );

  final Home home;
  final Presence state;

  List<HomeMember> get membersAway {
    final members = membersAtHome.map((e) => e.name);
    return home.members.where((e) => members.contains(e.key)).toList();
  }

  List<HomeMember> get membersAtHome {
    final members = state.members;
    return members.map(Presence.homeMemberFromToken).toList();
  }
}

class MemberPresenceEvent extends FlowEvent {
  MemberPresenceEvent(Token token, bool isHome, DateTime when)
      : super(
          flow: PresenceService.key,
          tags: [
            Tag<bool>(
              when: when,
              data: isHome,
              token: token,
            )
          ],
          when: when,
        );

  bool get isHome => tags.first.data;
  Token get token => tags.first.token;
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
