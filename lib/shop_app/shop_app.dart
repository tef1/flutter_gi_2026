import 'package:flutter/material.dart';
import 'package:flutter_gi_2026/core/shop_app/api_client.dart';
import 'package:flutter_gi_2026/model/shop_app/category.dart';
import 'package:flutter_gi_2026/model/shop_app/product.dart';
import 'package:flutter_gi_2026/services/shop_app/category_service.dart';
import 'package:flutter_gi_2026/shop_app/screens/products_list.dart';
import 'package:flutter_gi_2026/shop_app/widgets/cateogry_item.dart';

class ShopApp extends StatefulWidget {
  const ShopApp({super.key});

  @override
  State<ShopApp> createState() => _ShopAppState();
}

class _ShopAppState extends State<ShopApp> {
  List<Product> favoriteProducts = [];
  late List<Widget> screens;
  int activeScreen = 0;

  bool toggleFavoriteProduct(Product pdt) {
    if (favoriteProducts.contains(pdt)) {
      favoriteProducts.remove(pdt);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Removed to Fav Pdts")));
      return false;
    } else {
      favoriteProducts.add(pdt);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Added to Fav Pdts")));
    }
    return true;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    screens = [
      CategoriesScreen(toggleFavoriteProduct: toggleFavoriteProduct),
      ProductsList(
        name: "Favorite Product",
        products: favoriteProducts,
        toggleFavoriteProduct: toggleFavoriteProduct,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[activeScreen],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            activeScreen = value;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorite",
          ),
        ],
      ),
    );
  }
}

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key, required this.toggleFavoriteProduct});
  final bool Function(Product pdt) toggleFavoriteProduct;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  CategoryService categoryService = CategoryService(ApiClient());
  late bool isLoading;
  List<Category> categories = [];

  @override
  void initState() {
    super.initState();
    isLoading = true;
    _getCategories();
  }

  Future<void> _getCategories() async {
    try {
      categories = await categoryService.fetchCategories();
      setState(() {
        isLoading = false;
      });
      print("isLoading $isLoading");
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _getCategories,
      child: isLoading
          ? Center(child: CircularProgressIndicator())
          : Center(
              child: ListView.builder(
                itemCount: categories.length,
                itemBuilder: (context, index) => CategoryItem(
                  category: categories[index],
                  toggleFavoriteProduct: widget.toggleFavoriteProduct,
                ),
              ),
            ),
    );
  }
}
