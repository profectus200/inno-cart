import '../../data/api/api_util.dart';
import '../../data/api/service/order_service.dart';

class ApiModule {
  static final ApiUtil _apiUtil = ApiUtil(OrderService());

  static ApiUtil apiUtil() {
    return _apiUtil;
  }
}