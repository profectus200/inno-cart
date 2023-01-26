import 'package:innocart_front/data/api/service/auth_service.dart';

import '../../data/repository/auth_data_repository.dart';
import '../../domain/repository/auth_repository.dart';

class AuthRepoModule {
  static final AuthRepository _authRepository =
      AuthDataRepository(AuthService());

  static AuthRepository authRepository() {
    return _authRepository;
  }
}
