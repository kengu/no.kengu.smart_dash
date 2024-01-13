import 'dart:typed_data';

import 'package:xml/xml.dart';
import 'package:xml/xpath.dart';

class FoscamResponse<T> {
  FoscamResponse({
    required this.type,
    this.data,
    Uint8List? bytes,
  })  : bytes = bytes ?? Uint8List.fromList([]),
        xml = data is String ? XmlDocument.parse(data) : XmlDocument();

  final T? data;
  final FoscamResultType type;
  final XmlDocument xml;
  final Uint8List bytes;

  static final NetParser parser = NetParser();

  T get(String name, T ifEmpty) {
    final value = switch (ifEmpty.runtimeType) {
      const (int) => getInt(name, ifEmpty as int),
      const (bool) => getBool(name, ifEmpty as bool),
      const (String) => parser.getElement(xml, name),
      _ => ifEmpty,
    };
    return (value ?? ifEmpty) as T;
  }

  bool getBool(String name, bool ifEmpty) {
    final value = parser.getElement(xml, name);
    final flag = int.tryParse(value);
    if (flag == 0) return false;
    if (flag == 1) return true;
    return bool.tryParse(value) ?? ifEmpty;
  }

  int getInt(String name, int ifEmpty) =>
      int.tryParse(parser.getElement(xml, name)) ?? ifEmpty;

  String set(String name, T value) => parser.setElement(xml, name, value);

  Map<String, String> toJson() {
    return Map.fromEntries(
      xml.rootElement.children
          .whereType<XmlElement>()
          .map((e) => MapEntry(e.name.local, e.innerText)),
    );
  }
}

class NetParser {
  NetParser();

  /// Get result from xml response
  FoscamResultType getResult(String? xml) {
    if (xml == null ||
        !xml.contains('<result>') ||
        !xml.contains('</result>')) {
      // All CGI responses must have result tags, so it's an invalid response
      return FoscamResultType.invalidResponse;
    } else if (xml.contains('<result>0</result>')) {
      return FoscamResultType.success;
    } else if (xml.contains('<result>-1</result>')) {
      return FoscamResultType.formatErr;
    } else if (xml.contains('<result>-2</result>')) {
      return FoscamResultType.credsErr;
    } else if (xml.contains('<result>-3</result>')) {
      return FoscamResultType.accessDenied;
    } else if (xml.contains('<result>-4</result>')) {
      return FoscamResultType.execFail;
    } else if (xml.contains('<result>-5</result>')) {
      return FoscamResultType.timeout;
    } else if (xml.contains('<result>-6</result>')) {
      return FoscamResultType.reserve1;
    } else if (xml.contains('<result>-7</result>')) {
      return FoscamResultType.unknownErr;
    } else if (xml.contains('<result>-8</result>')) {
      return FoscamResultType.reserve2;
    } else {
      return FoscamResultType.invalidResponse;
    }
  }

  /// Get value in specified tag
  String getElement(
    XmlDocument doc,
    String name, {
    String xpath = '/CGI_Result/',
  }) {
    final element = doc.xpath('$xpath$name').firstOrNull;
    return element?.innerText ?? '';
  }

  String setElement<T>(
    XmlDocument doc,
    String name,
    T value, {
    String xpath = '/CGI_Result/',
  }) {
    final element = doc.xpath('$xpath$name').firstOrNull;
    if (element != null) {
      element.innerText = value.toString();
    }
    return doc.toXmlString(pretty: true);
  }

  /*
  AccessPoint parseFromXML(String xml) {
    return AccessPoint(
      getTagValue(xml, 'ssid'),
      getTagValue(xml, 'mac'),
      int.tryParse(getTagValue(xml, 'quality')) ?? 0,
      getTagValue(xml, 'isEncrypt').toLowerCase() == 'true',
      AccessPoint.EncryptType.match(
          int.tryParse(getTagValue(xml, 'encryptType')) ?? 0),
    );
  }
   */
}

enum FoscamResultType {
  // ----- Foscam CGI results ----- //
  // Most descriptions are directly from the user guide

  /// Success
  success,

  /// CGI request string format error
  formatErr,

  /// Username or password error
  credsErr,

  /// Access denied
  accessDenied,

  /// CGI execute fail
  execFail,

  /// Timeout
  timeout,

  /// Unknown error
  unknownErr,

  /// Reserved value
  reserve1,

  /// Reserved value
  reserve2,

  // ----- Non-foscam results ----- //

  /// Everything went fine
  ok,

  /// Invalid address
  invalidAddress,

  /// Invalid response
  invalidResponse,
}

extension ResultExtension on FoscamResultType {
  int getValue() {
    return index;
  }
}
