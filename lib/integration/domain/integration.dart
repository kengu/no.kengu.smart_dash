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
  static const String key = 'key';
  static const String name = 'name';
  static const String image = 'image';
  static const String fields = 'fields';
  static const String category = 'category';
  static const String features = 'features';
  static const String instances = 'instances';
  static const String description = 'description';
}

enum ServiceField {
  device,
  host,
  port,
  username,
  password,
}

enum IntegrationFeature {
  device,
  camera,
}
