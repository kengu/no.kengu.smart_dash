import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_dash_app/integration/sikom/domain/sikom_device.dart';
import 'package:smart_dash_app/integration/sikom/domain/sikom_gateway.dart';

part 'sikom_response_data.freezed.dart';
part 'sikom_response_data.g.dart';

@freezed
class SikomResponseData with _$SikomResponseData {
  const SikomResponseData._();
  const factory SikomResponseData({
    @JsonKey(name: 'bpapi_status') required String bpapiStatus,
    @JsonKey(name: 'bpapi_message') required String bpapiMessage,
    @JsonKey(name: 'bpapi_array')
    List<SikomResponseDataArrayObject>? bpapiArray,
    List<Object>? result,
    @JsonKey(name: 'scalar_result') Object? scalarResult,
    @JsonKey(name: 'device') SikomDevice? device,
  }) = _SikomResponseData;

  /// Check if response is a [device]
  bool get isDevice => device != null;

  /// Check if response is a [bpapiArray]
  bool get isArray => bpapiArray != null;

  /// Check if response is scalar result [scalarResult]
  bool get isScalar => scalarResult != null;

  factory SikomResponseData.fromJson(Map<String, Object?> json) =>
      _$SikomResponseDataFromJson(json);
}

@freezed
class SikomResponseDataArrayObject with _$SikomResponseDataArrayObject {
  const factory SikomResponseDataArrayObject({
    @JsonKey(name: 'gateway') SikomGateway? gateway,
    @JsonKey(name: 'device') SikomDevice? device,
  }) = _SikomResponseDataArrayObject;

  factory SikomResponseDataArrayObject.fromJson(Map<String, Object?> json) =>
      _$SikomResponseDataArrayObjectFromJson(json);
}
