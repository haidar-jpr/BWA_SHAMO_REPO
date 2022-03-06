import 'dart:convert';

import 'package:shamo/models/user_model.dart';
import 'package:http/http.dart' as http;

class AuthService {
  String baseURL = 'https://shamo-backend.buildwithangga.id/api';

  Future<User> register({
    String name = '',
    String username = '',
    String email = '',
    String password = '',
  }) async {
    Uri url = Uri.parse('$baseURL/register');
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'name': name,
      'email': email,
      'username': username,
      'password': password,
    });

    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    // print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      User user = User.fromJson(data['user']);
      user.token = 'Bearer ' + data['access_token'];

      return user;
    } else {
      throw Exception('Gagal Register');
    }
  }


  Future<User> login({
    String email = '',
    String password = '',
  }) async {
    Uri url = Uri.parse('$baseURL/login');
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'email': email,
      'password': password,
    });

    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      User user = User.fromJson(data['user']);
      user.token = 'Bearer ' + data['access_token'];

      return user;
    } else {
      throw Exception('Gagal Login!');
    }
  }
}
