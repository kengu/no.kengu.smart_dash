import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_dash/feature/device/domain/device.dart';
import 'package:smart_dash/integration/sikom/domain/sikom_device.dart';
import 'package:smart_dash/integration/sikom/domain/sikom_property.dart';
import 'package:smart_dash/integration/sikom/sikom.dart';

part 'sikom_gateway.freezed.dart';
part 'sikom_gateway.g.dart';

/// The [SikomGateway] class is a representation of
/// a gateway between a group of Sikom devices and
/// Sikom API.
@freezed
class SikomGateway with _$SikomGateway, DeviceMapper {
  const SikomGateway._();
  const factory SikomGateway({
    @JsonKey(name: 'GatewayId') required int id,
    @JsonKey(name: 'Controller') required SikomGatewayController controller,
    @JsonKey(name: 'Properties') required SikomGatewayProperties properties,
  }) = _SikomGateway;

  /// Get gateway type
  SikomDeviceType get type => SikomDeviceType.fromNativeType(
        properties.gatewayType.value,
      );

  @override
  Device toDevice() => Device(
        id: '$id',
        type: type.to(),
        data: toJson(),
        capabilities: [],
        service: Sikom.key,
        lastUpdated: DateTime.now(),
        name: controller.properties.name,
      );

  factory SikomGateway.fromJson(Map<String, Object?> json) =>
      _$SikomGatewayFromJson(json);
}

/// The [SikomGatewayController] class is a
/// representation of a Sikom gateway controller.
@freezed
class SikomGatewayController with _$SikomGatewayController {
  const SikomGatewayController._();
  const factory SikomGatewayController({
    @JsonKey(name: 'Properties')
    required SikomGatewayControllerProperties properties,
  }) = _SikomGatewayController;

  factory SikomGatewayController.fromJson(Map<String, Object?> json) =>
      _$SikomGatewayControllerFromJson(json);
}

/// The [SikomGatewayProperties] class is a
/// representation of a Sikom gateway properties.
@freezed
class SikomGatewayProperties with _$SikomGatewayProperties {
  const SikomGatewayProperties._();
  const factory SikomGatewayProperties({
    @JsonKey(name: 'gateway_type') required SikomProperty gatewayType,
  }) = _SikomGatewayProperties;

  factory SikomGatewayProperties.fromJson(Map<String, Object?> json) =>
      _$SikomGatewayPropertiesFromJson(json);
}

/// The [SikomGatewayControllerProperties] class is a
/// representation of a Sikom gateway controller properties.
@freezed
class SikomGatewayControllerProperties with _$SikomGatewayControllerProperties {
  const SikomGatewayControllerProperties._();
  const factory SikomGatewayControllerProperties({
    @JsonKey(name: 'best_effort_name') required SikomProperty bestEffortName,
    @JsonKey(name: 'user_defined_name') SikomProperty? userDefinedName,
  }) = _SikomGatewayControllerProperties;

  /// Get human-readable gateway device name
  String get name => (userDefinedName ?? bestEffortName).value;

  factory SikomGatewayControllerProperties.fromJson(
          Map<String, Object?> json) =>
      _$SikomGatewayControllerPropertiesFromJson(json);
}
