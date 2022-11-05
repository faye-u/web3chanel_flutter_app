import 'package:flutter/material.dart';
import 'package:web3chanel_flutter_app/navigation/FeedTabController.dart';

import '../widgets/AvatarWidget.dart';
import '../widgets/SearchBar.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        children: const <Widget>[
          SizedBox(height: 16),
          SerchBar(),
          Expanded( child: FeedTabController())
        ]
      )
    );
  }
}
