import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:optional/optional.dart';

part 'integration.freezed.dart';
part 'integration.g.dart';

typedef IntegrationMap = Map<String, Integration>;

@freezed
class Integration with _$Integration {
  const factory Integration({
    required String key,
    required String name,
    required bool system,
    required String image,
    required bool enabled,
    required int instances,
    required String category,
    required String description,
    required IntegrationType type,
    required List<String> dependsOn,
    required List<IntegrationField> fields,
  }) = _Integration;

  factory Integration.fromJson(Map<String, Object?> json) =>
      _$IntegrationFromJson(json);
}

class IntegrationFields {
  /// Integration key
  static const String key = 'key';

  /// Integration type
  static const String type = 'type';

  /// Integration name
  static const String name = 'name';

  /// Integration image
  static const String image = 'image';

  /// Integration fields
  static const String fields = 'fields';

  /// Integration enabled
  static const String enabled = 'enabled';

  /// Integration category
  static const String category = 'category';

  /// Integration features
  static const String dependsOn = 'dependsOn';

  /// Maximum number of instances of this service
  static const String instances = 'instances';

  /// Integration description
  static const String description = 'description';
}

enum IntegrationField {
  id,
  host,
  port,
  username,
  password,
  topics,
}

enum IntegrationType {
  mqtt,
  device,
  location,
  camera,
  weather,
  snow;

  static Optional<IntegrationType> of(String name) {
    return values.firstWhereOptional((e) => e.name == name);
  }
}
