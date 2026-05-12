import 'package:flutter/material.dart';
import 'package:flutter_gi_2026/core/shop_app/app_config.dart';
import 'package:flutter_gi_2026/model/shop_app/product.dart';
import 'package:flutter_gi_2026/providers/shop_app/shop_app_provider.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatefulWidget {
  ProductDetails({
    super.key,
    required this.product,
    required this.toggleFavoriteProduct,
  });
  final bool Function(Product pdt) toggleFavoriteProduct;
  final Product product;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.product.name)),
      body: ListView(
        children: [
          Image.network(
            "${AppConfig.imageURL}/${widget.product.imagePath}",
            height: 350,
            fit: BoxFit.cover,
          ),
          IconButton(
            onPressed: () {
              setState(() {
                // widget.product.isFavorite = widget.toggleFavoriteProduct(
                //   widget.product,
                // );
                widget.product.isFavorite = context
                    .read<ShopAppProvider>()
                    .toggleFavoriteProduct(widget.product);
              });
            },
            icon: Icon(
              Icons.favorite,
              size: 40,
              color: widget.product.isFavorite ? Colors.red : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
