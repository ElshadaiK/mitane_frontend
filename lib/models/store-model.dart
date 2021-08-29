class Store {
  final String productName;
  final String quantity;
  final int price;

  const Store(
      this.productName, this.quantity, this.price);

  String getProduct() => productName;
  String getQuantity() => quantity;
  int getPrice() => price;
}