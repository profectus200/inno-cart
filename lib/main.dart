import 'package:flutter/material.dart';
import 'package:innocart_front/presentation/app_pages/add_post_page.dart';
import 'package:innocart_front/presentation/app_pages/navbar.dart';
import 'package:innocart_front/presentation/app_pages/active_orders.dart';
import 'package:innocart_front/presentation/auth/login_page.dart';
import 'package:innocart_front/presentation/auth/register_page.dart';
import 'package:innocart_front/presentation/extra/constants.dart';



void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const MyLogin(),
    theme: kLightTheme,
    routes: {
      'register': (context) => const MyRegister(),
      'login': (context) => const MyLogin(),
      'dashboard': (context) => const CustomizedBottomNavigationBar(),
      'activeOrders': (context) => const ActiveOrders(),
      'addPost': (context) => const MyAddPost()
    },
  ));
}

