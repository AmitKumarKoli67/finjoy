import 'dart:convert';

import 'package:finjoy/core/services/api_service.dart';
import 'package:finjoy/features/auth/models/user_model.dart';
import 'package:finjoy/features/auth/repositories/auth_repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  FlutterSecureStorage.setMockInitialValues({});

  group('AuthRepository', () {
    test('stores and restores a user from secure storage', () async {
      final repo = AuthRepository(ApiService());
      final user = UserModel(
        id: 'user-123',
        name: 'Jane Doe',
        email: 'jane@example.com',
      );

      await repo.storage.write(
        key: 'current_user',
        value: jsonEncode(user.toJson()),
      );

      final storedUser = await repo.getStoredUser();

      expect(storedUser, isNotNull);
      expect(storedUser?.id, 'user-123');
      expect(storedUser?.name, 'Jane Doe');
      expect(storedUser?.email, 'jane@example.com');

      await repo.logout();
    });
  });
}
