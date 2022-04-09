class ProductModel {
  String productName;
  String productPrice;

  ProductModel({required this.productName, required this.productPrice});

  Map<String, dynamic> toMap() {
    return {'productName': this.productName, 'productPrice': this.productPrice};
  }
}
