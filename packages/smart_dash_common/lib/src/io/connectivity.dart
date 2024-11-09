import 'dart:async';

enum ConnectivityStatus { online, offline }

typedef ConnectivityStatusChecker = Future<ConnectivityStatus> Function();

class Connectivity {
  Connectivity(
    ConnectivityStatusChecker checker, {
    this.checkInterval = const Duration(seconds: 5),
    Stream<ConnectivityStatus>? changes,
  })  : _checker = checker,
        _changes = changes {
    if (_changes == null) {
      _timer ??= Timer.periodic(checkInterval, (_) => check());
    } else {
      _changes!.listen(
        _controller.add,
        onDone: () => _controller.close(),
        onError: (error, stackTrace) => _controller.addError(error, stackTrace),
      );
    }
  }

  static final Connectivity online =
      Connectivity(() async => ConnectivityStatus.online);

  static final Connectivity offline =
      Connectivity(() async => ConnectivityStatus.offline);

  final Duration checkInterval;
  final ConnectivityStatusChecker _checker;
  final Stream<ConnectivityStatus>? _changes;
  final StreamController<ConnectivityStatus> _controller =
      StreamController.broadcast();

  Timer? _timer;
  ConnectivityStatus _status = ConnectivityStatus.offline;

  bool get isOnline => _status == ConnectivityStatus.online;
  bool get isOffline => _status == ConnectivityStatus.offline;

  ConnectivityStatus get status => ConnectivityStatus.offline;

  Future<ConnectivityStatus> check() async {
    final next = await _checker();
    if (next != _status) {
      _status = next;
      _controller.add(next);
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
