import 'dart:convert';
import 'package:dhanwis_machine_test/model/fasion_model.dart';
import 'package:http/http.dart' as http;


class ApiService {
  static const String _baseUrl = 'https://fakestoreapi.com';

  
  static Future<List<Product>> fetchProducts(int page) async {
    try {
   
      final response = await http.get(Uri.parse('$_baseUrl/products?limit=10&page=$page'));

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        
        return jsonData.map((json) => Product.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      throw Exception('Failed to load products: $e');
    }
  }
}
