import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:innocart_front/data/api/model/api_order.dart';

class OrderService {
  Future<List<ApiOrder>> getOrderList() async {
    Uri url = Uri.parse('http://10.0.2.2:8000/ordersdetails');
    var response = await http.get(url);
    var list = jsonDecode(response.body) as List;
    List<ApiOrder> orderList = [];
    for (var element in list) {
      ApiOrder order = ApiOrder.fromApi(element);
      orderList.add(order);
    }

    return orderList;
  }

  Future<ApiOrder> getOrder(int id) async {
    Uri url = Uri.parse('http://10.0.2.2:8000/ordersdetails/$id');
    var response = await http.get(url);
    var element = jsonDecode(response.body);
    ApiOrder order = ApiOrder.fromApi(element);

    return order;
  }

  Future<int> addOrder(ApiOrder order) async {
    Uri url = Uri.parse('http://10.0.2.2:8000/ordersdetails');
    var response = await http.post(url,
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(order.toApi()));
    return response.statusCode;
  }

  Future<int> deleteOrder(int id) async {
    Uri url = Uri.parse('http://10.0.2.2:8000/ordersdetails/$id');
    var response = await http.delete(url);
    return response.statusCode;
  }
}
