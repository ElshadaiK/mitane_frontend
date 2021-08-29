class Store {
  final String productName;
  final int quantity;
  final int price;

  const Store(
      this.productName, this.quantity, this.price);

  String getProduct() => productName;
  int getQuantity() => quantity;
  int getPrice() => price;
}