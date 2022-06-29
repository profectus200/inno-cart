import 'package:flutter/material.dart';
import 'package:innocart_front/domain/model/order.dart';
import 'package:innocart_front/internal/dependencies/order_repo_module.dart';

import 'package:innocart_front/presentation/style/primary_text.dart';
import 'package:innocart_front/presentation/style/app_colors.dart';

import '../../internal/dependencies/delivery_repo_module.dart';

class PostDetail extends StatelessWidget {
  final int id;
  final String productName;
  final String weight;
  final String description;
  final String price;
  final String reward;
  final String status;
  final int customerProfile;
  final bool activeOrders;

  const PostDetail(this.id, this.productName, this.weight, this.description,
      this.price, this.reward, this.status, this.customerProfile, this.activeOrders,
      {Key? key})
      : super(key: key);

  // get customerProfile => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ConstrainedBox(
        constraints:
            BoxConstraints(minWidth: MediaQuery.of(context).size.width - 40),
        child: !activeOrders
            ? ElevatedButton(
                onPressed: () => {
                  DeliveryRepoModule.deliveryRepository().requestDelivery(
                      Order(
                          id: id,
                          productName: productName,
                          weight: double.parse(weight),
                          description: description,
                          price: double.parse(price),
                          reward: double.parse(reward),
                          status: status,
                          delivererID: -1,
                          picture: '',
                          delivererProfile: -1,
                          customerProfile: customerProfile),
                      id)
                },
                style: ElevatedButton.styleFrom(
                    primary: AppColors.primary,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 20),
                    textStyle: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    PrimaryText(
                      text: 'Reply',
                      color: AppColors.black,
                      fontWeight: FontWeight.w600,
                      size: 18,
                    ),
                    Icon(Icons.chevron_right)
                  ],
                ),
              )
            : ElevatedButton(
                onPressed: () => {
                  OrderRepoModule.orderRepository().deleteOrder(id),
                  Navigator.pushNamed(context, 'dashboard'),
                },
                style: ElevatedButton.styleFrom(
                    primary: AppColors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: const BorderSide(color: Colors.red)),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 20),
                    textStyle: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.remove_circle_outlined,
                        color: Colors.red, size: 24),
                    PrimaryText(
                      text: ' Remove',
                      fontWeight: FontWeight.w600,
                      size: 20,
                      color: Colors.red,
                    )
                  ],
                ),
              ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PrimaryText(
                  text: productName,
                  size: 45,
                  fontWeight: FontWeight.w600,
                ),
                const SizedBox(height: 30),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PrimaryText(
                      text: 'Reward $reward',
                      size: 48,
                      fontWeight: FontWeight.w700,
                      color: AppColors.tertiary,
                      height: 1,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            const PrimaryText(
                              text: 'Weight',
                              color: AppColors.lightGray,
                              size: 16,
                              fontWeight: FontWeight.w500,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            PrimaryText(
                                text: '$weight g', fontWeight: FontWeight.w600),
                            const SizedBox(
                              height: 8,
                            ),
                            const PrimaryText(
                              text: 'Price',
                              color: AppColors.lightGray,
                              size: 16,
                              fontWeight: FontWeight.w500,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            PrimaryText(
                                text: '$price \$', fontWeight: FontWeight.w600),
                            const SizedBox(
                              height: 8,
                            ),
                            const PrimaryText(
                              text: 'Time',
                              color: AppColors.lightGray,
                              size: 16,
                              fontWeight: FontWeight.w500,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            const PrimaryText(
                                text: "18:00-20:00",
                                fontWeight: FontWeight.w600),
                            const SizedBox(
                              height: 8,
                            ),
                          ]),
                    ),
                    Hero(
                      tag: "imagePath",
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade400, blurRadius: 20),
                          ],
                          // borderRadius: BorderRadius.circular(100),
                        ),
                        height: 160,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.network(
                            'https://avatars.mds.yandex.net/i?id=2c9c70afa4ab64820d347a195d161ded-5219960-images-thumbs&n=13&exp=1',
                            fit: BoxFit.cover,
                          ),
                        ),
                        // Image.asset('https://avatars.mds.yandex.net/i?id=2c9c70afa4ab64820d347a195d161ded-5219960-images-thumbs&n=13&exp=1',
                        //     fit: BoxFit.cover)
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                PrimaryText(
                    text: 'Description: $description',
                    fontWeight: FontWeight.w700,
                    size: 22),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 100,
          )
        ],
      ),
    );
  }
}
