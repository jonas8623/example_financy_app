import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  SecureStorage._();
  static final SecureStorage _instance = SecureStorage._();
  factory SecureStorage() => _instance;
  final _secureStorage = const FlutterSecureStorage();

  Future<void> write({required String key, required String value}) async {
    await _secureStorage.write(key: key, value: value);
  }

  Future<String?> readOne({required String key}) async {
    String? result = await _secureStorage.read(key: key);
    return result;
  }

  Future<Map<String, String>> readAll() async {
    final result = await _secureStorage.readAll();
    return result;
  }

  Future<void> deleteOne({required String key}) async {
    await _secureStorage.delete(key: key);
  }

  Future<void> deleteAll() async {
    await _secureStorage.deleteAll();
  }
}
