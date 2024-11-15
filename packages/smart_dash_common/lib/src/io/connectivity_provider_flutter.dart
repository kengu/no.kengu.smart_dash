import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'connectivity.dart';

part 'connectivity_provider_flutter.g.dart';

final InternetConnection _checker = InternetConnection.createInstance();

@Riverpod(keepAlive: true)
Connectivity connectivity(ConnectivityRef _) {
  return Connectivity(
    _check,
    changes: _checker.onStatusChange.map(_toStatus),
    checkInterval: _checker.checkInterval,
  );
}

Future<ConnectivityStatus> _check() async {
  return _toStatus(await _checker.internetStatus);
}

ConnectivityStatus _toStatus(InternetStatus status) {
  return switch (status) {
    InternetStatus.connected => ConnectivityStatus.online,
    InternetStatus.disconnected => ConnectivityStatus.offline,
  };
}
