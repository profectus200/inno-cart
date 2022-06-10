import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenStorage {
  static const storage = FlutterSecureStorage();

  static void saveToken(String token) {
    storage.write(key: "token", value: token);
  }

  static Future<String> get tokenOrEmpty async {
    var token = await storage.read(key: "token");
    if (token == null) return "";
    return token;
  }

  static Future<bool> isEmpty() async{
    var token = await storage.read(key: "token");
    return token == null;
  }
}
