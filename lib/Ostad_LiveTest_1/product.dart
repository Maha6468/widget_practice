class Product {
  final String id;
  final String productName;
  final int productCode;
  final String img;
  final int qty;
  final double unitPrice;
  final double totalPrice;

  Product({
    required this.id,
    required this.productName,
    required this.productCode,
    required this.img,
    required this.qty,
    required this.unitPrice,
    required this.totalPrice,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'].toString(),
      productName: json['title'] ?? 'Unknown',
      productCode: json['id'] ?? 0,
      img: json['image'] ?? '',
      qty: 1,
      unitPrice: (json['price'] ?? 0).toDouble(),
      totalPrice: (json['price'] ?? 0).toDouble(),
    );
  }
}