class Order {
  final int id;
  final String productName;
  final double weight;
  final String description;
  final double price;
  final double reward;
  final String contacts;

  Order(
      {required this.id,
      required this.productName,
      required this.weight,
      required this.description,
      required this.price,
      required this.reward,
      required this.contacts});
}
