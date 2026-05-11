import 'package:flutter/material.dart';
import 'package:flutter_gi_2026/model/shop_app/product.dart';
import 'package:flutter_gi_2026/shop_app/screens/product_details.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({
    super.key,
    required this.name,
    required this.products,
    required this.toggleFavoriteProduct,
  });
  final bool Function(Product pdt) toggleFavoriteProduct;
  final String name;
  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(name)),
      body: products.length > 0
          ? ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) => ListTile(
                title: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProductDetails(
                          product: products[index],
                          toggleFavoriteProduct: toggleFavoriteProduct,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple[100],
                      borderRadius: BorderRadius.circular(10),
                    ),

                    child: Text(products[index].name),
                  ),
                ),
              ),
            )
          : Center(child: Text("No Product Found")),
    );
  }
}
