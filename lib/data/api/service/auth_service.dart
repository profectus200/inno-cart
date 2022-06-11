import 'package:http/http.dart' as http;
import 'package:innocart_front/data/api/service/token_storage.dart';

class AuthService {
  late final TokenStorage _tokenStorage;

  AuthService(this._tokenStorage);

  void attemptLogIn(String username, String password) async {
    Uri url = Uri.parse('http://10.0.2.2:8000/auth/token/login/');
    var res = await http
        .post(url, body: {"username": username, "password": password});
    if (res.statusCode == 200) _tokenStorage.saveToken(res.body);
    return null;
  }

  Future<int> attemptSignUp(String username, String password) async {
    Uri url = Uri.parse('http://10.0.2.2:8000/api/v1/authusers/');
    var res = await http
        .post(url, body: {"username": username, "password": password});
    return res.statusCode;
  }

  Future<bool> isStorageEmpty() async {
    Future<bool> token = _tokenStorage.isEmpty();
     return _tokenStorage.isEmpty();
  }
}
