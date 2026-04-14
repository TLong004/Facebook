import 'package:facebook/views/friend_list_page.dart';
import 'package:facebook/views/home_page.dart';
import 'package:facebook/views/message_page.dart';
import 'package:facebook/views/profile_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const MessagePage(),
    const FriendListPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, 
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: _buildCustomBottomBar(),
    );
  }

  Widget _buildCustomBottomBar() {
    return Container(
      margin: const EdgeInsets.fromLTRB(50, 0, 50, 30), 
      height: 60, 
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildNavItem(Icons.home_rounded, Icons.home, 0),
          _buildNavItem(Icons.chat_bubble_rounded, Icons.chat_bubble_outline_rounded, 1),
          _buildNavItem(Icons.group_rounded, Icons.group_outlined, 2),
          _buildNavItem(Icons.person_rounded, Icons.person_outline_rounded, 3),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData activeIcon, IconData inactiveIcon, int index) {
    bool isSelected = _currentIndex == index;
    return GestureDetector(
      onTap: () => setState(() => _currentIndex = index),
      behavior: HitTestBehavior.opaque, 
      child: Column(
        mainAxisSize: MainAxisSize.min, 
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: isSelected ? Colors.blue.withOpacity(0.1) : Colors.transparent,
              shape: BoxShape.circle,
            ),
            child: Icon(
              isSelected ? activeIcon : inactiveIcon,
              color: isSelected ? Colors.blueAccent : Colors.grey.shade500,
              size: 26,
            ),
          ),
        ],
      ),
    );
  }
}