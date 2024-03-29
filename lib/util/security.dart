import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';
import 'package:universal_io/io.dart';

Future<HiveCipher> getHiveCipher(String key) async {
  final storage = _get();
  // if key not exists return null
  final encryptionKeyString = await storage.read(key: key);
  if (encryptionKeyString == null) {
    final data = Hive.generateSecureKey();
    await storage.write(
      key: key,
      value: base64UrlEncode(data),
    );
    debugPrint('Created Cipher for Hive key $key');
  }
  final data = await storage.read(key: key);
  if (data == null) {
    throw UnsupportedError('Unable to read from secure storage');
  }
  final encryptionKeyUint8List = base64Url.decode(data);
  return HiveAesCipher(encryptionKeyUint8List);
}

FlutterSecureStorage _get() {
  if (Platform.isMacOS) {
    return const FlutterSecureStorage(
        mOptions: MacOsOptions(
      accessibility: KeychainAccessibility.first_unlock,
    ));
  }
  return const FlutterSecureStorage();
}
