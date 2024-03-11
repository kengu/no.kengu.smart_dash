import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:optional/optional.dart';
import 'package:smart_dash/feature/notification/domain/notification.dart';
import 'package:smart_dash/util/data/num.dart';
import 'package:universal_io/io.dart';

part 'notification_service.g.dart';

class NotificationService {
  NotificationService._();

  factory NotificationService() {
    return _singleton ??= NotificationService._();
  }

  final Set<int> _active = {};

  static NotificationService? _singleton;

  static bool _initialize = isPlatformSupported;

  static final _plugin = FlutterLocalNotificationsPlugin();

  static bool get isPlatformSupported =>
      !(Platform.isLinux || Platform.isFuchsia);

  final StreamController<int> _controller = StreamController.broadcast();

  int _nextId = 0;

  Timer? _timer;

  Stream<int> get active => _controller.stream;

  int get activeCount {
    try {
      return _active.length;
    } finally {
      getActive();
    }
  }

  bool isActive(int id) {
    getActive();
    return _active.contains(id);
  }

  Future<bool> init() async {
    if (!_initialize) return false;

    final settings = _toSettings();
    if (!settings.isPresent) return false;

    final success = await _plugin.initialize(
      settings.value,
      onDidReceiveNotificationResponse: _onForeground,
      onDidReceiveBackgroundNotificationResponse: _onBackground,
    );

    _initialize = !(success == true);

    if (!_initialize) {
      // Check periodically
      _timer ??= Timer.periodic(
        const Duration(seconds: 1),
        (_) => getActive(),
      );
    }

    debugPrint(
      'NotificationService '
      '>> Initialization '
      '${_initialize ? 'Failed' : 'Completed (${_active.length} active)'}',
    );

    return !_initialize;
  }

  Future<List<ActiveNotificationDetails>> getActive() async {
    if (!isPlatformSupported || _initialize && !await init()) {
      return const [];
    }

    final current = _active.toSet();
    _active.clear();

    final active = <ActiveNotificationDetails>[];
    for (final it in await _plugin.getActiveNotifications()) {
      if (it.id != null) {
        _active.add(it.id!);
        active.add(ActiveNotificationDetails(
          id: it.id!,
          body: it.body ?? '',
          title: it.title ?? '',
        ));
      }
    }

    _nextId = _active.max() + 1;

    if (current.length != _active.length ||
        current.any((e) => !_active.contains(e))) {
      _notifyActiveCount();
    }

    return active;
  }

  Future<int> show({
    required String title,
    required String body,
    int? id,
  }) async {
    if (_initialize && !await init()) return -1;

    final details = _toDetails();
    if (!details.isPresent) return -1;

    id = id ?? (++_nextId);
    await _plugin.show(
      id,
      title,
      body,
      details.value,
    );
    _active.add(id);
    _notifyActiveCount();

    return id;
  }

  Future<bool> cancel(int id) async {
    await _plugin.cancel(id);
    return _remove(id);
  }

  Future<void> cancelAll() {
    _active.clear();
    _notifyActiveCount();
    return _plugin.cancelAll();
  }

  void _notifyActiveCount() {
    _controller.add(_active.length);
  }

  Optional<InitializationSettings> _toSettings() {
    if (Platform.isAndroid) {
      const android = AndroidInitializationSettings('ic_launcher');
      return Optional.of(const InitializationSettings(
        android: android,
      ));
    }

    if (Platform.isIOS) {
      final darwin = DarwinInitializationSettings(
        onDidReceiveLocalNotification: _onDidReceiveLocalNotification,
      );
      return Optional.of(InitializationSettings(
        iOS: darwin,
      ));
    }

    if (Platform.isMacOS) {
      final darwin = DarwinInitializationSettings(
        onDidReceiveLocalNotification: _onDidReceiveLocalNotification,
      );
      return Optional.of(InitializationSettings(
        macOS: darwin,
      ));
    }

    return const Optional.empty();
  }

  Optional<NotificationDetails> _toDetails() {
    if (Platform.isAndroid) {
      const specifics = AndroidNotificationDetails(
        'smart_dash_1',
        'Smart Dash',
        channelDescription: 'Smart Dash Notification Channel',
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker',
        color: Colors.blue,
        colorized: true,
      );
      return Optional.of(const NotificationDetails(android: specifics));
    }

    // About iOS/MacOS notification settings
    // * presentSound: a notification sounds is played.
    // * presentList: remains in Notification Center for 7d
    // * presentAlert: stay on the screen until you dismiss them
    // * presentBanner: appear on the screen and disappear after a while
    // * presentBadge: show the number of notifications on its icon in the Dock
    //
    // Why isn't notification shown on MacOS each time it is raised?
    // >> The user probably is on focus mode, which throttles display to screen
    // << Add SmartDash to apps that are allowed to show in focus mode

    if (Platform.isIOS) {
      const specifics = DarwinNotificationDetails(
        presentList: false,
        presentBanner: true,
        presentBadge: false,
        presentAlert: false,
        presentSound: false,
      );
      return Optional.of(const NotificationDetails(iOS: specifics));
    }

    if (Platform.isMacOS) {
      const specifics = DarwinNotificationDetails(
        presentList: false,
        presentBanner: true,
        presentBadge: false,
        presentAlert: false,
        presentSound: false,
      );
      return Optional.of(const NotificationDetails(macOS: specifics));
    }

    return const Optional.empty();
  }

  void _onForeground(NotificationResponse details) {
    debugPrint(
      '$NotificationService: _onForeground '
      '>> Clicked on id: ${details.id}',
    );
    if (details.id != null) {
      _remove(details.id!);
    }
  }

  void _onBackground(NotificationResponse details) {
    debugPrint(
      '$NotificationService: _onBackground '
      '>> Clicked on id: ${details.id}',
    );
    if (details.id != null) {
      _remove(details.id!);
    }
  }

  void _onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) {
    debugPrint(
      '$NotificationService: _onDidReceiveLocalNotification '
      '>> Clicked on id: $id',
    );
    _remove(id);
  }

  bool _remove(int id) {
    try {
      return _active.remove(id);
    } finally {
      _notifyActiveCount();
    }
  }
}

@Riverpod(keepAlive: true)
NotificationService notificationService(NotificationServiceRef ref) =>
    NotificationService();
