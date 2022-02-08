import 'package:flutter/material.dart';
import 'package:shamo/models/user_model.dart';
import 'package:shamo/services/auth_service.dart';

class AuthProvider with ChangeNotifier{

  late User _user;

  User get user => _user;

  set user(User user){
    _user = user;
    notifyListeners();
  }

  Future<bool> register({String name = '', String username = '', String email = '', String password = ''}) async {
    try {
      User user = await AuthService().register(
        name: name,
        email: email,
        username: username,
        password: password,
      );

      _user = user;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

}