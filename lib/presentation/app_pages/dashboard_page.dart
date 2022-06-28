import 'package:flutter/material.dart';
import 'package:innocart_front/internal/dependencies/order_repo_module.dart';
import 'package:innocart_front/presentation/app_pages/item_card.dart';

import '../../domain/model/order.dart';
import 'package:innocart_front/presentation/style/app_colors.dart';

class MyDashboard extends StatefulWidget {
  const MyDashboard({Key? key}) : super(key: key);

  @override
  State<MyDashboard> createState() => _MyDashboard();
}

class _MyDashboard extends State<MyDashboard> {
  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: const EdgeInsets.only(top: 40, bottom: 20),
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              SizedBox(width: 20),
              Icon(
                Icons.search,
                color: AppColors.lighterGray,
                size: 25,
              ),
              SizedBox(width: 10),
              Expanded(
                  child: TextField(
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(width: 2, color: AppColors.lightGray),
                  ),
                  hintText: 'Search..',
                  hintStyle: TextStyle(
                      color: AppColors.lightGray,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,

                  ),
                ),
              )),
            ],
          ),
          const SizedBox(width: 20),
          SingleChildScrollView(
            child: FutureBuilder<List<Order>>(
              future: OrderRepoModule.orderRepository().getOrderList(),
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
                        orderList.data![index].weight.toString(),
                        orderList.data![index].description,
                        orderList.data![index].price.toString(),
                        orderList.data![index].reward.toString(),
                        orderList.data![index].status),
                  ));
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          )
        ]);
  }
}
