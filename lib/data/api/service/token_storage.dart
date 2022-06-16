import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenStorage {
  late final _storage = const FlutterSecureStorage();

  static TokenStorage? _instance;

  TokenStorage._();

  static TokenStorage get instance => _instance ??= TokenStorage._();

  void saveToken(String token) {
    _storage.write(key: "token", value: token);
  }

  Future<String> get tokenOrEmpty async {
    var token = await _storage.read(key: "token");
    if (token == null) return "";
    return token;
  }

  Future<bool> isEmpty() async {
    return _storage.containsKey(key: "token");
  }
}
