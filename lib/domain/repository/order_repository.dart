import 'package:innocart_front/domain/model/order.dart';

abstract class OrderRepository {
  Future<List<Order>> getOrderList();

  Future<Order> getOrder(int id);

  Future<int> addOrder(Order order);

  Future<int> deleteOrder(int id);
}
