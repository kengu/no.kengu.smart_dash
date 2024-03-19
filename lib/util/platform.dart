import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:nanoid/async.dart';
import 'package:universal_io/io.dart' as io;

class Platform {
  static final _deviceInfo = DeviceInfoPlugin();

  /// Check if running on a web platform (in a web browser)
  static bool get isWeb => kIsWeb;

  /// Check if running on a mobile platform (Android or iOS)
  static bool get isMobile =>
      !kIsWeb && (io.Platform.isAndroid || io.Platform.isIOS);

  /// Check if running on a desktop platform (Windows, Linux og MacOS)
  static bool get isDesktop =>
      !kIsWeb &&
      (io.Platform.isWindows || io.Platform.isLinux || io.Platform.isMacOS);

  static Future<String> get deviceId async {
    String? deviceId;
    // Unique identifier not supported by DeviceInfoPlugin on Web and Android
    // if (kIsWeb) {}
    // if (io.Platform.isAndroid) {}
    if (io.Platform.isIOS) {
      final info = await _deviceInfo.iosInfo;
      deviceId = info.identifierForVendor;
    }
    if (io.Platform.isMacOS) {
      final info = await _deviceInfo.macOsInfo;
      deviceId = info.systemGUID;
    }
    if (io.Platform.isWindows) {
      final info = await _deviceInfo.windowsInfo;
      deviceId = info.deviceId;
    }
    if (io.Platform.isLinux) {
      final info = await _deviceInfo.linuxInfo;
      deviceId = info.machineId;
    }
    // TODO: Persist random device id on unsupported platforms
    return deviceId ?? await nanoid();
  }
}
