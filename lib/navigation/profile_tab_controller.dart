import 'package:flutter/material.dart';

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
                Tab(child: Icon(Icons.favorite)),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              getImageGridView(['assets/images/post_1.jpeg', 'assets/images/post_2.jpeg']),
              getImageGridView(['assets/images/like_1.jpeg', 'assets/images/post_1.jpeg']),
            ],
          ),
        ),
      );
  }

  Container getImageGridView(List<String> imagePathList) {
    return Container( 
      color: Colors.black,
      child: GridView.count(
            crossAxisSpacing: 5,
            mainAxisSpacing: 10,
            crossAxisCount: 3,
            children: imagePathList.map((value) {
                return Image.asset(value);
            }).toList()
          ),
    );
  }

}