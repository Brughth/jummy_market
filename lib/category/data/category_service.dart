// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

class CategoryService {
  final Dio http;

  CategoryService({
    required this.http,
  });

  Future<dynamic> fetchCategories() async {
    Response response = await http.get('/products/category-list');
    return response.data;
  }
}
