import '../../domain/model/order.dart';
import '../api/model/api_order.dart';

class OrderMapper {
  static Order fromApi(ApiOrder order) {
    return Order(
        id: order.id,
        productName: order.productName,
        weight: order.weight,
        description: order.description,
        price: order.price,
        reward: order.reward,
        status: order.status,
        delivererID: order.delivererID,
        picture: order.picture);
  }

  static ApiOrder toApi(Order order) {
    return ApiOrder(
        id: order.id,
        productName: order.productName,
        weight: order.weight,
        description: order.description,
        price: order.price,
        reward: order.reward,
        status: order.status,
        delivererID: order.delivererID,
        picture: order.picture);
  }
}
