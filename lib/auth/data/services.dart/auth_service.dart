// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

class AuthService {
  final Dio http;

  AuthService({
    required this.http,
  });

  Future<dynamic> login({
    required String username,
    required String password,
  }) async {
    Response response = await http.post('/user/login');
    return response.data;
  }
}
