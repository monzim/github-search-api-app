import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:git_search/src/services/git_search/model/github_repository.dart';

part 'api_response.freezed.dart';
part 'api_response.g.dart';

@immutable
class ApiResponseField {
  static const String totalCount = 'total_count';
  static const String incompleteResults = 'incomplete_results';
  static const String items = 'items';
}

@freezed
class ApiResponse with _$ApiResponse {
  const ApiResponse._();

  const factory ApiResponse({
    @JsonKey(name: ApiResponseField.totalCount) required int totalCount,
    @JsonKey(name: ApiResponseField.incompleteResults)
    required bool incompleteResults,
    @JsonKey(name: ApiResponseField.items)
    required List<GithubRepository> items,
  }) = _ApiResponse;

  factory ApiResponse.fromJson(Map<String, Object?> json) =>
      _$ApiResponseFromJson(json);
}
