import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_dash_app/feature/system/domain/connectivity.dart';

part 'connectivity_service.g.dart';

class ConnectivityService {
  ConnectivityService(this.ref) {
    ref.onDispose(() {
      _controller.close();
    });
  }

  final Ref ref;

  final _states = <String, ConnectivityState>{};

  final _log = Logger('$ConnectivityService');

  final _controller = StreamController<ConnectivityState>.broadcast();

  Stream<ConnectivityState> get events => _controller.stream;

  bool get isOK => _states.values.every((state) => state.isOK);

  int get failCount => _states.values.where((state) => state.isFailed).length;

  List<ConnectivityState> getStates() => _states.values.toList();

  void setOK(String key) => set(key, true);
  void setFailed(String key, Object reason) => set(
        key,
        false,
        reason,
      );

  void set(String key, bool isOK, [Object? reason]) {
    final prev = _states[key];
    final state = ConnectivityState(
      key: key,
      isOK: isOK,
      reason: reason,
      when: DateTime.now(),
      counter: (prev?.counter ?? 0) + 1,
    );
    _states[key] = state;
    _controller.add(state);
    _log.fine(
      'Connection for [$key] ${isOK ? 'is OK' : 'has FAILED'}',
    );
  }
}

@Riverpod(keepAlive: true)
ConnectivityService connectivityService(ConnectivityServiceRef ref) =>
    ConnectivityService(ref);
