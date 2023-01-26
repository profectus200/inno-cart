import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:innocart_front/domain/model/order.dart';
import 'package:innocart_front/internal/dependencies/order_repo_module.dart';

import 'package:innocart_front/presentation/style/primary_text.dart';
import 'package:innocart_front/presentation/style/app_colors.dart';

import '../../domain/model/profile.dart';
import '../../internal/dependencies/delivery_repo_module.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';

import '../../internal/dependencies/profile_repo_module.dart';

class PostDetail extends StatelessWidget {
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

  const PostDetail(
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

  // get customerProfile => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: ConstrainedBox(
      //   constraints:
      //       BoxConstraints(minWidth: MediaQuery.of(context).size.width - 40),
      //   child: getBottomOfPost(context),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: ListView(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 25, bottom: 25),
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
                                text: '$price \₽', fontWeight: FontWeight.w600),
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
                            child: picture != ''
                                ? Image.file(
                                    File(picture),
                                    fit: BoxFit.cover,
                                    // fit: BoxFit.cover,
                                  )
                                : const Text('')
                            // Image.network(
                            //   'https://avatars.mds.yandex.net/i?id=2c9c70afa4ab64820d347a195d161ded-5219960-images-thumbs&n=13&exp=1',
                            //   fit: BoxFit.cover,
                            // ),

                            ),
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
                getBottomOfPost(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _launchUrl() async {
    Uri url = Uri.parse('https://t.me/Vldmr11');
    if (!await launchUrl(url)) throw 'Could not launch $url';
  }

  Widget getBottomOfPost(BuildContext context) {
    switch (typeOfPage) {
      case 'dashboard':
        return ElevatedButton(
          onPressed: () => {
            DeliveryRepoModule.deliveryRepository().requestDelivery(
                Order(
                    id: id,
                    productName: productName,
                    weight: weight,
                    description: description,
                    price: price,
                    reward: reward,
                    status: status,
                    delivererID: delivererID,
                    picture: picture,
                    delivererProfile: delivererProfile,
                    customerProfile: customerProfile),
                id),
            Navigator.pushNamed(context, 'dashboard')
          },
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
                color: AppColors.black,
                fontWeight: FontWeight.w600,
                size: 18,
              ),
              Icon(Icons.chevron_right)
            ],
          ),
        );
      case 'activeOrders':
        if (status == 'CONFIRMATION') {
          return Column(children: [
            Row(children: [
              const SizedBox(
                width: 30,
              ),
              const CircleAvatar(
                radius: 10 * 4,
                backgroundColor: Color(0xFF23232D),
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                children: [
                  FutureBuilder<Profile>(
                    future: ProfileRepoModule.profileRepository()
                        .getProfile(delivererProfile),
                    builder:
                        (BuildContext context, AsyncSnapshot<Profile> profile) {
                      if (profile.hasData &&
                          profile.connectionState == ConnectionState.done) {
                        return PrimaryText(
                          text: profile.data!.nickname,
                          fontWeight: FontWeight.w300,
                          // color: AppColors.white,
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                  FutureBuilder<Profile>(
                    future: ProfileRepoModule.profileRepository()
                        .getProfile(delivererProfile),
                    builder:
                        (BuildContext context, AsyncSnapshot<Profile> profile) {
                      if (profile.hasData &&
                          profile.connectionState == ConnectionState.done) {
                        return PrimaryText(
                          text: profile.data!.rating.toString(),
                          fontWeight: FontWeight.w300,
                          // color: AppColors.white,
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                  // PrimaryText(text: 'ivan'),
                  // PrimaryText(text: 'alias'),
                ],
              ),
              const SizedBox(
                width: 30,
              ),
              Column(
                children: [
                  FutureBuilder<Profile>(
                    future: ProfileRepoModule.profileRepository()
                        .getProfile(delivererProfile),
                    builder:
                        (BuildContext context, AsyncSnapshot<Profile> profile) {
                      if (profile.hasData &&
                          profile.connectionState == ConnectionState.done) {
                        return PrimaryText(
                          text: profile.data!.dealsCompleted.toString(),
                          fontWeight: FontWeight.w300,
                          // color: AppColors.white,
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                  const PrimaryText(
                    text: 'completed\ndeals',
                    size: 16,
                  ),
                ],
              )
            ]),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 15,
                ),
                ElevatedButton(
                  onPressed: () => {
                    DeliveryRepoModule.deliveryRepository().acceptDelivery(
                        Order(
                            id: id,
                            productName: productName,
                            weight: weight,
                            description: description,
                            price: price,
                            reward: reward,
                            status: status,
                            delivererID: delivererID,
                            picture: picture,
                            delivererProfile: delivererProfile,
                            customerProfile: customerProfile),
                        id),
                    Navigator.pushNamed(context, 'dashboard'),
                    FutureBuilder<Profile>(
                      future: ProfileRepoModule.profileRepository()
                          .getProfile(delivererProfile),
                      builder: (BuildContext context, AsyncSnapshot<Profile> profile) {
                        if (profile.hasData &&
                            profile.connectionState == ConnectionState.done) {
                          var alias = profile.data!.alias;
                          return PrimaryText(
                            text: 'Angel: ${profile.data!.nickname}',
                            fontWeight: FontWeight.w300,
                          );
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
                    _launchUrl(),
                  },
                  style: ElevatedButton.styleFrom(
                      primary: AppColors.yellow,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: const BorderSide(color: Colors.yellowAccent)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 35, vertical: 20),
                      textStyle: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      // Icon(Icons.remove_circle_outlined, color: Colors.red, size: 16),
                      PrimaryText(
                        text: ' Accept',
                        fontWeight: FontWeight.w600,
                        size: 20,
                        color: Colors.black,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 25,
                ),
                ElevatedButton(
                  onPressed: () => {
                    DeliveryRepoModule.deliveryRepository().rejectDelivery(
                        Order(
                            id: id,
                            productName: productName,
                            weight: weight,
                            description: description,
                            price: price,
                            reward: reward,
                            status: status,
                            delivererID: delivererID,
                            picture: picture,
                            delivererProfile: delivererProfile,
                            customerProfile: customerProfile),
                        id),
                    Navigator.pushNamed(context, 'dashboard'),
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: const BorderSide(color: Colors.red)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 35, vertical: 20),
                      textStyle: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      // Icon(Icons.remove_circle_outlined, color: Colors.red, size: 24),
                      PrimaryText(
                        text: 'Decline',
                        fontWeight: FontWeight.w600,
                        size: 20,
                        color: Colors.white,
                      )
                    ],
                  ),
                )
              ],
            )
          ]);
        } else if (status == 'IN_PROGRESS') {
          return Column(children: [
            FutureBuilder<Profile>(
              future: ProfileRepoModule.profileRepository()
                  .getProfile(delivererProfile),
              builder: (BuildContext context, AsyncSnapshot<Profile> profile) {
                if (profile.hasData &&
                    profile.connectionState == ConnectionState.done) {
                  return PrimaryText(
                    text: 'Angel: ${profile.data!.nickname}',
                    fontWeight: FontWeight.w300,
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            FutureBuilder<Profile>(
              future: ProfileRepoModule.profileRepository()
                  .getProfile(delivererProfile),
              builder: (BuildContext context, AsyncSnapshot<Profile> profile) {
                if (profile.hasData &&
                    profile.connectionState == ConnectionState.done) {
                  return PrimaryText(
                    text: profile.data!.alias,
                    fontWeight: FontWeight.w300,
                    // color: AppColors.white,
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            FutureBuilder<Profile>(
              future: ProfileRepoModule.profileRepository()
                  .getProfile(delivererProfile),
              builder: (BuildContext context, AsyncSnapshot<Profile> profile) {
                if (profile.hasData &&
                    profile.connectionState == ConnectionState.done) {
                  return PrimaryText(
                    text: 'deals completed: ${profile.data!.dealsCompleted}',
                    fontWeight: FontWeight.w300,
                    // color: AppColors.white,
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () => {_launchUrl()},
                  style: ElevatedButton.styleFrom(
                      primary: AppColors.orange,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: const BorderSide(color: Colors.orangeAccent)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 35, vertical: 20),
                      textStyle: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      // Icon(Icons.remove_circle_outlined, color: Colors.red, size: 16),
                      PrimaryText(
                        text: 'Contact',
                        fontWeight: FontWeight.w600,
                        size: 20,
                        color: Colors.black,
                      )
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => {
                    _submit(context),
                  },
                  style: ElevatedButton.styleFrom(
                      primary: AppColors.yellow,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: const BorderSide(color: Colors.yellowAccent)),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 35, vertical: 20),
                      textStyle: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      // Icon(Icons.remove_circle_outlined, color: Colors.red, size: 16),
                      PrimaryText(
                        text: 'Close deal',
                        fontWeight: FontWeight.w600,
                        size: 20,
                        color: Colors.black,
                      )
                    ],
                  ),
                ),
              ],
            )
          ]);
        } else {
          return ElevatedButton(
            onPressed: () => {
              OrderRepoModule.orderRepository().deleteOrder(id),
              Navigator.pushNamed(context, 'dashboard'),
            },
            style: ElevatedButton.styleFrom(
                primary: AppColors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: const BorderSide(color: Colors.red)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
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
          );
        }
      case 'history':
        {
          return Column(
            children: [
              const PrimaryText(text: 'Angel:'),
              const SizedBox(
                height: 5,
              ),
              FutureBuilder<Profile>(
                future: ProfileRepoModule.profileRepository()
                    .getProfile(delivererProfile),
                builder:
                    (BuildContext context, AsyncSnapshot<Profile> profile) {
                  if (profile.hasData &&
                      profile.connectionState == ConnectionState.done) {
                    return PrimaryText(
                      text: profile.data!.nickname,
                      fontWeight: FontWeight.w300,
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
              FutureBuilder<Profile>(
                future: ProfileRepoModule.profileRepository()
                    .getProfile(delivererProfile),
                builder:
                    (BuildContext context, AsyncSnapshot<Profile> profile) {
                  if (profile.hasData &&
                      profile.connectionState == ConnectionState.done) {
                    return PrimaryText(
                      text: profile.data!.alias,
                      fontWeight: FontWeight.w300,
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
              FutureBuilder<Profile>(
                future: ProfileRepoModule.profileRepository()
                    .getProfile(delivererProfile),
                builder:
                    (BuildContext context, AsyncSnapshot<Profile> profile) {
                  if (profile.hasData &&
                      profile.connectionState == ConnectionState.done) {
                    return PrimaryText(
                      text: 'deals completed: ${profile.data!.dealsCompleted}',
                      fontWeight: FontWeight.w300,
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ],
          );
        }
      case 'deliveries':
        {
          return Column(
            children: [
              const PrimaryText(text: 'Buyer:'),
              const SizedBox(
                height: 5,
              ),
              FutureBuilder<Profile>(
                future: ProfileRepoModule.profileRepository()
                    .getProfile(customerProfile),
                builder:
                    (BuildContext context, AsyncSnapshot<Profile> profile) {
                  if (profile.hasData &&
                      profile.connectionState == ConnectionState.done) {
                    return PrimaryText(
                      text: profile.data!.nickname,
                      fontWeight: FontWeight.w300,
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
              FutureBuilder<Profile>(
                future: ProfileRepoModule.profileRepository()
                    .getProfile(customerProfile),
                builder:
                    (BuildContext context, AsyncSnapshot<Profile> profile) {
                  if (profile.hasData &&
                      profile.connectionState == ConnectionState.done) {
                    return PrimaryText(
                      text: profile.data!.alias,
                      fontWeight: FontWeight.w300,
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ],
          );
        }
    }
    return const Text('');
  }

  void _submit(context) {
    showDialog<void>(
      context: context,
      barrierDismissible: true, // user can tap anywhere to close the pop up
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Rating'),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                RatingBar.builder(
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.favorite,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                    // ProfileRepoModule.profileRepository()
                    //     .getProfile(delivererProfile)
                    //     .then((profile) {
                    //   Profile newProfile = Profile(
                    //       id: profile.id,
                    //       nickname: profile.nickname,
                    //       rating: (profile.rating * profile.dealsCompleted +
                    //               rating) /
                    //           (profile.dealsCompleted + 1),
                    //       dealsCompleted: profile.dealsCompleted + 1,
                    //       alias: profile.alias);
                    //   ProfileRepoModule.profileRepository()
                    //       .updateProfile(newProfile, profile.id);
                    // });
                    // print(rating);
                  },
                )
              ],
            ),
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.blue,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                  child: const Text('OK'),
                  onPressed: () {
                    DeliveryRepoModule.deliveryRepository().closeDelivery(
                        Order(
                            id: id,
                            productName: productName,
                            weight: weight,
                            description: description,
                            price: price,
                            reward: reward,
                            status: status,
                            delivererID: delivererID,
                            picture: picture,
                            delivererProfile: delivererProfile,
                            customerProfile: customerProfile),
                        id);
                    Navigator.pushNamed(
                        context, 'dashboard'); // Empty the form fields
                  },
                )
              ],
            )
          ],
        );
      },
    );
  }
}
