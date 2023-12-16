import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_dash/feature/sikom/data/sikom_response_data.dart';

part 'sikom_response.freezed.dart';
part 'sikom_response.g.dart';

@freezed
class SikomResponse with _$SikomResponse {
  const SikomResponse._();
  const factory SikomResponse({
    @JsonKey(name: 'ContentEncoding') String? contentEncoding,
    @JsonKey(name: 'ContentType') String? contentType,
    @JsonKey(name: 'Data') required SikomResponseData data,
    @JsonKey(name: 'JsonRequestBehavior') required int jsonRequestBehavior,
    @JsonKey(name: 'MaxJsonLength') int? maxJsonLength,
    @JsonKey(name: 'RecursionLimit') int? recursionLimit,
  }) = _SikomResponse;

  /// Check if response [data] is a [device]
  bool get isDevice => data.device != null;

  /// Check if response [data] is a [bpapiArray]
  bool get isArray => data.bpapiArray != null;

  /// Check if response [data] is scalar result [scalarResult]
  bool get isScalar => data.scalarResult != null;

  factory SikomResponse.fromJson(Map<String, Object?> json) =>
      _$SikomResponseFromJson(json);
}
