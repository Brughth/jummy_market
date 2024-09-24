// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:marketplace/auth/data/models/user_model.dart';
import 'package:marketplace/auth/data/services.dart/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  final AuthService service;

  AuthRepository({
    required this.service,
  });

  Future<UserModel> login({
    required String username,
    required String password,
  }) async {
    var data = await service.login(
      username: username,
      password: password,
    );

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', data['accessToken']);
    await prefs.setString('refreshToken', data['refreshToken']);

    return UserModel.fromJson(data);
  }

  Future<dynamic> getCurrentUser() async {
    var data = await service.getCurrentUser();

    return UserModel.fromJson(data);
  }
}
