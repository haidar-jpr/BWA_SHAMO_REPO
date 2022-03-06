import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/models/user_model.dart';
import 'package:shamo/providers/auth_provider.dart';
import 'package:shamo/theme.dart';

import '../components/header_edit.dart';
import '../components/input_edit.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    User user = authProvider.user;

    return Scaffold(
      backgroundColor: bgColor3,
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          const HeaderEditProfile(),
          Container(
            width: double.infinity,
            margin: EdgeInsets.all(
              defaultMargin,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(
                    '${user.profilePhotoUrl}',
                    fit: BoxFit.cover,
                    width: 100,
                  ),
                ),
                SizedBox(height: defaultMargin),
                InputEditProfile(
                  name: 'Name',
                  hint: '${user.name}',
                ),
                InputEditProfile(
                  name: 'Username',
                  hint: '@${user.username}',
                ),
                InputEditProfile(
                  name: 'Email Address',
                  hint: '${user.email}',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}