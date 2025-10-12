import '../../../../core/network/api_client.dart';

class AuthRemoteDataSource {
  final ApiClient apiClient;

  AuthRemoteDataSource(this.apiClient);

  Future<dynamic> login(Map<String, String> body) async {
    return apiClient.post('api/auth/login', body, false);
  }

  Future<dynamic> register(Map<String, String> body) async {
    return apiClient.post('api/auth/register', body, false);
  }
}