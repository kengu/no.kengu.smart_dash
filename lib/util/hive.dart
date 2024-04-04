import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';
import 'package:logging/logging.dart';
import 'package:universal_io/io.dart';

Future<BoxCollection> openCollection(String key, Set<String> boxNames) async {
  return BoxCollection.open(
    // TODO: Replace workaround for missing collection name separator leading to wrong collection path
    key,
    boxNames,
    key: Platform.isAndroid ? await getHiveCipher(key) : null,
  );
}

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
    Logger('$Hive').info('Created Cipher for Hive key $key');
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
