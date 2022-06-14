import 'package:innocart_front/data/api/api_util.dart';
import 'package:innocart_front/data/api/service/auth_service.dart';
import 'package:innocart_front/data/api/service/token_storage.dart';
import 'package:innocart_front/domain/repository/auth_repository.dart';

class AuthDataRepository extends AuthRepository{
  late final ApiUtil _apiUtil;

  AuthDataRepository(this._apiUtil);

  @override
  Future<int> attemptLogIn(String username, String password) async {
    return _apiUtil.attemptLogIn(username, password);
  }

  @override
  Future<int> attemptSignUp(String email, String username, String password) async {
    return _apiUtil.attemptSignUp(email, username, password);
  }

  @override
  Future<bool> isStorageEmpty() async {
    return _apiUtil.isStorageEmpty();
  }
}