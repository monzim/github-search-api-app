import 'package:freezed_annotation/freezed_annotation.dart';

part 'license.freezed.dart';
part 'license.g.dart';

@freezed
class License with _$License {
  const License._();

  const factory License({
    @JsonKey(name: 'key') String? key,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'spdx_id') String? spdxId,
    @JsonKey(name: 'url') String? url,
    @JsonKey(name: 'node_id') String? nodeId,
  }) = _License;

  factory License.fromJson(Map<String, Object?> json) =>
      _$LicenseFromJson(json);
}
