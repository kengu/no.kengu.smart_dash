import 'package:freezed_annotation/freezed_annotation.dart';

part 'driver_definition.freezed.dart';
part 'driver_definition.g.dart';

typedef DriverDefinitionMap = Map<String, DriverDefinition>;

@freezed
class DriverDefinition with _$DriverDefinition {
  const factory DriverDefinition({
    required String key,
    required String name,
    required String image,
    required int instances,
    required String category,
    required String description,
    required List<String> fields,
  }) = _DriverDefinition;

  factory DriverDefinition.fromJson(Map<String, Object?> json) =>
      _$DriverDefinitionFromJson(json);
}

class DriverDefinitionFields {
  static const String key = 'key';
  static const String name = 'name';
  static const String image = 'image';
  static const String fields = 'fields';
  static const String category = 'category';
  static const String instances = 'instances';
  static const String description = 'description';
}
