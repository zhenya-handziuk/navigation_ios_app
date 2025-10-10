import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiClient {
  final http.Client client;

  ApiClient(this.client);

  Future<http.Response> get(String param) async {
    try {
      final baseUrl = dotenv.env['BASE_URL'];
      final url = Uri.parse('$baseUrl/$param');
      return await client.get(url);
    } catch (e) {
      print('Error in ApiClient GET request: $e');
      rethrow;
    }
  }
}