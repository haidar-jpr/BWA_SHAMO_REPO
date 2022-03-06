import 'package:flutter/material.dart';
import 'package:shamo/theme.dart';

import '../components/appbar_chat_page.dart';
import '../components/have_chat.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor3,
      body: Column(
        children: const [
          AppBarChat(),
          HaveChat(),
        ],
      ),
    );
  }
}







