import 'package:git_search/src/services/api/helper/api_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'api_service_provider.g.dart';

@riverpod
ApiService apiService(ApiServiceRef ref) {
  // here we can get the token and inject it into the ApiService
  const token = '';
  return ApiService(token: token);
}
