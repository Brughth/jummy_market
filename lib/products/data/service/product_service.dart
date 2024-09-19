import 'package:dio/dio.dart';
import 'package:marketplace/products/data/models/product_query_filter.dart';

class ProductService {
  final Dio http;

  ProductService({required this.http});

  Future<dynamic> getProducts({
    required ProductQueryFilter filter,
  }) async {
    var path = filter.category != null
        ? '/products/category/${filter.category}'
        : '/products';

    path = "$path?limit=${filter.limit}";

    if (filter.skip != null) {
      path = "$path&skip=${filter.skip}";
    }

    if (filter.search != null) {
      path = "$path&search=${filter.search}";
    }

    if (filter.sortBy != null) {
      path = "$path&sortBy=${filter.sortBy}&order=${filter.order}";
    }

    Response response = await http.get(path);
    return response.data;
  }
}
