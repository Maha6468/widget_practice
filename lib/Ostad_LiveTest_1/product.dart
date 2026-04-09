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
      id: json['_id'] ?? '',
      productName: json['ProductName'] ?? 'Unknown',
      productCode: json['ProductCode'] ?? 0,
      img: json['Img'] ?? '',
      qty: json['Qty'] ?? 0,
      unitPrice: (json['UnitPrice'] ?? 0).toDouble(),
      totalPrice: (json['TotalPrice'] ?? 0).toDouble(),
    );
  }
}