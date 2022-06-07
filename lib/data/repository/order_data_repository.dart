import 'package:innocart_front/domain/model/order.dart';

import '../../domain/repository/order_repository.dart';
import '../api/api_util.dart';

class OrderDataRepository extends OrderRepository {
  late final ApiUtil _apiUtil;

  OrderDataRepository(this._apiUtil);

  @override
  Future<List<Order>> getOrderList() {
    return _apiUtil.getOrderList();
  }

  @override
  Future<Order> getOrder(int id) {
    return _apiUtil.getOrder(id);
  }

  @override
  Future<int> addOrder(Order order) {
    return _apiUtil.addOrder(order);
  }

  @override
  Future<int> deleteOrder(int id) {
    return _apiUtil.deleteOrder(id);
  }
}