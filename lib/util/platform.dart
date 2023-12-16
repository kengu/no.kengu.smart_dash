import 'package:flutter/foundation.dart';
import 'package:universal_io/io.dart' as io;

class Platform {
  /// Check if running on a web platform (in a web browser)
  static bool get isWeb => kIsWeb;

  /// Check if running on a mobile platform (Android or iOS)
  static bool get isMobile =>
      !kIsWeb && (io.Platform.isAndroid || io.Platform.isIOS);

  /// Check if running on a desktop platform (Windows, Linux og MacOS)
  static bool get isDesktop =>
      !kIsWeb &&
      (io.Platform.isWindows || io.Platform.isLinux || io.Platform.isMacOS);
}
