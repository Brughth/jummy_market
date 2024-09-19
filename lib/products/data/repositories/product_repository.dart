import 'package:dio/dio.dart';
import 'package:marketplace/products/data/models/products_model.dart';

class ProductRepository {
  final Dio http;

  ProductRepository({
    required this.http,
  });

  Future<List<ProductsModel>> getProducts() async {
    Response response = await http.get('/products');
    return (response.data as List).map((json) => ProductsModel.fromJson(json)).toList();
  }
}