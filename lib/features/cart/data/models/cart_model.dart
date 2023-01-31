class CartModel {
  final dynamic id;
  final String title;
  final int quantity;
  final num price;
  final String image;

  CartModel(
      {required this.id,
      required this.price,
      required this.quantity,
      required this.title,
      required this.image});
}
