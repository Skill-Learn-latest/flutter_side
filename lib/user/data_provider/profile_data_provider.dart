import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:skill_learn_client/user/models/user.dart';
import 'package:http/http.dart' as http;

class ProfileDataProvider {
  static final String _baseUrl = "http://10.0.2.2:3000/auth";
  Future<User> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? id = prefs.getString("id");
    String? token = prefs.getString("accessToken");

    final http.Response response = await http.get(Uri.parse(_baseUrl + "/$id"),
        headers: <String, String>{
          "x-access-token": token != null ? token : ""
        });

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      return User();
    }
  }

  Future<User> updateUser(User user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? id = prefs.getString("id");
    String? token = prefs.getString("accessToken");

    final http.Response response = await http.put(Uri.parse(_baseUrl + "/$id"),
        headers: <String, String>{
          "x-access-token": token != null ? token : "",
          "Content-Type": "application/json"
        },
        body: jsonEncode({
          'username': user.username,
          'firstname': user.firstName,
          'lastname': user.lastName,
          'email': user.email
        }));

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Profile update failed");
    }
  }
}
