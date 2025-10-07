import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class InitRemoteDataSource {
  final http.Client client;

  InitRemoteDataSource(this.client);

  Future<bool> fetchData() async {
    final baseUrl = dotenv.env['BASE_URL'];
    final response = await client.get(Uri.parse('$baseUrl/api/health'));

    if (response.statusCode == 200) {
      // return response.body;
      final Map<String, dynamic> mappedData = jsonDecode(response.body);
      print(response.body.runtimeType);
      return mappedData['health'];
    } else {
      throw Exception('Failed to load data');
    }
  }
}