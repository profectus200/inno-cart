import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class DataStorage {
  late final _storage = const FlutterSecureStorage();

  static DataStorage? _instance;

  DataStorage._();

  static DataStorage get instance => _instance ??= DataStorage._();

  void saveAlias(String alias) {
    _storage.write(key: "alias", value: alias);
  }

  void saveToken(String token) {
    _storage.write(key: "token", value: token);
  }

  void savePersonID(int id) {
    _storage.write(key: "id", value: "$id");
  }

  Future<String> get getAlias async {
    var alias = await _storage.read(key: "alias");
    if (alias == null) return "";
    return alias;
  }

  Future<String> get getToken async {
    var token = await _storage.read(key: "token");
    if (token == null) return "";
    return token;
  }

  Future<int> get getPersonID async {
    var id = await _storage.read(key: "id");
    if (id == null) return -1;
    return int.parse(id);
  }

  Future<bool> isEmpty() async {
    return _storage.containsKey(key: "token");
  }
}
