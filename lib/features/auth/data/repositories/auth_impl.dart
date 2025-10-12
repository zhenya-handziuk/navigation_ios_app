import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../domain/repositories/auth.dart';

import '../datasources/auth.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();
  static const String _tokenKey = 'auth_token';

  const AuthRepositoryImpl(this._remoteDataSource);

  @override
  Future<bool> login(String username, String password) async {
    final response = await _remoteDataSource.login({
      'username': username,
      'password': password,
    });

    await _saveToken(response['accessToken']);

    return true;
  }

  @override
  Future<bool> register(String username, String password, String passwordConfirmation) async {
    // Implement token retrieval logic
    return true;
  }

  @override
  Future<String> getToken() async {
    final token = await _secureStorage.read(key: _tokenKey);

    if (token == null) {
      await login('admin', 'admin');
      return await _secureStorage.read(key: _tokenKey) ?? '';
    }

    return token;
  }

  @override
  Future<void> logout() async {
    await _clearToken();
  }

  Future<void> _saveToken(String token) async {
    await _secureStorage.write(key: _tokenKey, value: token);
  }

  Future<void> _clearToken() async {
    print('Clearing token from secure storage: ${await _secureStorage.read(key: _tokenKey)}');
    await _secureStorage.delete(key: _tokenKey);
  }
}