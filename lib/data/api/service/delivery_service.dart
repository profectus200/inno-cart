import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:innocart_front/data/data_storages/data_storage.dart';

import '../model/api_order.dart';

class DeliveryService {
  Future<List<ApiOrder>> getDeliveryOrders() async {
    Uri url = Uri.parse('http://10.0.2.2:8000/api/v1/personal');
    var token = await DataStorage.instance.getToken;
    var response = await http.get(
      url,
      headers: {'Authorization': 'Token $token'},
    );
    var list = jsonDecode(response.body) as List;
    List<ApiOrder> deliveryOrders = [];
    for (var element in list) {
      ApiOrder order = ApiOrder.fromApi(element);
      deliveryOrders.add(order);
    }

    return deliveryOrders;
  }

  Future<int> requestDelivery(ApiOrder order, int id) async {
    Uri url = Uri.parse('http://10.0.2.2:8000/api/v1/orders/$id');
    order.delivererID = await DataStorage.instance.getPersonID;
    var token = await DataStorage.instance.getToken;
    var response = await http.put(url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Token $token'
        },
        body: jsonEncode(order.toApi()));
    return response.statusCode;
  }

  Future<int> acceptDelivery(ApiOrder order, int id) async {
    Uri url = Uri.parse('http://10.0.2.2:8000/api/v1/orders/$id');
    order.status = 'IN_PROGRESS';
    var token = await DataStorage.instance.getToken;
    var response = await http.put(url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Token $token'
        },
        body: jsonEncode(order.toApi()));
    return response.statusCode;
  }

  Future<int> rejectDelivery(ApiOrder order, int id) async {
    Uri url = Uri.parse('http://10.0.2.2:8000/api/v1/orders/$id');
    order.delivererID = -1;
    var token = await DataStorage.instance.getToken;
    var response = await http.put(url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Token $token'
        },
        body: jsonEncode(order.toApi()));
    return response.statusCode;
  }
}
