import 'package:flutter/material.dart';
import 'package:innocart_front/presentation/app_pages/post_details_page.dart';
import 'package:innocart_front/presentation/style/primary_text.dart';
import 'package:innocart_front/presentation/style/app_colors.dart';
import 'dart:io';
import 'package:badges/badges.dart';

class ItemCard extends StatelessWidget {
  final int id;
  final String productName;
  final double weight;
  final String description;
  final double price;
  final double reward;
  final String status;
  final int delivererID;
  final String picture;
  final int delivererProfile;
  final int customerProfile;
  final String typeOfPage;

  const ItemCard(
      this.id,
      this.productName,
      this.weight,
      this.description,
      this.price,
      this.reward,
      this.status,
      this.picture,
      this.delivererID,
      this.delivererProfile,
      this.customerProfile,
      this.typeOfPage,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PostDetail(
                    id,
                    productName,
                    weight,
                    description,
                    price,
                    reward,
                    status,
                    picture,
                    delivererID,
                    delivererProfile,
                    customerProfile,
                    typeOfPage)))
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
                          // const SizedBox(width: 5),
                          PrimaryText(
                            text: reward.toString(),
                            size: 22,
                          ),
                          const Icon(
                            Icons.currency_ruble,
                            color: AppColors.yellow,
                            size: 26,
                          ),
                          const SizedBox(width: 5),
                          (typeOfPage == 'activeOrders')
                              ?
                          Badge(
                            toAnimate: false,
                            shape: BadgeShape.square,
                            badgeColor: getBadgeColor(status),
                            borderRadius: BorderRadius.circular(8),
                            badgeContent: Text(status, style: const TextStyle(color: Colors.black)),
                          ) : const Text(""),
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
                        // FutureBuilder<Profile>(
                        //   future: ProfileRepoModule.profileRepository()
                        //       .getProfile(delivererProfile),
                        //   builder: (BuildContext context,
                        //       AsyncSnapshot<Profile> profile) {
                        //     if (profile.hasData &&
                        //         profile.connectionState ==
                        //             ConnectionState.done) {
                        //       return PrimaryText(
                        //         text: profile.data!.rating.toString(),
                        //         size: 18,
                        //         fontWeight: FontWeight.w600,
                        //       );
                        //     } else {
                        //       return const Center(
                        //         child: CircularProgressIndicator(),
                        //       );
                        //     }
                        //   },
                        // ),
                        const PrimaryText(
                          text: "5.0",
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
                  child: picture != ''
                      ? Image.file(
                          File(picture),
                          height: 100,
                          // fit: BoxFit.cover,
                        )
                      : const Text('')
                  // Image.network(
                  //   'https://avatars.mds.yandex.net/i?id=2c9c70afa4ab64820d347a195d161ded-5219960-images-thumbs&n=13&exp=1',
                  //   height: 100,
                  // ),
                  ),
            )
          ],
        ),
      ),
    );
  }
}
Color getBadgeColor(text) {
  if (text=='IN_PROGRESS') return AppColors.yellow;
  else if (text=='CONFIRMATION') return AppColors.blue_;
  return AppColors.lightGray;
}
