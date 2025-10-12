import 'dart:convert';
import '../../../../core/network/api_client.dart';

class InitRemoteDataSource {
  final ApiClient apiClient;

  InitRemoteDataSource(this.apiClient);

  Future<bool> fetchData() async {
    final response = await apiClient.get('api/health');

    final Map<String, dynamic> mappedData = jsonDecode(response.body);
    return mappedData['health'];
  }

  Future<String> initRoadConnection(Map<String, dynamic> body) async {
    final response = await apiClient.post('api/trails/start', body);

    return response['trailId'];
  }
}