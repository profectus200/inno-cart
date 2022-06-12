class ApiOrder {
  final int id;
  final String imageUrl;
  final String productName;
  final int weight;
  final String size;
  final double price;
  final double reward;
  final String contacts;

  ApiOrder(
      {required this.id,
      required this.imageUrl,
      required this.productName,
      required this.weight,
      required this.size,
      required this.price,
      required this.reward,
      required this.contacts});

  ApiOrder.fromApi(Map<String, dynamic> map)
      : id = map['id'],
      imageUrl = map['imageUrl'],
        productName = map['productName'],
        weight = map['weight'],
        size = map['size'],
        price = map['price'],
        reward = map['reward'],
        contacts = map['contacts'];

  Map<String, dynamic> toApi() {
    return {
      'productName': productName,
      'weight': weight,
      'size': size,
      'price': price,
      'reward': reward,
      'contacts': contacts
    };
  }
}
