import 'package:flutter/material.dart';
import 'package:innocart_front/presentation/app_pages/navbar.dart';
import 'package:innocart_front/presentation/app_pages/profile/active_orders.dart';
import 'package:innocart_front/presentation/auth/login_page.dart';
import 'package:innocart_front/presentation/auth/register_page.dart';
import 'package:innocart_front/presentation/extra/app_colors.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const MyLogin(),
    theme: ThemeData(
      // Define the default brightness and colors.
      // brightness: Brightness.,
      primaryColor: AppColors.primary,

      // Define the default font family.
      fontFamily: 'Poppins',
    ),
    routes: {
      'register': (context) => const MyRegister(),
      'login': (context) => const MyLogin(),
      'dashboard': (context) => const CustomizedBottomNavigationBar(),
      'activeOrders': (context) => const ActiveOrders()
    },
  ));
}

