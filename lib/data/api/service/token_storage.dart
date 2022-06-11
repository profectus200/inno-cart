import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenStorage {
  static const storage = FlutterSecureStorage();

  void saveToken(String token) {
    storage.write(key: "token", value: token);
  }

  Future<String> get tokenOrEmpty async {
    var token = await storage.read(key: "token");
    if (token == null) return "";
    return token;
  }

  Future<bool> isEmpty() async{
    return storage.containsKey(key: "token");
  }
}
