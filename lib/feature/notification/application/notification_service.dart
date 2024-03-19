import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:optional/optional.dart';
import 'package:smart_dash/feature/notification/data/notification_repository.dart';
import 'package:smart_dash/feature/notification/domain/notification.dart';
import 'package:smart_dash/util/data/num.dart';
import 'package:universal_io/io.dart';

part 'notification_service.g.dart';

class NotificationService {
  NotificationService._(this.ref);

  factory NotificationService(Ref ref) {
    return _singleton ??= NotificationService._(ref);
  }

  final Ref ref;

  final Set<int> _activeIds = {};

  static NotificationService? _singleton;

  static bool _initialize = isPlatformSupported;

  static final _plugin = FlutterLocalNotificationsPlugin();

  static bool get isPlatformSupported =>
      !(Platform.isLinux || Platform.isFuchsia);

  final StreamController<int> _controller = StreamController.broadcast();

  int _nextId = 0;

  Timer? _timer;

  bool get isPlatformReady => !_initialize;

  Stream<int> get active => _controller.stream;

  int get activeCount {
    try {
      return _activeIds.length;
    } finally {
      getActive();
    }
  }

  bool isActive(int id) {
    getActive();
    return _activeIds.contains(id);
  }

  Future<bool> _initPlugin() async {
    if (!isPlatformSupported || isPlatformReady) return false;

    final settings = _toSettings();
    if (!settings.isPresent) return false;

    final success = await _plugin.initialize(
      settings.value,
      onDidReceiveNotificationResponse: _onForeground,
    );

    _initialize = !(success == true);

    if (!_initialize) {
      if (Platform.isAndroid || Platform.isIOS) {
        PermissionStatus status = await Permission.notification.status;
        if (!status.isGranted) {
          // The permission is not granted, request it.
          status = await Permission.notification.request();
        }
      }
    }

    if (isPlatformReady) {
      // Check periodically
      _timer ??= Timer.periodic(
        const Duration(seconds: 1),
        (_) => getActive(),
      );

      for (final active in await getActive()) {
        await _showInPlatform(active);
      }
    }

    debugPrint(
      'NotificationService '
      '>> Initialization '
      '${_initialize ? 'Failed' : 'Completed (${_activeIds.length} active)'}',
    );

    return isPlatformReady;
  }

  Future<List<NotificationModel>> getActive() async {
    if (_initialize) await _initPlugin();

    final currentIds = _activeIds.toSet();
    final repo = ref.read(notificationRepositoryProvider);

    final activeIds = <int>[];

    final changed = <NotificationModel>[];
    final active = await repo.where((e) => e.isActive);
    final storedIds = active.map((e) => e.id).toSet();

    if (isPlatformReady) {
      for (final it in await _plugin.getActiveNotifications()) {
        if (it.id != null) {
          activeIds.add(it.id!);
        }
      }

      for (final it in active) {
        if (!activeIds.contains(it.id)) {
          if (it.shown && it.isActive) {
            changed.add(it.copyWith(isAcked: true));
          } else {
            changed.add(it.copyWith(shown: true));
            // Show notifications raised on other
            unawaited(_showInPlatform(it));
          }
        }
      }

      // Synchronize stored and local notification state
      for (final id in activeIds) {
        if (!storedIds.contains(id)) {
          activeIds.remove(id);
          unawaited(_plugin.cancel(id));
        }
      }
    } else {
      activeIds.addAll(storedIds);
    }

    if (changed.isNotEmpty) {
      await repo.updateAll(changed);
    }

    _nextId = storedIds.max() + 1;
    _activeIds
      ..clear()
      ..addAll(activeIds);

    if (currentIds.length != _activeIds.length ||
        currentIds.any((e) => !_activeIds.contains(e))) {
      _notifyActiveCount();
    }

    return active;
  }

  Future<int> show({
    required String title,
    required String body,
    int? id,
  }) async {
    if (_initialize) await _initPlugin();

    id = id ?? (++_nextId);
    _activeIds.add(id);

    final repo = ref.read(notificationRepositoryProvider);
    final notification = NotificationModel(
      id: id,
      shown: true,
      title: title,
      body: body,
      isAcked: false,
      when: DateTime.now(),
    );

    await repo.updateAll([notification]);

    await _showInPlatform(notification);

    _notifyActiveCount();

    return id;
  }

  Future<void> _showInPlatform(NotificationModel model) async {
    if (isPlatformSupported) {
      final details = _toDetails();
      if (details.isPresent) {
        await _plugin.show(
          model.id,
          model.title,
          model.body,
          details.value,
        );
      }
    }
  }

  Future<bool> ack(int id) async {
    if (_initialize) await _initPlugin();
    if (isPlatformReady) {
      await _plugin.cancel(id);
    }
    return _ackAll([id]);
  }

  Future<void> ackAll() async {
    if (_initialize) await _initPlugin();
    try {
      final active = await getActive();
      if (isPlatformReady) {
        await _plugin.cancelAll();
      }
      await _ackAll(
        active.map((e) => e.id),
      );
      _activeIds.clear();
    } finally {
      _notifyActiveCount();
    }
  }

  void _notifyActiveCount() {
    _controller.add(_activeIds.length);
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
      _ackAll([details.id!]);
    }
  }

  void _onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) {
    debugPrint(
      '$NotificationService: _onDidReceiveLocalNotification '
      '>> Clicked on id: $id',
    );
    _ackAll([id]);
  }

  Future<bool> _ackAll(Iterable<int> ids) async {
    try {
      _activeIds.removeAll(ids);
      final repo = ref.read(notificationRepositoryProvider);
      await repo.ackAll(ids);
      return true;
    } finally {
      _notifyActiveCount();
    }
  }
}

@Riverpod(keepAlive: true)
NotificationService notificationService(NotificationServiceRef ref) =>
    NotificationService(ref);
