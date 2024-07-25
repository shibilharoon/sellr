import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sellr_app/view/add_product.dart';
import 'package:sellr_app/view/chat_home.dart';
import 'package:sellr_app/view/favorites.dart';
import 'package:sellr_app/view/home_page.dart';
import 'package:sellr_app/view/profile.dart';

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
    const ProductAddingPage(),
    const FavoriteItemListPage(),
    const UserProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Container(
          height: 60,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 214, 215, 215),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _buildNavBarItem(FontAwesomeIcons.house, 0),
              _buildNavBarItem(FontAwesomeIcons.comment, 1),
              _buildAddButton(),
              _buildNavBarItem(FontAwesomeIcons.heart, 3),
              _buildNavBarItem(Icons.person, 4),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavBarItem(IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: SizedBox(
        width: 70,
        height: 60,
        child: Icon(
          icon,
          size: 25,
          color: _currentIndex == index
              ? Color.fromARGB(255, 60, 27, 14)
              : Colors.black54,
        ),
      ),
    );
  }

  Widget _buildAddButton() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = 2;
        });
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 5,
        height: 60,
        child: const Icon(FontAwesomeIcons.circlePlus,
            size: 28, color: Color.fromARGB(255, 60, 27, 14)),
      ),
    );
  }
}
