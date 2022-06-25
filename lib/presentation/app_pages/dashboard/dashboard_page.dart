import 'package:flutter/material.dart';
import 'package:innocart_front/internal/dependencies/order_repo_module.dart';

import '../../../domain/model/order.dart';
import '../../extra/app_colors.dart';
import '../../extra/primary_text.dart';
import '../post_details_page.dart';

class MyDashboard extends StatefulWidget {
  const MyDashboard({Key? key}) : super(key: key);

  @override
  State<MyDashboard> createState() => _MyDashboard();
}

class _MyDashboard extends State<MyDashboard> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: const Text("InnoCart"),
            ),
            body: SingleChildScrollView(
              child: FutureBuilder<List<Order>>(
                future: OrderRepoModule.orderRepository().getOrderList(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Order>> orderList) {
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
            )));
  }

  Widget itemCard(int id, String productName, String weight, String size, String price,
      String reward, String contacts) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PostDetail(id,
                    productName, weight, size, price, reward, contacts, false)))
      },
      child: Container(
        margin: const EdgeInsets.only(right: 25, left: 20, top: 25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(blurRadius: 10, color: AppColors.lighterGray)
          ],
          color: AppColors.white,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25, left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.attach_money,
                            color: AppColors.primary,
                            size: 28,
                          ),
                          const SizedBox(width: 10),
                          PrimaryText(
                            text: reward,
                            size: 20,
                          )
                        ],
                      ),
                      const SizedBox(height: 15),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2.2,
                        child: PrimaryText(
                            text: productName,
                            size: 22,
                            fontWeight: FontWeight.w700),
                      ),
                      PrimaryText(
                          text: "Weight: $weight",
                          size: 18,
                          color: AppColors.lightGray),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 45, vertical: 20),
                      decoration: const BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          )),
                      child: const Icon(Icons.add, size: 20),
                    ),
                    const SizedBox(width: 20),
                    SizedBox(
                      child: Row(
                        children: [
                          const Icon(Icons.person, size: 20),
                          const SizedBox(width: 5),
                          PrimaryText(
                            text: contacts,
                            size: 18,
                            fontWeight: FontWeight.w600,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              transform: Matrix4.translationValues(30.0, 25.0, 0.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(color: Colors.grey.shade400, blurRadius: 20)
                  ]),
              child: Hero(
                  tag: productName + weight,
                  child: Image.network(
                    'https://avatars.mds.yandex.net/i?id=2c9c70afa4ab64820d347a195d161ded-5219960-images-thumbs&n=13&exp=1',
                    height: 90,
                    width: 90,
                  )
                  // Image.asset('https://avatars.mds.yandex.net/i?id=2c9c70afa4ab64820d347a195d161ded-5219960-images-thumbs&n=13&exp=1',
                  //     width: MediaQuery.of(context).size.width/2.9),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
