import '../../data/repository/order_data_repository.dart';
import '../../domain/repository/order_repository.dart';
import 'api_module.dart';

class OrderRepoModule {
  static final OrderRepository _orderRepository = OrderDataRepository(
    ApiModule.apiUtil(),
  );

  static OrderRepository orderRepository() {
    return _orderRepository;
  }
}
