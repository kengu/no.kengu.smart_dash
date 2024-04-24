import 'package:freezed_annotation/freezed_annotation.dart';

part 'sikom_property.freezed.dart';
part 'sikom_property.g.dart';

/// The [SikomProperty] class is a generic
/// representation of properties used by various
/// Sikom object entities.
@freezed
class SikomProperty with _$SikomProperty {
  const SikomProperty._();
  const factory SikomProperty({
    @JsonKey(name: 'Name') required String name,
    @JsonKey(name: 'Value') required String value,
    @JsonKey(name: 'Created') DateTime? created,
    @JsonKey(name: 'DeviceId') required int deviceId,
    @JsonKey(name: 'GatewayId') required int gatewayId,
    @JsonKey(name: 'CustomerId1') required int customerId1,
    @JsonKey(name: 'CustomerId2') required int customerId2,
  }) = _SikomProperty;

  factory SikomProperty.fromJson(Map<String, Object?> json) =>
      _$SikomPropertyFromJson(json);

  bool? toBool() => value == "1";

  int? toInt() => int.tryParse(value);

  double? toDouble() => double.tryParse(value);
}
