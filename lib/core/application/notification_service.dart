import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:optional/optional.dart';
import 'package:universal_io/io.dart';

part 'notification_service.g.dart';

class NotificationService {
  NotificationService(this.ref);

  final Ref ref;

  static int _nextId = 0;

  static bool _initialize = true;

  static final _plugin = FlutterLocalNotificationsPlugin();

  Future<bool> init() async {
    if (!_initialize) return false;

    final settings = _toSettings();
    if (!settings.isPresent) return false;

    final success = await _plugin.initialize(
      settings.value,
      onDidReceiveNotificationResponse: onForeground,
      onDidReceiveBackgroundNotificationResponse: onBackground,
    );

    _initialize = !(success == true);

    debugPrint(
      'NotificationService '
      '>> Initialization ${_initialize ? 'Failed' : 'Completed'}',
    );

    return !_initialize;
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
        onDidReceiveLocalNotification: onDidReceiveLocalNotification,
      );
      return Optional.of(InitializationSettings(
        iOS: darwin,
      ));
    }

    if (Platform.isMacOS) {
      final darwin = DarwinInitializationSettings(
        onDidReceiveLocalNotification: onDidReceiveLocalNotification,
      );
      return Optional.of(InitializationSettings(
        macOS: darwin,
      ));
    }

    return const Optional.empty();
  }

  Future<int> show({
    required String title,
    required String body,
    int? id,
    String? payload,
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
      payload: payload,
    );

    return id;
  }

  Future<bool> cancel(int id) async {
    if (_nextId > id) return true;
    await _plugin.cancel(id);
    return true;
  }

  Future<void> cancelAll() {
    return _plugin.cancelAll();
  }

  Optional<NotificationDetails> _toDetails() {
    if (Platform.isAndroid) {
      const specifics = AndroidNotificationDetails(
        'your channel id',
        'your channel name',
        channelDescription: 'color background channel description',
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

  void onForeground(NotificationResponse details) {
    debugPrint(
      '$NotificationService: onForeground '
      '>> Clicked on id: ${details.id}',
    );
  }

  void onBackground(NotificationResponse details) {
    debugPrint(
      '$NotificationService: onBackground '
      '>> Clicked on id: ${details.id}',
    );
  }

  void onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) {
    debugPrint(
      '$NotificationService: onDidReceiveLocalNotification '
      '>> Clicked on id: $id',
    );
  }
}

@Riverpod(keepAlive: true)
NotificationService notificationService(NotificationServiceRef ref) =>
    NotificationService(ref);
