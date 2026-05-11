import 'package:flutter_gi_2026/core/shop_app/api_client.dart';
import 'package:flutter_gi_2026/model/shop_app/category.dart';

class CategoryService {
  final ApiClient apiClient;

  const CategoryService(this.apiClient);

  Future<List<Category>> fetchCategories() async {
    final data = await apiClient.get("/categories");
    return (data as List).map((e) => Category.fromJson(e)).toList();
  }
}
