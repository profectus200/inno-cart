import 'package:flutter/material.dart';
import 'package:innocart_front/presentation/app_pages/my_orders/add_post_page.dart';
import 'package:innocart_front/presentation/app_pages/navbar.dart';
import 'package:innocart_front/presentation/app_pages/my_orders/active_orders.dart';
import 'package:innocart_front/presentation/auth/login_page.dart';
import 'package:innocart_front/presentation/auth/register_page.dart';



void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const CustomizedBottomNavigationBar(),
    theme: ThemeData(
      scaffoldBackgroundColor: const Color(0xFF1E1F24),
      appBarTheme: const AppBarTheme(
        color: Color(0xFF1E1F24),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      colorScheme: const ColorScheme.light(
        primary: Color(0xFF1E1F24),
        onPrimary: Color(0xFF1E1F24),
        secondary: Colors.red,
      ),
      cardTheme: const CardTheme(
        color: Color(0xFF1E1F24),
      ),
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      textTheme: const TextTheme(
        subtitle1: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
        ),
        subtitle2: TextStyle(
          color: Colors.white,
          fontSize: 18.0,
        ),
      ),
    ),
    routes: {
      'register': (context) => const MyRegister(),
      'login': (context) => const MyLogin(),
      'dashboard': (context) => const CustomizedBottomNavigationBar(),
      'activeOrders': (context) => const ActiveOrders(),
      'addPost': (context) => const MyAddPost()
    },
  ));
}
