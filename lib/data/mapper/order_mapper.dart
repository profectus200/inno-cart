import '../../domain/model/order.dart';
import '../api/model/api_order.dart';

class OrderMapper {
  static Order fromApi(ApiOrder order) {
    return Order(
      id: order.id,
      productName: order.productName,
      weight: order.weight,
      size: order.size,
      price: order.price,
      reward: order.reward,
      contacts: order.contacts,
    );
  }

  static ApiOrder toApi(Order order) {
    return ApiOrder(
      id: order.id,
      productName: order.productName,
      weight: order.weight,
      size: order.size,
      price: order.price,
      reward: order.reward,
      contacts: order.contacts,
    );
  }
}