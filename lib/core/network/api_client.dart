import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiClient {
  final String baseUrl;

  ApiClient(this.baseUrl);

  Future<dynamic> postJson(String endpoint, {dynamic body}) async {
    final url = Uri.parse('$baseUrl/$endpoint');
    final response = await http.post(
      url,
      body: body != null ? jsonEncode(body) : null,
      headers: {'Content-Type': 'application/json'},
    );

    return jsonDecode(response.body);
  }

  Future<dynamic> postUrlEncode(String endpoint, {dynamic body}) async {
    final url = Uri.parse('$baseUrl/$endpoint');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: body,
      encoding: Encoding.getByName('utf-8'),
    );

    return jsonDecode(response.body);
  }
}
