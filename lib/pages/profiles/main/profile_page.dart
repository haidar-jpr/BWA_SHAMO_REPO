import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';

import '../components/content_profile.dart';
import '../components/header_profile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor3,
      body: Column(
        children: [
          HeaderProfile(),
          ContentProfile(),
        ],
      ),
    );
  }
}