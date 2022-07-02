import 'package:flutter/material.dart';
import 'package:innocart_front/internal/dependencies/order_repo_module.dart';
import 'package:innocart_front/presentation/app_pages/item_card.dart';
import '../../../domain/model/order.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  State<History> createState() => _History();
}

class _History extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 40, bottom: 20),
        child: FutureBuilder<List<Order>>(
          future: OrderRepoModule.orderRepository().getHistoryOrders(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Order>> orderList) {
            if (orderList.hasData &&
                orderList.connectionState == ConnectionState.done) {
              return Column(
                  children: List.generate(
                    orderList.data!.length,
                        (index) => ItemCard(
                        orderList.data![index].id,
                        orderList.data![index].productName,
                        orderList.data![index].weight,
                        orderList.data![index].description,
                        orderList.data![index].price,
                        orderList.data![index].reward,
                        orderList.data![index].status,
                        orderList.data![index].picture,
                        orderList.data![index].delivererID,
                        orderList.data![index].delivererProfile,
                        orderList.data![index].customerProfile,
                        'history'),
                  ));
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      )
    );
  }
}
