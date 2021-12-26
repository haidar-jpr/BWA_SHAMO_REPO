import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor3,
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          HeaderEditProfile(),
          Container(
            width: double.infinity,
            margin: EdgeInsets.all(
              defaultMargin,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icon_default_wall.png',
                  width: 100,
                ),
                SizedBox(height: defaultMargin),
                InputEditProfile(
                  name: 'Name',
                  hint: 'Subhan Ikraam Haidar',
                ),
                InputEditProfile(
                  name: 'Username',
                  hint: '@Haidar',
                ),
                InputEditProfile(
                  name: 'Email Address',
                  hint: 'haidar.dod@gmail.com',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class InputEditProfile extends StatelessWidget {
  const InputEditProfile({
    Key? key,
    required this.name,
    required this.hint,
  }) : super(key: key);

  final String name;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: subtitleTextStyle.copyWith(
            fontSize: 13,
          ),
        ),
        SizedBox(height: 4),
        TextFormField(
          style: primaryTextStyle,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: primaryTextStyle.copyWith(
              fontSize: 16,
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: subtitleTextColor,
              ),
            ),
          ),
        ),
        SizedBox(height: 24),
      ],
    );
  }
}

class HeaderEditProfile extends StatelessWidget {
  const HeaderEditProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: bgColor1,
      elevation: 0,
      title: Text(
        'Edit Profile',
        style: primaryTextStyle.copyWith(
          fontWeight: medium,
          fontSize: 18,
        ),
      ),
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.close,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.check,
            color: primaryColor,
          ),
        ),
      ],
    );
  }
}
