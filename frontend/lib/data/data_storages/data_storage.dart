import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class DataStorage {
  late final _storage = const FlutterSecureStorage();

  static DataStorage? _instance;

  DataStorage._();

  static DataStorage get instance => _instance ??= DataStorage._();

  void saveProfileID(int id) {
    _storage.write(key: "profile_id", value: "$id");
  }

  void saveToken(String token) {
    _storage.write(key: "token", value: token);
  }

  void savePersonID(int id) {
    _storage.write(key: "person_id", value: "$id");
  }

  Future<String> get getProfileID async {
    var id = await _storage.read(key: "profile_id");
    if (id == null) return "";
    return id;
  }

  Future<String> get getToken async {
    var token = await _storage.read(key: "token");
    if (token == null) return "";
    return token;
  }

  Future<int> get getPersonID async {
    var id = await _storage.read(key: "person_id");
    if (id == null) return -1;
    return int.parse(id);
  }
}
