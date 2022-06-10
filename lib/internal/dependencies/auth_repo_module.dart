import '../../data/repository/auth_data_repository.dart';
import '../../domain/repository/auth_repository.dart';
import 'api_module.dart';

class AuthRepoModule {
  static final AuthRepository _authRepository = AuthDataRepository(
    ApiModule.apiUtil(),
  );

  static AuthRepository authRepository() {
    return _authRepository;
  }
}