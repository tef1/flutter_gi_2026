import 'package:flutter/material.dart';
import 'package:flutter_gi_2026/model/shop_app/product.dart';

class ShopAppProvider extends ChangeNotifier {
  List<Product> favoriteProducts = [];

  bool toggleFavoriteProduct(Product pdt) {
    print("im here");
    bool isFavorite = favoriteProducts.contains(pdt);
    if (isFavorite) {
      favoriteProducts.remove(pdt);
      isFavorite = false;
    } else {
      favoriteProducts.add(pdt);
      isFavorite = true;
    }
    notifyListeners();
    return isFavorite;
  }
}
