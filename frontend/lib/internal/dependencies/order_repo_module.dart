import 'package:innocart_front/data/api/service/order_service.dart';

import '../../data/repository/order_data_repository.dart';
import '../../domain/repository/order_repository.dart';

class OrderRepoModule {
  static final OrderRepository _orderRepository =
      OrderDataRepository(OrderService());

  static OrderRepository orderRepository() {
    return _orderRepository;
  }
}
