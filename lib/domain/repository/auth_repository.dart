abstract class AuthRepository {
  void attemptLogIn(String username, String password);

  Future<int> attemptSignUp(String username, String password);

  Future<bool> isStorageEmpty();
}