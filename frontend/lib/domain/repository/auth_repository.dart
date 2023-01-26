abstract class AuthRepository {
  Future<int> attemptLogIn(String username, String password);

  Future<int> attemptSignUp(
      String email, String username, String alias, String password);
}
