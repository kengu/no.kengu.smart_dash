import 'package:smart_dash_account/smart_dash_account.dart';

class SystemHealth {
  SystemHealth(this.states, this.connectionMode);
  final String connectionMode;
  final List<SystemHealthState> states;
}

class SystemHealthState {
  SystemHealthState({
    required this.key,
    required this.isOK,
    required this.when,
    required this.reason,
    required this.counter,
    required this.service,
    required this.connectionMode,
  });
  final bool isOK;
  final int counter;
  final String key;
  final DateTime when;
  final Object? reason;
  final Integration service;
  final String connectionMode;

  bool get isFailed => !isOK;
}
