import '../../domain/model/order.dart';
import '../../domain/repository/delivery_repository.dart';
import '../api/model/api_order.dart';
import '../api/service/delivery_service.dart';
import '../mapper/order_mapper.dart';

class DeliveryDataRepository extends DeliveryRepository {
  final DeliveryService _deliveryService;

  DeliveryDataRepository(this._deliveryService);

  @override
  Future<List<Order>> getDeliveryOrders() async {
    final list = await _deliveryService.getDeliveryOrders();
    List<Order> orderList = [];
    for (var element in list) {
      Order order = OrderMapper.fromApi(element);
      orderList.add(order);
    }
    return orderList;
  }

  @override
  Future<int> requestDelivery(Order order, int id) async {
    ApiOrder apiOrder = OrderMapper.toApi(order);
    Future<int> requestCode = _deliveryService.requestDelivery(apiOrder, id);
    return requestCode;
  }

  @override
  Future<int> acceptDelivery(Order order, int id) async {
    ApiOrder apiOrder = OrderMapper.toApi(order);
    Future<int> requestCode = _deliveryService.acceptDelivery(apiOrder, id);
    return requestCode;
  }

  @override
  Future<int> rejectDelivery(Order order, int id) async {
    ApiOrder apiOrder = OrderMapper.toApi(order);
    Future<int> requestCode = _deliveryService.rejectDelivery(apiOrder, id);
    return requestCode;
  }
}
