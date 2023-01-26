import 'package:flutter/material.dart';
import 'package:innocart_front/presentation/app_pages/my_orders/add_post_page.dart';
import 'package:innocart_front/presentation/app_pages/navbar.dart';
import 'package:innocart_front/presentation/app_pages/my_orders/active_orders.dart';
import 'package:innocart_front/presentation/app_pages/profile/history.dart';
import 'package:innocart_front/presentation/auth/login_page.dart';
import 'package:innocart_front/presentation/auth/register_page.dart';
import 'package:innocart_front/presentation/style/app_theme.dart';



void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const MyLogin(),
    theme: myAppTheme,
    routes: {
      'register': (context) => const MyRegister(),
      'login': (context) => const MyLogin(),
      'dashboard': (context) => const CustomizedBottomNavigationBar(),
      'activeOrders': (context) => const ActiveOrders(),
      'addPost': (context) => const MyAddPost(),
      'history': (context) => const History()
    },
  ));
}
