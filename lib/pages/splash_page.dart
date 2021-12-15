import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushNamed(context, '/sign-in'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor2,
      body: Center(
        child: Container(
          width: 130,
          height: 150,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/icon_logo.png'),
            ),
          ),
        ),
      ),
    );
  }
}
