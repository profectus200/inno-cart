class Order {
  final int id;
  final String imageUrl;
  final String productName;
  final int weight;
  final String size;
  final double price;
  final double reward;
  final String contacts;

  Order(
      {required this.id,
      required this.imageUrl,
      required this.productName,
      required this.weight,
      required this.size,
      required this.price,
      required this.reward,
      required this.contacts});
}
