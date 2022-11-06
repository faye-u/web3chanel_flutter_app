import 'package:flutter/material.dart';

import '../pages/not_yet_implement_page.dart';

class ProfileTabController extends StatefulWidget {
  const ProfileTabController({super.key});

  @override
  State<ProfileTabController> createState() => _ProfileTabControllerState();
}

class _ProfileTabControllerState extends State<ProfileTabController> {
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return 
      DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            shadowColor: Colors.pink,
            toolbarHeight: 0,
            bottom: const TabBar(
              indicatorColor: Colors.pink,
              tabs: [
                Tab(child: Icon(Icons.feed)),
                Tab(child: Icon(Icons.tag)),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              NotImplementedPage(),
              NotImplementedPage(),
            ],
          ),
        ),
      );
  }
}