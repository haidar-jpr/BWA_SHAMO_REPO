import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor1,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Header(
              login: 'Login',
              signIn: 'Sign In to Continue',
            ),
            LoginAcccount(
              name: 'Email Address',
              icon: 'assets/icon_email.png',
              hint: 'Your Email Address',
              obtxt: false,
              margin: 70,
            ),
            LoginAcccount(
              name: 'Password',
              icon: 'assets/icon_password.png',
              hint: 'Your Password',
              obtxt: true,
              margin: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  final String login;
  final String signIn;

  const Header({Key? key, required this.login, required this.signIn})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            login,
            style: primaryTextStyle.copyWith(
              fontWeight: semiBold,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            signIn,
            style: subtitleTextStyle,
          ),
        ],
      ),
    );
  }
}

class LoginAcccount extends StatelessWidget {
  final String name;
  final String icon;
  final String hint;
  final double margin;
  final bool obtxt;

  const LoginAcccount(
      {Key? key,
      required this.name,
      required this.icon,
      required this.margin,
      required this.hint,
      required this.obtxt})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: margin,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            decoration: BoxDecoration(
              color: bgColor2,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Image.asset(
                  icon,
                  width: 18,
                  height: 19,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextFormField(
                    style: primaryTextStyle,
                    obscureText: obtxt,
                    decoration: InputDecoration.collapsed(
                      hintText: hint,
                      hintStyle: subtitleTextStyle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
