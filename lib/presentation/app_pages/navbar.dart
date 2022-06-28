import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:innocart_front/presentation/app_pages/my_orders/active_orders.dart';
import 'package:innocart_front/presentation/style/app_colors.dart';

import 'dashboard_page.dart';
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
        return const Text('');
      case 2:
        return const ActiveOrders();
        // return const ActiveOrders();
      // return MessagesPage();
      case 3:
        return const ProfileScreen();
      // return SettingPage();
    }
  }

// * BottomNavigationBar Section Components
  customBottomNavigationBar() {
    return BottomNavyBar(
      backgroundColor: const Color(0xFF1E1F24),
      selectedIndex: index,
      items: [
        BottomNavyBarItem(
          icon: const Icon(Icons.apps),
          title: const Text('Dashboard'),
          activeColor: AppColors.primary,
          inactiveColor: AppColors.lightGray,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
            icon: const Icon(Icons.delivery_dining),
            title: const Text('Deliveries'),
            activeColor: AppColors.primary,
            inactiveColor: AppColors.lightGray,
            textAlign: TextAlign.center),
        BottomNavyBarItem(
          icon: const Icon(Icons.post_add_outlined),
          title: const Text('My orders'),
          activeColor: AppColors.primary,
          inactiveColor: AppColors.lightGray,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: const Icon(Icons.account_circle),
          title: const Text('Profile'),
          activeColor: AppColors.primary,
          inactiveColor: AppColors.lightGray,
          textAlign: TextAlign.center,
        ),
      ],
      onItemSelected: (index) => setState(() => this.index = index),
    );
  }
}
