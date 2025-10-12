import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'dart:convert';

import '../../features/auth/domain/repositories/auth.dart';

class ApiClient {
  final http.Client client;
  final String baseUrl = dotenv.env['BASE_URL'] ?? '';

  ApiClient(this.client);

  Future<http.Response> get(String param) async {
    try {
      final url = Uri.parse('$baseUrl/$param');
      return await client.get(url);
    } catch (e) {
      print('Error in ApiClient GET request: $e');
      rethrow;
    }
  }

  Future<Map<String, dynamic>> post(String param, Object body, [bool needToken = true]) async {
    try {
      final headers = await _getAuthHeader(needToken);
      final url = Uri.parse('$baseUrl/$param');
      final response = await client.post(url, body: jsonEncode(body), headers: headers);
      return _prepareResponse(response.body);
    } catch (e) {
      print('Error in ApiClient POST request: $e');
      rethrow;
    }
  }

  Future<Map<String, String>> _getAuthHeader(bool needToken) async {
    if (!needToken) {
      return { 'Content-Type': 'application/json' };
    }
    
    final AuthRepository authRepository = GetIt.instance<AuthRepository>();
    final token = await authRepository.getToken();
    return {'Authorization': 'Bearer $token', 'Content-Type': 'application/json'};
  }

  Map<String, dynamic> _prepareResponse(String responseBody) {
    return jsonDecode(responseBody);
  }
}