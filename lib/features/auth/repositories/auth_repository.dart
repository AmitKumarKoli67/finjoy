import 'dart:convert';

import 'package:finjoy/core/services/api_service.dart';
import 'package:finjoy/features/auth/models/user_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthRepository {
  final ApiService apiService;
  final storage = const FlutterSecureStorage();

  AuthRepository(this.apiService);

  static const _userKey = 'current_user';

  Future<void> _saveUser(UserModel user) async {
    await storage.write(
      key: _userKey,
      value: jsonEncode(user.toJson()),
    );
  }

  Future<UserModel?> getStoredUser() async {
    final value = await storage.read(key: _userKey);

    if (value == null) {
      return null;
    }

    return UserModel.fromJson(jsonDecode(value) as Map<String, dynamic>);
  }

  Future<UserModel> register(String name, String email, String password) async {
    final data = await apiService.post('/auth/register', {
      'name': name,
      'email': email,
      'password': password,
    }, withAuth: false);

    await storage.write(key: 'jwt_token', value: data['token']);

    final user = UserModel.fromJson(data['user']);
    await _saveUser(user);
    return user;
  }

  Future<UserModel> login(String email, String password) async {
    final data = await apiService.post('/auth/login', {
      'email': email,
      'password': password,
    }, withAuth: false);

    await storage.write(key: 'jwt_token', value: data['token']);

    final user = UserModel.fromJson(data['user']);
    await _saveUser(user);
    return user;
  }

  Future<void> logout() async {
    await storage.deleteAll();
  }

  Future<bool> isLoggedIn() async {
    final token = await storage.read(key: 'jwt_token');
    return token != null;
  }
}