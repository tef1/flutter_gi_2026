class Product {
  final String name;
  final double price;
  final String description;
  final String imagePath;
  bool isFavorite = false;

  Product({
    required String this.name,
    required this.price,
    required this.description,
    required this.imagePath,
    required this.isFavorite,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json["name"],
      price: json["price"],
      description: json["description"],
      imagePath: json["imagePath"],
      isFavorite: false,
    );
  }

  @override
  bool operator ==(Object other) {
    // TODO: implement ==
    return this.name == (other as Product).name;
  }

  @override
  int get hashCode => name.hashCode;
}
