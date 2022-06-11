import 'package:innocart_front/data/api/service/auth_service.dart';
import 'package:innocart_front/data/api/service/token_storage.dart';

import '../../data/api/api_util.dart';
import '../../data/api/service/order_service.dart';

class ApiModule {
  static final ApiUtil _apiUtil = ApiUtil(OrderService(), AuthService(TokenStorage()));

  static ApiUtil apiUtil() {
    return _apiUtil;
  }
}