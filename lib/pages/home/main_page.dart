import 'package:flutter/material.dart';
import 'package:shamo/pages/home/chat_page.dart';
import 'package:shamo/pages/home/home_page.dart';
import 'package:shamo/pages/home/profile_page.dart';
import 'package:shamo/pages/home/wishtlist_page.dart';
import 'package:shamo/theme.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  Widget body() {
    switch (currentIndex) {
      case 0:
        return HomePage();

      case 1:
        return ChatPage();

      case 2:
        return WishlistPage();

      case 3:
        return ProfilePage();

      default:
        return HomePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor1,
      floatingActionButton: _floatingButton(),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      bottomNavigationBar: _bottomNavBar(),
      body: body(),
    );
  }

  ClipRRect _bottomNavBar() {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(
        top: Radius.circular(20),
      ),
      child: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: bgColor4,
          items: [
            BottomNavigationBarItem(
              icon: IconNavBar(
                url: 'assets/icon_home.png',
                width: 21,
                paddingRight: 0,
                paddingLeft: 0,
                color: currentIndex == 0 ? primaryColor : indexColor,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: IconNavBar(
                url: 'assets/icon_open_chat.png',
                width: 20,
                paddingLeft: 0,
                paddingRight: 44,
                color: currentIndex == 1 ? primaryColor : indexColor,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: IconNavBar(
                url: 'assets/icon_favorite.png',
                width: 20,
                paddingLeft: 44,
                paddingRight: 0,
                color: currentIndex == 2 ? primaryColor : indexColor,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: IconNavBar(
                url: 'assets/icon_profile.png',
                width: 18,
                paddingLeft: 0,
                paddingRight: 0,
                color: currentIndex == 3 ? primaryColor : indexColor,
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }

  FloatingActionButton _floatingButton() {
    return FloatingActionButton(
      onPressed: () {},
      backgroundColor: secondaryColor,
      child: Image.asset(
        'assets/icon_cart.png',
        width: 20,
      ),
    );
  }
}

class IconNavBar extends StatelessWidget {
  final String url;
  final double width;
  final double paddingRight;
  final double paddingLeft;
  final Color color;
  const IconNavBar({
    Key? key,
    required this.url,
    required this.width,
    required this.paddingRight,
    required this.paddingLeft,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 17,
        bottom: 5,
      ),
      padding: EdgeInsets.only(
        right: paddingRight,
        left: paddingLeft,
      ),
      child: Image.asset(
        url,
        width: width,
        color: color,
      ),
    );
  }
}
