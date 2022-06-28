import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenStorage {
  late final _storage = const FlutterSecureStorage();

  static TokenStorage? _instance;

  TokenStorage._();

  static TokenStorage get instance => _instance ??= TokenStorage._();

  void saveToken(String token) {
    _storage.write(key: "token", value: token);
  }

  void saveID(int id) {
    _storage.write(key: "id", value: "$id");
  }

  Future<String> get getToken async {
    var token = await _storage.read(key: "token");
    if (token == null) return "";
    return token;
  }

  Future<int> get getID async {
    var id = await _storage.read(key: "id");
    if (id == null) return -1;
    return int.parse(id);
  }

  Future<bool> isEmpty() async {
    return _storage.containsKey(key: "token");
  }
}
