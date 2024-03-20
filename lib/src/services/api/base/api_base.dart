import 'package:git_search/src/global/constant/api.dart';
import 'package:http/http.dart' as http;

abstract class ApiServiceBase {
  Future<http.Response> get(String endpoint, {String? spcToken});
  Future<http.Response> post(String endpoint, Map<String, dynamic> body,
      {String? spcToken});
}

mixin class ApiGetways {
  String baseUrl = KApi.endpoint;
}
