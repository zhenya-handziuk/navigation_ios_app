abstract class AuthRepository {
  Future<bool> login(String username, String password);
  Future<void> logout();
  Future<bool> register(String username, String password, String passwordConfirmation);
  Future<String> getToken();
}
