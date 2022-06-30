import 'package:flutter/material.dart';
import 'package:innocart_front/internal/dependencies/delivery_repo_module.dart';
import 'package:innocart_front/presentation/app_pages/item_card.dart';
import 'package:innocart_front/presentation/style/app_colors.dart';
import '../../../domain/model/order.dart';

class Deliveries extends StatefulWidget {
  const Deliveries({Key? key}) : super(key: key);

  @override
  State<Deliveries> createState() => _Deliveries();
}

class _Deliveries extends State<Deliveries> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 40, bottom: 20),
        child: FutureBuilder<List<Order>>(
          future: DeliveryRepoModule.deliveryRepository().getDeliveryOrders(),
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
                        orderList.data![index].status,
                        orderList.data![index].customerProfile,
                        ''),
                  ));
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.pushNamed(context, 'addPost');
      //   },
      //   backgroundColor: AppColors.primary,
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
