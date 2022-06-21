import 'package:flutter/material.dart';
import 'package:innocart_front/presentation/extra/primary_text.dart';
import 'package:innocart_front/presentation/extra/app_colors.dart';
import '../../auth/login_page.dart';
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
            margin: EdgeInsets.only(top: 10 * 3),
            child: Stack(
              children: <Widget>[
                CircleAvatar(
                  radius: 10 * 5,
                  // backgroundImage: AssetImage('assets/images/avatar.png'),
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
                    child: Center(
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
          SizedBox(height: 10 * 2),
          PrimaryText(text: 'Nicolas Adams', size : 28),
          SizedBox(height: 10 * 0.5),
          PrimaryText(text: 'nicolasadams@gmail.com', size: 14),
          SizedBox(height: 10 * 2),
        ],
      ),
    );

    var header = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(width: 10 * 3),
        profileInfo,
        SizedBox(width: 10 * 3),
      ],
    );
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(height: 10 * 5),
          header,
          Expanded(
            child: ListView(
              children: <Widget>[
                ProfileListItem(icon: Icons.list, text: "active orders"),
                ProfileListItem(icon: Icons.history, text: "go to history"),
                GestureDetector(
                    onTap: () => {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MyLogin()))
                    },
                  // onTap: (context, 'login'),
                  child: ProfileListItem(
                    icon: Icons.logout_outlined,
                    text: 'logout',
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