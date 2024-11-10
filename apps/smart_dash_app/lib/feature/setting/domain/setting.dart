import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:optional/optional.dart';

part 'setting.freezed.dart';
part 'setting.g.dart';

@freezed
class Setting with _$Setting {
  const Setting._();

  const factory Setting({
    required String name,
    required Object value,
  }) = _Setting;

  factory Setting.fromJson(Map<String, Object?> json) =>
      _$SettingFromJson(json);

  int toInt() => int.parse(toString());
  bool toBool() => value == true;
  double toDouble() => double.parse(toString());

  @override
  String toString() => value.toString();

  static Setting of(SettingType e) => Setting(
        name: e.name,
        value: e.defaultValue,
      );
}

class SettingFields {
  static const String name = 'key';
  static const String value = 'value';
}

enum SettingType {
  darkMode(DarkMode.system),
  showSnackBar(true),
  enablePresence(false),
  connectionMode(ConnectionMode.auto),
  priceArea('NO1', ['NO1', 'NO2', 'NO3', 'NO4', 'NO5']);

  const SettingType(this.defaultValue, [this.options = const []]);

  final Object defaultValue;

  final List<Object> options;

  bool get isBool => defaultValue is bool;

  String toStringValue() => defaultValue.toString();

  static SettingType of(String name) {
    final found = SettingType.values.firstWhereOptional(
      (type) => type.name == name,
    );
    if (found.isPresent) {
      return found.value;
    }
    throw 'Unknown SettingType $name';
  }
}

class ConnectionMode {
  static const String auto = 'auto';
  static const String online = 'online';
  static const String offline = 'offline';
}

class DarkMode {
  static const String on = 'on';
  static const String off = 'off';
  static const String system = 'system';
}
