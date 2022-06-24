import 'package:flutter_test/flutter_test.dart';
import 'package:innocart_front/data/api/model/api_order.dart';
import 'package:innocart_front/data/mapper/order_mapper.dart';
import 'package:innocart_front/domain/model/order.dart';

void main() {
  group('ApiOrder', () {
    ApiOrder apiOrder = ApiOrder(id: 1,
        productName: 'Pizza',
        weight: 12.0,
        description: 'Nice pizza',
        price: 999.99,
        reward: 1.999,
        contacts: '@Vldmr11');

    Order order = Order(id: 1,
        productName: 'Pizza',
        weight: 12.0,
        description: 'Nice pizza',
        price: 999.99,
        reward: 1.999,
        contacts: '@Vldmr11');

    test('fromApi', () {
      expect(OrderMapper.fromApi(apiOrder), order);
    });

    test('toApi', () {
      expect(OrderMapper.toApi(order), apiOrder);
    });
  });
}