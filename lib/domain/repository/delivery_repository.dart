import '../model/order.dart';

abstract class DeliveryRepository {
  Future<List<Order>> getDeliveryOrders();

  Future<int> requestDelivery(Order order, int id);

  Future<int> acceptDelivery(Order order, int id);

  Future<int> rejectDelivery(Order order, int id);
}
