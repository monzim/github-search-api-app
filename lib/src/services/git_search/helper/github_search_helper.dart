import 'dart:convert';

import 'package:git_search/src/services/api/helper/api_service.dart';
import 'package:git_search/src/services/api/model/api_response.dart';
import 'package:git_search/src/services/api/provider/api_service_provider.dart';
import 'package:git_search/src/services/git_search/base/stripe_base.dart';
import 'package:git_search/src/services/git_search/model/enum.dart';
import 'package:git_search/src/services/git_search/model/github_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'github_search_helper.g.dart';

@riverpod
GithubSearchRepository githubSearchRepository(GithubSearchRepositoryRef ref) {
  final apiService = ref.read(apiServiceProvider);

  return GithubSearchRepository(apiService: apiService);
}

class GithubSearchRepository with GithubSearchEndpoints {
  final ApiService _http;

  GithubSearchRepository({
    required ApiService apiService,
  }) : _http = apiService;

  Future<(List<GithubRepository>, String? errorMessage)> search({
    required String query,
    int page = 1,
    int perPage = 10,
    Sort sort = Sort.stars,
    Order order = Order.desc,
  }) async {
    final response = await _http.get(
        '$searchEndpoint?q=$query&sort=${sort.value}&order=${order.value}&page=$page&per_page=$perPage');

    final json = jsonDecode(response.body);

    if (response.statusCode != 200) {
      final message = json['message'] as String;
      return (<GithubRepository>[], message);
    }

    final res = ApiResponse.fromJson(json);
    return (res.items, null);
  }
}
