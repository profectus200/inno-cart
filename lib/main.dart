import 'package:flutter/material.dart';

import 'domain/model/order.dart';
import 'internal/application.dart';
import 'internal/dependencies/repository_module.dart';

void main() {
  // runApp(const MyApp());

  Order order = Order(
      id: 4,
      productName: '5',
      weight: 5,
      size: '5',
      price: 5,
      reward: 5,
      contacts: '5');
  RepositoryModule.orderRepository().addOrder(order);
}
