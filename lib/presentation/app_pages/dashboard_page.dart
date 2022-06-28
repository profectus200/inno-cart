import 'package:flutter/material.dart';
import 'package:innocart_front/internal/dependencies/order_repo_module.dart';

import '../../domain/model/order.dart';
import 'package:innocart_front/presentation/style/app_colors.dart';
import 'package:innocart_front/presentation/style/primary_text.dart';

import 'post_details_page.dart';

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
                          BorderSide(width: 2, color: AppColors.lightGray)),
                  hintText: 'Search..',
                  hintStyle: TextStyle(
                      color: AppColors.lightGray,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
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
                    (index) => itemCard(
                        orderList.data![index].id,
                        orderList.data![index].productName,
                        orderList.data![index].weight.toString(),
                        orderList.data![index].description,
                        orderList.data![index].price.toString(),
                        orderList.data![index].reward.toString(),
                        orderList.data![index].contacts),
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

  Widget itemCard(int id, String productName, String weight, String size,
      String price, String reward, String contacts) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PostDetail(id, productName, weight, size,
                    price, reward, contacts, false)))
      },
      child: Container(
        margin: const EdgeInsets.only(right: 25, left: 20, top: 25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(blurRadius: 4, color: AppColors.lighterGray)
          ],
          color: Color(0xFF23232D),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.attach_money_outlined,
                            color: AppColors.primary,
                            size: 28,
                          ),
                          // const SizedBox(width: 5),
                          PrimaryText(
                            text: reward,
                            size: 22,
                          )
                        ],
                      ),
                      const SizedBox(height: 5),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2.2,
                        child: PrimaryText(
                            text: productName,
                            size: 22,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 5),
                      Row(children: [
                        PrimaryText(
                            text: "Weight: $weight",
                            size: 18,
                            color: AppColors.lightGray),
                        const SizedBox(width: 10),
                        const Icon(Icons.person, size: 20),
                        const SizedBox(width: 5),
                        const PrimaryText(
                          text: "4.5",
                          size: 18,
                          fontWeight: FontWeight.w600,
                        )
                      ]),
                      const SizedBox(height: 15),
                    ],
                  ),
                ),
              ],
            ),
            Container(
                transform: Matrix4.translationValues(32.0, 7.5, 0.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                // decoration: Cont,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.network(
                      'https://avatars.mds.yandex.net/i?id=2c9c70afa4ab64820d347a195d161ded-5219960-images-thumbs&n=13&exp=1',
                      height: 100,
                    ),
                ),
                )
          ],
        ),
      ),
    );
  }
}
