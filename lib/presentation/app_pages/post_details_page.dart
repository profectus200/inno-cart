import 'package:flutter/material.dart';
import 'package:innocart_front/internal/dependencies/order_repo_module.dart';

import 'package:innocart_front/presentation/style/primary_text.dart';
import 'package:innocart_front/presentation/style/app_colors.dart';


class PostDetail extends StatelessWidget {
  final int id;
  final String productName;
  final String weight;
  final String description;
  final String price;
  final String reward;
  final String status;
  final bool profilePage;

  const PostDetail(this.id, this.productName, this.weight, this.description,
      this.price, this.reward, this.status, this.profilePage,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ConstrainedBox(
        constraints:
        BoxConstraints(minWidth: MediaQuery
            .of(context)
            .size
            .width - 40),
        child: !profilePage ? ElevatedButton(
          onPressed: () => {},
          style: ElevatedButton.styleFrom(
              primary: AppColors.primary,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              textStyle:
              const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              PrimaryText(
                text: 'Reply',
                fontWeight: FontWeight.w600,
                size: 18,
              ),
              Icon(Icons.chevron_right)
            ],
          ),
        ) : ElevatedButton(
          onPressed: () => {
          OrderRepoModule.orderRepository().deleteOrder(id),
          Navigator.pushNamed(context, 'activeOrders')
        },
          style: ElevatedButton.styleFrom(
              primary: AppColors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: const BorderSide(color: Colors.red)),
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              textStyle:
              const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(Icons.remove_circle_outlined, color: Colors.red, size: 24),
              PrimaryText(
                text: ' Remove',
                fontWeight: FontWeight.w600,
                size: 20,
                color: Colors.red,
              )
            ],
          ),
        )
        ,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: ListView(
        children: [
          customAppBar(context),
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
                    // Image.network(
                    //   'https://avatars.mds.yandex.net/i?id=2c9c70afa4ab64820d347a195d161ded-5219960-images-thumbs&n=13&exp=1',
                    //   // height: 90,
                    //   width: 15,
                    // ),
                    // SvgPicture.asset(
                    //   'assets/dollar.svg',
                    //   color: AppColors.tertiary,
                    //   width: 15,
                    // ),
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
                            const PrimaryText(
                              text: 'Description',
                              color: AppColors.lightGray,
                              size: 16,
                              fontWeight: FontWeight.w500,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            PrimaryText(
                                text: description, fontWeight: FontWeight.w600),
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
                                text: weight, fontWeight: FontWeight.w600),
                            const SizedBox(
                              height: 20,
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
                                text: price, fontWeight: FontWeight.w600),
                          ]),
                    ),
                    Hero(
                      tag: "imagePath",
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade400, blurRadius: 30),
                          ],
                          borderRadius: BorderRadius.circular(100),
                        ),
                        height: 170,
                        child: Image.network(
                          'https://avatars.mds.yandex.net/i?id=2c9c70afa4ab64820d347a195d161ded-5219960-images-thumbs&n=13&exp=1',
                          fit: BoxFit.cover,
                        ),
                        // Image.asset('https://avatars.mds.yandex.net/i?id=2c9c70afa4ab64820d347a195d161ded-5219960-images-thumbs&n=13&exp=1',
                        //     fit: BoxFit.cover)
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                PrimaryText(
                    text: 'Status: $status',
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

  Padding customAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(width: 1, color: Colors.grey.shade400)),
              child: const Icon(Icons.chevron_left),
            ),
          ),
          // Container(
          //   padding: const EdgeInsets.all(10),
          //   decoration: BoxDecoration(
          //     color: AppColors.primary,
          //     borderRadius: BorderRadius.circular(15),
          //   ),
          //   child: const Icon(Icons.attach_money, color: AppColors.white),
          // ),
        ],
      ),
    );
  }
}
