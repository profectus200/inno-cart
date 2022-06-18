import 'package:flutter/material.dart';
import 'package:innocart_front/presentation/app_pages/navbar.dart';
import 'package:innocart_front/presentation/auth/login_page.dart';
import 'package:innocart_front/presentation/auth/register_page.dart';
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
