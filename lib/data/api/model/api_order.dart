import 'package:equatable/equatable.dart';

class ApiOrder extends Equatable {
  final int id;
  final String productName;
  final double weight;
  final String description;
  final double price;
  final double reward;
  late final String status;
  late int delivererID;
  final String picture;

  ApiOrder({
    required this.id,
    required this.productName,
    required this.weight,
    required this.description,
    required this.price,
    required this.reward,
    required this.status,
    required this.delivererID,
    required this.picture,
  });

  ApiOrder.fromApi(Map<String, dynamic> map)
      : id = map['id'],
        productName = map['product_name'],
        weight = map['weight'],
        description = map['description'],
        price = map['price'],
        reward = map['reward'],
        status = map['status'],
        delivererID = map['deliverer_id'],
        picture = map['picture'];

  Map<String, dynamic> toApi() {
    return {
      'product_name': productName,
      'weight': weight,
      'description': description,
      'price': price,
      'reward': reward,
      'status': status,
      'deliverer_id': delivererID,
      'picture': picture,
    };
  }

  @override
  List<Object> get props => [
        id,
        productName,
        weight,
        description,
        price,
        reward,
        status,
        delivererID,
        picture
      ];
}
