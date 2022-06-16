import 'package:flutter/material.dart';
import 'package:innocart_front/internal/dependencies/order_repo_module.dart';
import '../domain/model/order.dart';

class MyDashboard extends StatefulWidget {
  const MyDashboard({Key? key}) : super(key: key);

  @override
  _MyDashboard createState() => _MyDashboard();
}

class _MyDashboard extends State<MyDashboard> {
  @override
  Widget build(BuildContext context) {
    Future<List<Order>> orders;

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: const Text("InnoCart"),
            ),
            body: FutureBuilder<List<Order>>(
              future: OrderRepoModule.orderRepository().getOrderList(),
              builder:
                  (BuildContext context, AsyncSnapshot<List<Order>> orderList) {
                if (orderList.hasData &&
                    orderList.connectionState == ConnectionState.done) {
                  return ListView.builder(
                      itemCount: orderList.data!.length,
                      itemBuilder: (context, index) {
                        return ItemWidget(item: orderList.data![index]);
                      });
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            )));
  }
}

class ItemWidget extends StatelessWidget {
  // final Order item;
  // const ItemWidget({Key? key, required this.item}) : super(key: key);
  final Order item;

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
              'https://avatars.mds.yandex.net/i?id=2c9c70afa4ab64820d347a195d161ded-5219960-images-thumbs&n=13&exp=1',
              height: 90,
              width: 90,
            ),
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: Text(item.productName,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18))),
            ),
            subtitle: Center(
                child: Text(item.size,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15))),
            trailing: Text(
              "${item.price}",
              style: const TextStyle(
                  color: Colors.purple,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
