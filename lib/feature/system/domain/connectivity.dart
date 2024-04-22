class ConnectivityState {
  ConnectivityState({
    required this.key,
    required this.isOK,
    required this.when,
    required this.reason,
    required this.counter,
  });
  final bool isOK;
  final int counter;
  final String key;
  final DateTime when;
  final Object? reason;

  bool get isFailed => !isOK;
}
