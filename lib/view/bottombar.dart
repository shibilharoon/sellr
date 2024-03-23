import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sellr_app/view/add_product.dart';
import 'package:sellr_app/view/chat_home.dart';
import 'package:sellr_app/view/favorites.dart';
import 'package:sellr_app/view/home_page.dart';
import 'package:sellr_app/view/login_screen.dart';
import 'package:sellr_app/view/phone_auth_page.dart';
import 'package:sellr_app/view/profile.dart';
import 'package:sellr_app/view/signup_page.dart';
import 'package:sellr_app/view/splash_screen.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomePage(),
    const ChatHome(),
    ProductAddingPage(),
    const FavoriteItemListPage(),
    UserProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Color.fromARGB(255, 231, 56, 47),
          unselectedItemColor: Colors.black,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.house,
                size: 20,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.message,
                size: 20,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.plus,
                size: 20,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.heart,
                size: 20,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_2,
                size: 28,
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
