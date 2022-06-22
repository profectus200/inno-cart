import 'package:innocart_front/domain/model/order.dart';

import '../../domain/repository/order_repository.dart';
import '../api/model/api_order.dart';
import '../api/service/order_service.dart';
import '../mapper/order_mapper.dart';

class OrderDataRepository extends OrderRepository {
  final OrderService _orderService;

  OrderDataRepository(this._orderService);

  @override
  Future<List<Order>> getOrderList() async {
    final list = await _orderService.getOrderList();
    List<Order> orderList = [];
    for (var element in list) {
      Order order = OrderMapper.fromApi(element);
      orderList.add(order);
    }
    return orderList;
  }

  @override
  Future<Order> getOrder(int id) async {
    ApiOrder apiOrder = await _orderService.getOrder(id);
    Order order = OrderMapper.fromApi(apiOrder);
    return order;
  }

  @override
  Future<int> addOrder(Order order) async {
    ApiOrder apiOrder = OrderMapper.toApi(order);
    Future<int> requestCode = _orderService.addOrder(apiOrder);
    return requestCode;
  }

  @override
  Future<int> deleteOrder(int id) async {
    Future<int> requestCode = _orderService.deleteOrder(id);
    return requestCode;
  }

  @override
  Future<List<Order>> getPersonalOrders() async {
    final list = await _orderService.getPersonalOrders();
    List<Order> orderList = [];
    for (var element in list) {
      Order order = OrderMapper.fromApi(element);
      orderList.add(order);
    }
    return orderList;
  }
}
