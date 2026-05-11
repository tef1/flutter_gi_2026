import 'package:flutter/material.dart';
import 'package:flutter_gi_2026/model/shop_app/category.dart';
import 'package:flutter_gi_2026/model/shop_app/product.dart';
import 'package:flutter_gi_2026/shop_app/screens/products_list.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.category,
    required this.toggleFavoriteProduct,
  });
  final bool Function(Product pdt) toggleFavoriteProduct;

  final Category category;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ProductsList(
                name: category.name,
                products: category.products,
                toggleFavoriteProduct: toggleFavoriteProduct,
              ),
            ),
          );
        },
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(10),
          ),

          child: Text(category.name),
        ),
      ),
    );
  }
}
