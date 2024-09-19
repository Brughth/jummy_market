import 'package:marketplace/products/data/models/product_query_filter.dart';
import 'package:marketplace/products/data/models/products_model.dart';
import 'package:marketplace/products/data/service/product_service.dart';

class ProductRepository {
  final ProductService service;

  ProductRepository({
    required this.service,
  });

  Future<List<ProductModel>> getProducts({
    required ProductQueryFilter filter,
  }) async {
    final data = await service.getProducts(
      filter: filter,
    );

    return (data['products'] as List)
        .map((json) => ProductModel.fromJson(json))
        .toList();
  }
}
