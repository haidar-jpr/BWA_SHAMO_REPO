import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor1,
      resizeToAvoidBottomInset: false,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Header(
              login: 'Sign Up',
              signIn: 'Register and Happy Shoping',
            ),
            const SignUpAcccount(
              name: 'Full Name',
              icon: 'assets/icon_name.png',
              hint: 'Your Full Name',
              obtxt: false,
              margin: 50,
            ),
            const SignUpAcccount(
              name: 'Username',
              icon: 'assets/icon_username.png',
              hint: 'Your Username',
              obtxt: false,
              margin: 20,
            ),
            const SignUpAcccount(
              name: 'Email Address',
              icon: 'assets/icon_email.png',
              hint: 'Your Email Address',
              obtxt: false,
              margin: 20,
            ),
            const SignUpAcccount(
              name: 'Password',
              icon: 'assets/icon_password.png',
              hint: 'Your Password',
              obtxt: true,
              margin: 20,
            ),
            SignUpButton(
              txt: 'Sign Up',
              to: () {
                Navigator.pushReplacementNamed(context, '/home');
              },
            ),
            const Spacer(),
            ToSignIn(
              txt1: 'Already have an account?',
              txt2: 'Sign In',
              to: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ToSignIn extends StatelessWidget {
  final String txt1;
  final String txt2;
  final VoidCallback to;

  const ToSignIn({
    Key? key,
    required this.txt1,
    required this.txt2,
    required this.to,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            txt1,
            style: subtitleTextStyle.copyWith(
              fontWeight: medium,
              fontSize: 12,
            ),
          ),
          TextButton(
            onPressed: to,
            child: Text(
              txt2,
              style: primaryTextStyle.copyWith(
                fontWeight: semiBold,
                color: primaryColor,
                fontSize: 12,
              ),
            ),
          ),
        ],
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

class SignUpAcccount extends StatelessWidget {
  final String name;
  final String icon;
  final String hint;
  final double margin;
  final bool obtxt;

  const SignUpAcccount(
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

class SignUpButton extends StatelessWidget {
  final String txt;
  final VoidCallback to;

  const SignUpButton({Key? key, required this.txt, required this.to})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 30,
      ),
      width: double.infinity,
      height: 50,
      child: TextButton(
        onPressed: to,
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: primaryColor,
        ),
        child: Text(
          txt,
          style: primaryTextStyle.copyWith(
            fontSize: 16,
            fontWeight: medium,
          ),
        ),
      ),
    );
  }
}
