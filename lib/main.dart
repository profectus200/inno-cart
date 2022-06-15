import 'package:flutter/material.dart';
import 'package:innocart_front/presentation/dashboard_page.dart';
import 'package:innocart_front/presentation/login_page.dart';
import 'package:innocart_front/presentation/register_page.dart';
import 'package:innocart_front/presentation/navbar.dart';
import 'package:innocart_front/presentation/add_post_page.dart';
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const MyLogin(),
    // home: const CustomizedBottomNavigationbar(),
    routes: {
      'register': (context) => const MyRegister(),
      'login': (context) => const MyLogin(),
      'dashboard': (context) => const CustomizedBottomNavigationbar()
    },
  ));
}
