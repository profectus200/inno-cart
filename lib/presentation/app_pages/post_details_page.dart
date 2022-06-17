import 'package:flutter/material.dart';
import '../extra/primary_text.dart';
import '../extra/app_colors.dart';

class PostDetail extends StatelessWidget {
  // final String imagePath;
  // PostDetail(this.imagePath);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ConstrainedBox(
        constraints:
        BoxConstraints(minWidth: MediaQuery.of(context).size.width - 40),
        child: ElevatedButton(
          onPressed: () => {},
          style: ElevatedButton.styleFrom(
              primary: AppColors.primary,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              textStyle: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              PrimaryText(
                text: 'Place an Order',
                fontWeight: FontWeight.w600,
                size: 18,
              ),
              Icon(Icons.chevron_right)
            ],
          ),
        ),
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
                const PrimaryText(
                  text: 'Primavera \nPizza',
                  size: 45,
                  fontWeight: FontWeight.w600,
                ),
                const SizedBox(height: 30),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      'https://avatars.mds.yandex.net/i?id=2c9c70afa4ab64820d347a195d161ded-5219960-images-thumbs&n=13&exp=1',
                      // height: 90,
                      width: 15,
                    ),
                    // SvgPicture.asset(
                    //   'assets/dollar.svg',
                    //   color: AppColors.tertiary,
                    //   width: 15,
                    // ),
                    const PrimaryText(
                      text: '5.99',
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
                          children: const [
                            PrimaryText(
                              text: 'Size',
                              color: AppColors.lightGray,
                              size: 16,
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            PrimaryText(
                                text: 'Medium 14"',
                                fontWeight: FontWeight.w600),
                            SizedBox(
                              height: 20,
                            ),
                            PrimaryText(
                              text: 'Crust',
                              color: AppColors.lightGray,
                              size: 16,
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            PrimaryText(
                                text: 'Thin Crust',
                                fontWeight: FontWeight.w600),
                            SizedBox(
                              height: 20,
                            ),
                            PrimaryText(
                              text: 'Delivery in',
                              color: AppColors.lightGray,
                              size: 16,
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            PrimaryText(
                                text: '30 min', fontWeight: FontWeight.w600),
                          ]),
                    ),
                    Hero(
                      tag: "imagePath",
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [BoxShadow(color: Colors.grey.shade400, blurRadius: 30),],
                          borderRadius: BorderRadius.circular(100),
                        ),
                        height: 200,
                        child:
                        Image.network(
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
                const PrimaryText(
                    text: 'Ingredients', fontWeight: FontWeight.w700, size: 22),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
          const SizedBox(height: 100,)
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
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(width: 1, color: Colors.grey.shade400)),
              child: const Icon(Icons.chevron_left),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Icon(Icons.attach_money, color: AppColors.white),
          ),
        ],
      ),
    );
  }
}