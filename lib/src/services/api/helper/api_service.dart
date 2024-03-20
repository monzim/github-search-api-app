import 'package:git_search/src/services/api/base/api_base.dart';
import 'package:http/http.dart' as http;

class ApiService extends ApiServiceBase with ApiGetways {
  final String? token;
  ApiService({this.token});

  http.Client get client => http.Client();

  @override
  Future<http.Response> post(String? endpoint, Map<String, dynamic> body,
      {String? spcToken}) async {
    try {
      final response = await http.post(
        Uri.parse((endpoint == null || endpoint == '')
            ? baseUrl
            : '$baseUrl/$endpoint'),
        headers: {
          'Accept': 'application/json',
          /*
            Can be used to pass token to the server 
           */
          // 'Authorization': 'Bearer ${spcToken ?? token}',
        },
        body: body,
      );

      return response;
    } on Exception catch (e) {
      return http.Response(e.toString(), 500);
    }
  }

  @override
  Future<http.Response> get(String endpoint, {String? spcToken}) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/$endpoint'),
        headers: {
          'Accept': 'application/json',
          /*
            Can be used to pass token to the server 
           */
          // 'Authorization': 'Bearer ${spcToken ?? token}',
        },
      );

      return response;
    } on Exception catch (e) {
      return http.Response(e.toString(), 500);
    }
  }
}
