import 'package:flutter/material.dart';
import 'package:web3chanel_flutter_app/pages/rewards_page.dart';

import '../pages/chat_page.dart';
import '../pages/feed_page.dart';
import '../pages/profile_page.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    FeedPage(),
    ChatPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.stop),
        onPressed: () => {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const RewardsPage()),
          )
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          )
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        fixedColor: Colors.pink,
        backgroundColor: Colors.black,
        unselectedItemColor: Colors.white,
      ),
    );
  }
}
