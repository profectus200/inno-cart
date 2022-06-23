import 'package:flutter/material.dart';
import 'package:innocart_front/presentation/extra/app_colors.dart';
import 'package:innocart_front/presentation/extra/primary_text.dart';

import '../../auth/login_page.dart';
import 'active_orders.dart';
import 'profile_list_item.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ScreenUtil.init(context);
    var profileInfo = Expanded(
      child: Column(
        children: <Widget>[
          Container(
            height: 10 * 10,
            width: 10 * 10,
            margin: const EdgeInsets.only(top: 10 * 3),
            child: Stack(
              children: <Widget>[
                const CircleAvatar(
                  radius: 10 * 5,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height: 10 * 2.5,
                    width: 10 * 2.5,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onSecondary,
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      heightFactor: 10 * 1.5,
                      widthFactor: 10 * 1.5,
                      child: Icon(
                        Icons.pending,
                        color: AppColors.black,
                        // size: ScreenUtil().setSp(10 * 1.5),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10 * 2),
          const PrimaryText(text: 'Nicolas Adams', size: 28),
          const SizedBox(height: 10 * 0.5),
          const PrimaryText(text: 'nicolasadams@gmail.com', size: 14),
          const SizedBox(height: 10 * 2),
        ],
      ),
    );

    var header = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(width: 10 * 3),
        profileInfo,
        const SizedBox(width: 10 * 3),
      ],
    );
    return Scaffold(
      body: Column(
        children: <Widget>[
          const SizedBox(height: 10 * 5),
          header,
          Expanded(
            child: ListView(
              children: <Widget>[
                GestureDetector(
                    onTap: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ActiveOrders()))
                        },
                    child: const ProfileListItem(
                        icon: Icons.list, text: "Active orders")),
                const ProfileListItem(icon: Icons.history, text: "Go to history"),
                GestureDetector(
                  onTap: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyLogin()))
                  },
                  child: const ProfileListItem(
                    icon: Icons.logout_outlined,
                    text: 'Logout',
                    hasNavigation: false,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
