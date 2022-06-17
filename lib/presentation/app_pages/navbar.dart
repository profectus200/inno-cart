import 'package:innocart_front/presentation/app_pages/add_post_page.dart';

import 'dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';


class CustomizedBottomNavigationbar extends StatefulWidget {
  const CustomizedBottomNavigationbar({Key? key}) : super(key: key);

  @override
  _CustomizedBottomNavigationbarState createState() =>
      _CustomizedBottomNavigationbarState();
}

class _CustomizedBottomNavigationbarState
    extends State<CustomizedBottomNavigationbar> {
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
    switch (index){
      case 0:
        return MyDashboard();
      case 1 :
        return MyAddPost();
      case 2 :
        // return MessagesPage();
      case 3:
        // return SettingPage();
    }
  }

// * BottomNavigationBar Section Components
  customBottomNavigationBar() {
    return BottomNavyBar(
      selectedIndex: index,
      items: [
        BottomNavyBarItem(
          icon: Icon(Icons.apps),
          title: Text('Home'),
          activeColor: Colors.red,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
            icon: Icon(Icons.post_add),
            title: Text('Post'),
            activeColor: Colors.purpleAccent,
            textAlign: TextAlign.center),
        BottomNavyBarItem(
          icon: Icon(Icons.message),
          title: Text('Messages'),
          activeColor: Colors.pink,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.account_circle),
          title: Text('Profile'),
          activeColor: Colors.blue,
          textAlign: TextAlign.center,
        ),
      ],
      onItemSelected: (index) => setState(() => this.index = index),
    );
  }
}