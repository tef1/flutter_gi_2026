import 'dart:convert';

import 'package:flutter_gi_2026/core/shop_app/app_config.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  Future<dynamic> get(String endPoint) async {
    Uri url = Uri.parse("${AppConfig.baseURL}$endPoint");
    final response = await http.get(url);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return jsonDecode(response.body);
    } else {
      throw Exception("API Error ${response.statusCode}");
    }
  }
}
