class Price {
  final String productName;
  final String unit;
  final int todayPrice;
  final int dayBeforePrice;

  const Price(
      this.productName, this.unit, this.todayPrice, this.dayBeforePrice);

  String getProduct() => productName;
  String getUnit() => unit;
  int getTodayPrice() => todayPrice;
  int getYesterdayPrice() => dayBeforePrice;
}