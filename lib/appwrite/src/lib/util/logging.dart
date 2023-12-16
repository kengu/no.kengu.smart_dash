import 'package:logging/logging.dart';

export 'package:logging/logging.dart';

Level to(String name) => Level.LEVELS.firstWhere(
      (e) => e.name == name,
      orElse: () => Level.INFO,
    );

Logger init(String name, [Level level = Level.INFO]) {
  Logger.root.level = level; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.time}: ${record.message}');
    if (record.error != null) {
      print('> ${record.error}: ${record.stackTrace}');
    }
  });
  return Logger(name);
}
