import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:innocart_front/presentation/app_pages/add_post_page.dart';

import 'dashboard/dashboard_page.dart';
import 'profile/profile_page.dart';

class CustomizedBottomNavigationBar extends StatefulWidget {
  const CustomizedBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<CustomizedBottomNavigationBar> createState() =>
      _CustomizedBottomNavigationBarState();
}

class _CustomizedBottomNavigationBarState
    extends State<CustomizedBottomNavigationBar> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodySection(),
      bottomNavigationBar: customBottomNavigationBar(),
    );
  }

// * Body Section Components
  bodySection() {
    switch (index) {
      case 0:
        return const MyDashboard();
      case 1:
        return const MyAddPost();
      case 2:
        return const Text('TBD');
      // return MessagesPage();
      case 3:
        return const ProfileScreen();
      // return SettingPage();
    }
  }

// * BottomNavigationBar Section Components
  customBottomNavigationBar() {
    return BottomNavyBar(
      selectedIndex: index,
      items: [
        BottomNavyBarItem(
          icon: const Icon(Icons.apps),
          title: const Text('Home'),
          activeColor: Colors.red,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
            icon: const Icon(Icons.post_add),
            title: const Text('Post'),
            activeColor: Colors.purpleAccent,
            textAlign: TextAlign.center),
        BottomNavyBarItem(
          icon: const Icon(Icons.message),
          title: const Text('Messages'),
          activeColor: Colors.pink,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: const Icon(Icons.account_circle),
          title: const Text('Profile'),
          activeColor: Colors.blue,
          textAlign: TextAlign.center,
        ),
      ],
      onItemSelected: (index) => setState(() => this.index = index),
    );
  }
}
