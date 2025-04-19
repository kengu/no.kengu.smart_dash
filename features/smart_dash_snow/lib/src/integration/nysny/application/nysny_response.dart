import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_dash_common/smart_dash_common.dart';
import 'package:smart_dash_snow/smart_dash_snow.dart';
import 'package:smart_dash_snow/src/integration/nysny/domain/nysny_state.dart';

part 'nysny_response.freezed.dart';
part 'nysny_response.g.dart';

@freezed
sealed class NySnyResponse with _$NySnyResponse {
  const NySnyResponse._();
  const factory NySnyResponse({
    @JsonKey(name: 'requestedby') required String requestedBy,
    @JsonKey(name: 'information') required String information,
    @JsonKey(name: 'sensors') required List<NySnySensor> sensors,
  }) = _NySnyResponse;

  factory NySnyResponse.fromData(Map<String, Object?> json) {
    // Fix broken json
    final List<JsonObject> sensors = [];
    final sensorId = json.remove('sensorid') as JsonObject;
    for (final it in sensorId.entries) {
      final items = it.value as List;
      sensors.add(
        {
          'id': it.key,
          'meta': items.first,
          'data': items.last,
        },
      );
    }
    return NySnyResponse.fromJson({
      ...json,
      'sensors': sensors,
    });
  }

  factory NySnyResponse.fromJson(Map<String, Object?> json) =>
      _$NySnyResponseFromJson(json);

  List<SnowState> toSnowStates() {
    return [];
  }
}
