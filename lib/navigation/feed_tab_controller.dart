import 'package:flutter/material.dart';

import '../pages/not_yet_implement_page.dart';
import '../views/post_scroll_view.dart';

class FeedTabController extends StatefulWidget {
  const FeedTabController({super.key});

  @override
  State<FeedTabController> createState() => _FeedTabControllerState();
}

class _FeedTabControllerState extends State<FeedTabController> {
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
                Tab(child: Text('Explore', style: TextStyle(fontSize: 18))),
                Tab(child: Text('Connect', style: TextStyle(fontSize: 18))),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              PostScrollView(),
              NotImplementedPage(),
            ],
          ),
        ),
      );
  }
}