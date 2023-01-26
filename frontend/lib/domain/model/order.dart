import 'package:equatable/equatable.dart';

class Order extends Equatable {
  final int id;
  final String productName;
  final double weight;
  final String description;
  final double price;
  final double reward;
  final String status;
  final int delivererID;
  final String picture;
  final int delivererProfile;
  final int customerProfile;

  const Order({
    required this.id,
    required this.productName,
    required this.weight,
    required this.description,
    required this.price,
    required this.reward,
    required this.status,
    required this.delivererID,
    required this.picture,
    required this.delivererProfile,
    required this.customerProfile,
  });

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
        picture,
        delivererProfile,
        customerProfile
      ];
}
