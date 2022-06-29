import 'package:flutter/material.dart';
import 'package:innocart_front/presentation/app_pages/post_details_page.dart';
import 'package:innocart_front/presentation/style/primary_text.dart';
import 'package:innocart_front/presentation/style/app_colors.dart';

class ItemCard extends StatelessWidget {
  final int id;
  final String productName;
  final String weight;
  final String price;
  final String size;
  final String reward;
  final String status;
  final int customerProfile;
  final bool activeOrders;

  const ItemCard(this.id, this.productName, this.weight, this.size, this.price,
      this.reward, this.status, this.customerProfile, this.activeOrders,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PostDetail(id, productName, weight, size,
                    price, reward, status, customerProfile, activeOrders)))
      },
      child: Container(
        margin: const EdgeInsets.only(right: 25, left: 20, top: 25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(blurRadius: 4, color: AppColors.lighterGray)
          ],
          color: const Color(0xFF23232D),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.attach_money_outlined,
                            color: AppColors.yellow,
                            size: 28,
                          ),
                          // const SizedBox(width: 5),
                          PrimaryText(
                            text: reward,
                            size: 22,
                          ),
                          const SizedBox(width: 5),
                          activeOrders
                              ? TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: AppColors.primary,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                  ),
                                  onPressed: () {},
                                  child: PrimaryText(
                                    text: status,
                                    size: 12,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.black,
                                  ),
                                )
                              : const Text(""),
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
                            text: "$weight g",
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
              transform: Matrix4.translationValues(12.0, 7.5, 0.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              // decoration: Cont,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
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
