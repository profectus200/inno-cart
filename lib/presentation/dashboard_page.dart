import 'package:flutter/material.dart';
// import '../internal/dependencies/order_repo_module.dart'
import '../data/api/model/api_order.dart';

class MyDashboard extends StatefulWidget {
  const MyDashboard({Key? key}) : super(key: key);

  @override
  _MyDashboard createState() => _MyDashboard();
}

class _MyDashboard extends State<MyDashboard> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Ejemplo ListView"),
        ),
        body: ListView.builder(
            itemCount: CatalogModel.orders.length,
            itemBuilder: (context, index) {
              return ItemWidget(item: CatalogModel.orders[index]);
            }),
      ),
    );
  }
}

class CatalogModel {
  static final orders = [
    ApiOrder(id: 1, imageUrl: "https://picsum.photos/id/213/4928/3264", productName: "pizza", weight: 1, size:"45x45cm", price: 10, reward:5, contacts: "robiul"),
    ApiOrder(id: 2, imageUrl: "https://picsum.photos/id/213/4928/3264", productName: "pizza", weight: 1, size:"45x45cm", price: 10, reward:5, contacts: "robiul"),
    ApiOrder(id: 3, imageUrl: "https://picsum.photos/id/213/4928/3264", productName: "pizza", weight: 1, size:"45x45cm", price: 10, reward:5, contacts: "robiul")
  ];
}


class ItemWidget extends StatelessWidget {
  final ApiOrder item;
  const ItemWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 0,
        color: Colors.cyan,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Image.network(
              item.imageUrl,
              height: 90,
              width: 90,
            ),
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: Text(item.productName, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18))),
            ),
            subtitle: Center(child: Text(item.size, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15))),
            trailing: Text(
              "${item.price}",
              style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
