import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RestorationWebPlugin {
  static const String childrenMapKey = 'c';
  static const String valuesMapKey = 'v';

  static void registerWith(Registrar registrar) {
    final MethodChannel channel = MethodChannel(
        'flutter/restoration', const StandardMethodCodec(), registrar);
    final RestorationWebPlugin instance = RestorationWebPlugin();
    channel.setMethodCallHandler(instance.handleMethodCall);
  }

  Future<dynamic> handleMethodCall(MethodCall call) async {
    switch (call.method) {
      case 'get':
        final prefs = await SharedPreferences.getInstance();
        final json = prefs.getString('restoration:data');
        final ByteData? encoded = const StandardMessageCodec()
            .encodeMessage(json != null ? jsonDecode(json) : null);
        return <dynamic, dynamic>{
          'enabled': true,
          'data': encoded?.buffer.asUint8List(
            encoded.offsetInBytes,
            encoded.lengthInBytes,
          ),
        };
      case 'put':
        final prefs = await SharedPreferences.getInstance();
        final data = call.arguments as Uint8List;
        final Object? decoded =
            const StandardMessageCodec().decodeMessage(data.buffer.asByteData(
          data.offsetInBytes,
          data.lengthInBytes,
        ));
        final json = jsonEncode(decoded);
        try {
          await prefs.setString('restoration:data', json);
          return null;
        } catch (e) {
          throw PlatformException(
            message: e.toString(),
            code: 'Unknown',
            details: "Failed to write 'restoration:data' to shared_preferences",
          );
        }
      default:
        throw PlatformException(
          code: 'Unimplemented',
          details: "The restoration_web_plugin plugin for "
              "web doesn't implement "
              "the method '${call.method}'",
        );
    }
  }
}
