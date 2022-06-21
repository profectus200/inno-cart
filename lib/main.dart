import 'package:flutter/material.dart';
import 'package:innocart_front/presentation/app_pages/navbar.dart';
import 'package:innocart_front/presentation/auth/login_page.dart';
import 'package:innocart_front/presentation/auth/register_page.dart';
import 'package:innocart_front/presentation/app_pages/profile/profile_page.dart';
void main() {

  runApp(
      // ProfileScreen()
// MyApp()
      MaterialApp(
    debugShowCheckedModeBanner: false,
    // home: const MyLogin(),
    home: MyLogin(),
    routes: {
      'register': (context) => const MyRegister(),
      'login': (context) => const MyLogin(),
      'dashboard': (context) => const CustomizedBottomNavigationbar()
    },
  )
  );
}
