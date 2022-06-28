import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:innocart_front/data/api/model/api_order.dart';
import 'package:innocart_front/data/data_storages/data_storage.dart';

class OrderService {
  Future<List<ApiOrder>> getOrderList() async {
    Uri url = Uri.parse('http://10.0.2.2:8000/api/v1/orders');
    var token = await DataStorage.instance.getToken;
    var response = await http.get(
      url,
      headers: {'Authorization': 'Token $token'},
    );
    var list = jsonDecode(response.body) as List;
    List<ApiOrder> orderList = [];
    for (var element in list) {
      ApiOrder order = ApiOrder.fromApi(element);
      orderList.add(order);
    }

    return orderList;
  }

  Future<ApiOrder> getOrder(int id) async {
    Uri url = Uri.parse('http://10.0.2.2:8000/api/v1/orders/$id');
    var token = await DataStorage.instance.getToken;
    var response = await http.get(
      url,
      headers: {'Authorization': 'Token $token'},
    );
    var element = jsonDecode(response.body);
    ApiOrder order = ApiOrder.fromApi(element);

    return order;
  }

  Future<int> addOrder(ApiOrder order) async {
    Uri url = Uri.parse('http://10.0.2.2:8000/api/v1/orders');
    var token = await DataStorage.instance.getToken;
    var response = await http.post(url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Token $token'
        },
        body: jsonEncode(order.toApi()));
    return response.statusCode;
  }

  Future<int> deleteOrder(int id) async {
    Uri url = Uri.parse('http://10.0.2.2:8000/api/v1/orders/$id');
    var token = await DataStorage.instance.getToken;
    var response = await http.delete(
      url,
      headers: {'Authorization': 'Token $token'},
    );
    return response.statusCode;
  }

  Future<List<ApiOrder>> getPersonalOrders() async {
    Uri url = Uri.parse('http://10.0.2.2:8000/api/v1/personal');
    var token = await DataStorage.instance.getToken;
    var response = await http.get(
      url,
      headers: {'Authorization': 'Token $token'},
    );
    var list = jsonDecode(response.body) as List;
    List<ApiOrder> personalOrders = [];
    for (var element in list) {
      ApiOrder order = ApiOrder.fromApi(element);
      personalOrders.add(order);
    }

    return personalOrders;
  }
}
