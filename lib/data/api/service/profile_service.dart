import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:innocart_front/data/data_storages/data_storage.dart';

import '../model/api_profile.dart';

class ProfileService {
  Future<ApiProfile> getProfile(int id) async {
    Uri url = Uri.parse('http://vldmr314.pythonanywhere.com/api/v1/profiles/$id');
    var token = await DataStorage.instance.getToken;
    var response = await http.get(
      url,
      headers: {'Authorization': 'Token $token'},
    );

    var element = jsonDecode(response.body);
    ApiProfile profile = ApiProfile.fromApi(element);

    return profile;
  }

  Future<int> addProfile(ApiProfile profile) async {
    Uri url = Uri.parse('http://vldmr314.pythonanywhere.com/api/v1/profiles');
    var token = await DataStorage.instance.getToken;
    var response = await http.post(url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Token $token'
        },
        body: jsonEncode(profile.toApi()));
    return response.statusCode;
  }

  Future<int> updateProfile(ApiProfile profile, int id) async {
    Uri url = Uri.parse('http://vldmr314.pythonanywhere.com/api/v1/profiles/$id');
    var token = await DataStorage.instance.getToken;
    var response = await http.put(url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Token $token'
        },
        body: jsonEncode(profile.toApi()));
    return response.statusCode;
  }

  Future<ApiProfile> getMyProfile() async {
    Uri url = Uri.parse('http://vldmr314.pythonanywhere.com/api/v1/my-profile');
    var token = await DataStorage.instance.getToken;
    var response =
        await http.get(url, headers: {'Authorization': 'Token $token'});
    var element = jsonDecode(response.body)[0];
    var profile = ApiProfile.fromApi(element);
    return profile;
  }
}
