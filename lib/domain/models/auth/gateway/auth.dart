abstract class AuthGateway {
  Future<bool> login(String email, String password);
  Future<void> signOut();
}
