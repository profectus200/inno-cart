import 'package:innocart_front/data/api/service/auth_service.dart';
import 'package:innocart_front/domain/repository/auth_repository.dart';

class AuthDataRepository extends AuthRepository {
  final AuthService _authService;

  AuthDataRepository(this._authService);

  @override
  Future<int> attemptLogIn(String username, String password) async {
    return _authService.attemptLogIn(username, password);
  }

  @override
  Future<int> attemptSignUp(
      String email, String username, String password) async {
    return _authService.attemptSignUp(email, username, password);
  }

  @override
  Future<bool> isStorageEmpty() async {
    return _authService.isStorageEmpty();
  }
}
