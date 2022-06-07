import 'package:innocart_front/data/api/model/api_order.dart';
import 'package:innocart_front/data/api/service/order_service.dart';
import 'package:innocart_front/data/mapper/order_mapper.dart';
import 'package:innocart_front/domain/model/order.dart';

class ApiUtil {
  final OrderService _orderService;

  ApiUtil(this._orderService);

  Future<List<Order>> getOrderList() async {
    final list = await _orderService.getOrderList();
    List<Order> orderList = [];
    for (var element in list) {
      Order order = OrderMapper.fromApi(element);
      orderList.add(order);
    }
    return orderList;
  }

  Future<Order> getOrder(int id) async {
    ApiOrder element = await _orderService.getOrder(id);
    Order order = OrderMapper.fromApi(element);
    return order;
  }

  Future<int> addOrder(Order order){
    ApiOrder element = OrderMapper.toApi(order);
    Future<int> requestCode = _orderService.addOrder(element);
    return requestCode;
  }

  Future<int> deleteOrder(int id){
    Future<int> requestCode = _orderService.deleteOrder(id);
    return requestCode;
  }
}
