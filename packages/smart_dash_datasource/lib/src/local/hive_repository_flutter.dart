import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logging/logging.dart';
import 'package:smart_dash_datasource/smart_dash_datasource.dart';
import 'package:universal_io/io.dart';

class FlutterHiveCipherStorage extends HiveCipherStorage {
  static final storage = _build();

  @override
  Future<HiveCipher?> get(String key) async {
    // if key not exists return null
    final encryptionKeyString = await storage.read(key: key);
    if (encryptionKeyString == null) {
      final data = Hive.generateSecureKey();
      await storage.write(
        key: key,
        value: base64UrlEncode(data),
      );
      Logger('$Hive').info('Created Cipher for Hive key $key');
    }
    final data = await storage.read(key: key);
    if (data == null) {
      throw UnsupportedError('Unable to read from secure storage');
    }
    final encryptionKeyUint8List = base64Url.decode(data);
    return HiveAesCipher(encryptionKeyUint8List);
  }

  static FlutterSecureStorage _build() {
    if (Platform.isMacOS) {
      return const FlutterSecureStorage(
          mOptions: MacOsOptions(
        accessibility: KeychainAccessibility.first_unlock,
      ));
    }
    return const FlutterSecureStorage();
  }
}
