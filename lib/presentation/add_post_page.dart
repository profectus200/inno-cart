import 'package:flutter/material.dart';
// import '../internal/dependencies/order_repo_module.dart'
import '../data/api/model/api_order.dart';

class MyAddPost extends StatefulWidget {
  const MyAddPost({Key? key}) : super(key: key);

  @override
  _MyAddPost createState() => _MyAddPost();
}

class _MyAddPost extends State<MyAddPost> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Ejemplo ListView"),
        ),
        body: Text('add_post page')
      ),
    );
  }
}
