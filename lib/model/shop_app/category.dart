import 'package:flutter_gi_2026/model/shop_app/product.dart';

class Category {
  final int id;
  final String name;
  final List<Product> products;

  const Category({
    required this.id,
    required this.name,
    required this.products,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json["id"],
      name: json["name"],
      products: (json["products"] as List)
          .map((e) => Product.fromJson(e))
          .toList(),
    );
  }
}
