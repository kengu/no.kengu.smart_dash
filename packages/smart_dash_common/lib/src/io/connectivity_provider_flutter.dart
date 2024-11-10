import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'connectivity.dart';

part 'connectivity_provider_flutter.g.dart';

final InternetConnection _checker = InternetConnection.createInstance();

@Riverpod(keepAlive: true)
Connectivity connectivity(ConnectivityRef _) => Connectivity(
      () async => _toStatus(await _checker.internetStatus),
      changes: _checker.onStatusChange.map(_toStatus),
      checkInterval: _checker.checkInterval,
    );

ConnectivityStatus _toStatus(InternetStatus status) {
  return switch (status) {
    InternetStatus.connected => ConnectivityStatus.online,
    InternetStatus.disconnected => ConnectivityStatus.offline,
  };
}
