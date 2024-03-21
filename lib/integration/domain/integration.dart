import 'package:freezed_annotation/freezed_annotation.dart';

part 'integration.freezed.dart';
part 'integration.g.dart';

typedef IntegrationMap = Map<String, Integration>;

@freezed
class Integration with _$Integration {
  const factory Integration({
    required String key,
    required String name,
    required String image,
    required bool enabled,
    required int instances,
    required String category,
    required String description,
    required List<ServiceField> fields,
    required List<IntegrationFeature> features,
  }) = _Integration;

  factory Integration.fromJson(Map<String, Object?> json) =>
      _$IntegrationFromJson(json);
}

class IntegrationFields {
  /// Service key
  static const String key = 'key';

  /// Service name
  static const String name = 'name';

  /// Service image
  static const String image = 'image';

  /// Service fields
  static const String fields = 'fields';

  /// Service enabled
  static const String enabled = 'enabled';

  /// Service category
  static const String category = 'category';

  /// Service features
  static const String features = 'features';

  /// Maximum number of instances of this service
  static const String instances = 'instances';

  /// Service description
  static const String description = 'description';
}

enum ServiceField {
  device,
  host,
  port,
  username,
  password,
  topics,
}

enum IntegrationFeature {
  data,
  device,
  camera,
  snow,
}
