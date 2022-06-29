import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:innocart_front/data/api/service/profile_service.dart';
import 'package:innocart_front/data/data_storages/data_storage.dart';

import '../model/api_profile.dart';

class AuthService {
  Future<int> attemptLogIn(String username, String password) async {
    Uri url = Uri.parse('http://10.0.2.2:8000/auth/token/login/');
    var response = await http.post(url,
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({"username": username, "password": password}));
    if (response.statusCode == 200) {
      var token = jsonDecode(response.body);
      DataStorage.instance.saveToken(token["auth_token"]);
      var profile = await ProfileService().getMyProfile();
      DataStorage.instance.savePersonID(profile.user);
      DataStorage.instance.saveProfileID(profile.id);
    }
    return response.statusCode;
  }

  Future<int> attemptSignUp(
      String email, String username, String alias, String password) async {
    Uri url = Uri.parse('http://10.0.2.2:8000/api/v1/authusers/');
    var response = await http.post(url,
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "email": email,
          "username": username,
          "password": password,
        }));
    if (response.statusCode == 201) {
      ApiProfile profile = ApiProfile(
          rating: 5,
          nickname: username,
          dealsCompleted: 0,
          alias: alias,
          id: -1,
          user: -1);
      ProfileService().addProfile(profile);
    }
    return response.statusCode;
  }
}
