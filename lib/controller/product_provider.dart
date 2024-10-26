import 'package:dhanwis_machine_test/model/fasion_model.dart';
import 'package:dhanwis_machine_test/services/product_services.dart';
import 'package:flutter/material.dart';


class ProductProvider with ChangeNotifier {
  List<Product> _products = [];
  bool _isLoading = false;
  bool _isLoadingMore = false;
  int _currentPage = 1;

  List<Product> get products => _products;
  bool get isLoading => _isLoading;
  bool get isLoadingMore => _isLoadingMore;

  Future<void> fetchProducts() async {
    _isLoading = true;
    notifyListeners();

    final fetchedProducts = await ApiService.fetchProducts(_currentPage);
    _products = fetchedProducts;
    _isLoading = false;
    notifyListeners();
  }

  Future<void> loadMoreProducts() async {
    if (_isLoadingMore) return;

    _isLoadingMore = true;
    _currentPage += 1;
    notifyListeners();

    final fetchedProducts = await ApiService.fetchProducts(_currentPage);
    _products.addAll(fetchedProducts);
    _isLoadingMore = false;
    notifyListeners();
  }
}
