import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:innocart_front/data/api/service/token_storage.dart';

import '../model/api_profile.dart';

class ProfileService {
  Future<ApiProfile> getProfile(int id) async {
    Uri url = Uri.parse('http://10.0.2.2:8000/api/v1/profiles/$id');
    var token = await TokenStorage.instance.tokenOrEmpty;
    var response = await http.get(
      url,
      headers: {'Authorization': 'Token $token'},
    );

    var element = jsonDecode(response.body);
    ApiProfile profile = ApiProfile.fromApi(element);

    return profile;
  }

  Future<int> addProfile(ApiProfile profile) async {
    Uri url = Uri.parse('http://10.0.2.2:8000/api/v1/profiles');
    var token = await TokenStorage.instance.tokenOrEmpty;
    var response = await http.post(url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Token $token'
        },
        body: jsonEncode(profile.toApi()));
    return response.statusCode;
  }

  Future<int> updateProfile(ApiProfile profile, int id) async {
    //Working?
    Uri url = Uri.parse('http://10.0.2.2:8000/api/v1/profiles/$id');
    var token = await TokenStorage.instance.tokenOrEmpty;
    var response = await http.post(url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Token $token'
        },
        body: jsonEncode(profile.toApi()));
    return response.statusCode;
  }
}
