import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class FlutterSecureStorageService {
  static const _flutterStorage = FlutterSecureStorage();

  static Future<String?> get({required String key}) async {
    return _flutterStorage.read(key: key);
  }

  static Future<void> set({
    required String key,
    required String value,
  }) async {
    await _flutterStorage.write(key: key, value: value);
  }

  static Future<void> delete({required String key}) async {
    await _flutterStorage.delete(key: key);
  }

  static Future<void> deleteAll() async {
    await _flutterStorage.deleteAll();
  }
}
