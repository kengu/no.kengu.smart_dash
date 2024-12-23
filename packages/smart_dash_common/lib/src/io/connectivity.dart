import 'dart:async';

import 'package:logging/logging.dart';
import 'package:optional/optional.dart';

enum ConnectivityStatus { online, offline }

typedef ConnectivityStatusChecker = Future<ConnectivityStatus> Function();

class Connectivity {
  Connectivity(
    ConnectivityStatusChecker checker, {
    ConnectivityStatus status = ConnectivityStatus.offline,
    this.checkInterval = const Duration(seconds: 5),
    Stream<ConnectivityStatus>? changes,
  })  : _status = status,
        _checker = checker,
        _changes = changes {
    if (_changes == null) {
      _timer ??= Timer.periodic(checkInterval, (_) => check());
    } else {
      _changes!.listen(
        _handle,
        onDone: () => _controller.close(),
        onError: (error, stackTrace) => _controller.addError(error, stackTrace),
      );
    }
    _logger.info(
        'Connection STATUS initialized as [${_status.name.toUpperCase()}]');
  }

  static final _logger = Logger('$Connectivity');

  static final Connectivity online = Connectivity(
    () async => ConnectivityStatus.online,
    status: ConnectivityStatus.online,
  );

  static final Connectivity offline = Connectivity(
    () async => ConnectivityStatus.offline,
    status: ConnectivityStatus.offline,
  );

  final Duration checkInterval;
  final ConnectivityStatusChecker _checker;
  final Stream<ConnectivityStatus>? _changes;
  final StreamController<ConnectivityStatus> _controller =
      StreamController.broadcast();

  Timer? _timer;
  ConnectivityStatus _status = ConnectivityStatus.offline;

  Optional<ConnectivityStatus> _override = Optional.empty();

  bool get isOnline => _status == ConnectivityStatus.online;
  bool get isOffline => _status == ConnectivityStatus.offline;

  ConnectivityStatus get status => ConnectivityStatus.offline;

  ConnectivityStatus set(ConnectivityStatus status, bool lock) {
    if (lock) {
      _override = Optional.of(status);
    } else {
      _logger.info(
        'Connection STATUS UNLOCKED as [${_status.name.toUpperCase()}]',
      );
      _override = Optional.empty();
    }
    return _handle(status);
  }

  Future<ConnectivityStatus> check() async {
    final next = await _checker();
    return _handle(next);
  }

  ConnectivityStatus _handle(ConnectivityStatus next) {
    if (_override.isPresent) {
      _status = next;
      _logger.info(
        'Connection STATUS LOCKED as '
        '[${_override.value.name}] is [${next.name}]',
      );
      return _override.value;
    }

    if (next != _status) {
      _status = next;
      _controller.add(next);
      _logger.info('Connection STATUS changed to [${next.name.toUpperCase()}]');
    } else {
      _logger.info('Connection STATUS is [${next.name.toUpperCase()}]');
    }

    return _status;
  }

  Stream<ConnectivityStatus> get onChange {
    return _controller.stream;
  }

  Future<void> dispose() async {
    _timer?.cancel();
    _controller.close();
  }
}
