import 'package:flutter/material.dart';
import 'package:innocart_front/presentation/style/app_colors.dart';
import 'package:innocart_front/presentation/style/primary_text.dart';
import '../../../domain/model/profile.dart';
import '../../../internal/dependencies/profile_repo_module.dart';
import '../../auth/login_page.dart';
import 'profile_list_item.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  backgroundColor: Color(0xFF23232D),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height: 10 * 2.5,
                    width: 10 * 2.5,
                    decoration: const BoxDecoration(
                      color: AppColors.lightGray,
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
          FutureBuilder<Profile>(
            future: ProfileRepoModule.profileRepository().getMyProfile(),
            builder: (BuildContext context, AsyncSnapshot<Profile> profile) {
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
          const SizedBox(height: 10 * 0.5),
          //
          FutureBuilder<Profile>(
            future: ProfileRepoModule.profileRepository().getMyProfile(),
            builder: (BuildContext context, AsyncSnapshot<Profile> profile) {
              if (profile.hasData &&
                  profile.connectionState == ConnectionState.done) {
                return PrimaryText(text: profile.data!.alias, size: 16);
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
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
                    Navigator.pushNamed(context, 'history')
                  },
                  child: const ProfileListItem(
                    icon: Icons.history,
                    text: "Go to history",
                    hasNavigation: true,
                  ),
                ),
                GestureDetector(
                  onTap: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyLogin()))
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
