import 'package:finjoy/core/services/api_service.dart';
import 'package:finjoy/features/auth/models/user_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthRepository {
  final ApiService apiService;
  final storage = const FlutterSecureStorage();

  AuthRepository(this.apiService);

  Future<UserModel> register(String name, String email, String password) async {
    final data = await apiService.post('/auth/register', {
      'name': name,
      'email': email,
      'password': password,
    }, withAuth: false);

    return UserModel.fromJson(data['user']);
  }

  Future<UserModel> login(String email, String password) async {
    final data = await apiService.post('/auth/login', {
      'email': email,
      'password': password,
    }, withAuth:false);

    await storage.write(key: 'jwt_token', value: data['token']);

    return UserModel.fromJson(data['user']);
  }

  Future<void> logout() async {
    await storage.delete(key: 'jwt_token');
  }

  Future<bool> isLoggedIn() async {
    final token = await storage.read(key: 'jwt_token');
    return token != null;
  }
}