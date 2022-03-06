import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/pages/chats/main/chat_page.dart';
import 'package:shamo/pages/home/main/home_page.dart';
import 'package:shamo/pages/profiles/main/profile_page.dart';
import 'package:shamo/pages/wishlist/main/wishtlist_page.dart';
import 'package:shamo/providers/page_provider.dart';
import 'package:shamo/theme.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    PageProvider pageProvider = Provider.of<PageProvider>(context);

    

    Widget _bottomNavBar() {
      return ClipRRect(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(20),
        ),
        child: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 8,
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
            currentIndex: pageProvider.currentIndex,
            onTap: (value) {
              pageProvider.currentIndex = value;
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
                  color: pageProvider.currentIndex == 0
                      ? primaryColor
                      : indexColor,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: IconNavBar(
                  url: 'assets/icon_open_chat.png',
                  width: 20,
                  paddingLeft: 0,
                  paddingRight: 44,
                  color: pageProvider.currentIndex == 1
                      ? primaryColor
                      : indexColor,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: IconNavBar(
                  url: 'assets/icon_favorite.png',
                  width: 20,
                  paddingLeft: 44,
                  paddingRight: 0,
                  color: pageProvider.currentIndex == 2
                      ? primaryColor
                      : indexColor,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: IconNavBar(
                  url: 'assets/icon_profile.png',
                  width: 18,
                  paddingLeft: 0,
                  paddingRight: 0,
                  color: pageProvider.currentIndex == 3
                      ? primaryColor
                      : indexColor,
                ),
                label: '',
              ),
            ],
          ),
        ),
      );
    }

    Widget body() {
      switch (pageProvider.currentIndex) {
        case 0:
          return const HomePage();
        
        case 1:
          return const ChatPage();

        case 2:
          return const WishlistPage();

        case 3:
          return const ProfilePage();

        default:
          return const HomePage();
      }
    }

    return Scaffold(
      backgroundColor: pageProvider.currentIndex == 0 ? bgColor1 : bgColor3,
      floatingActionButton: _floatingButton(),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      bottomNavigationBar: _bottomNavBar(),
      body: body(),
    );
  }

  FloatingActionButton _floatingButton() {
    return FloatingActionButton(
      onPressed: () {
        Navigator.pushNamed(context, '/cart-page');
      },
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
