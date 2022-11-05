import 'package:flutter/material.dart';
import 'package:web3chanel_flutter_app/navigation/profile_tab_controller.dart';

import '../widgets/avatar_widget .dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        children: const <Widget>[
          SizedBox(height: 36),
          AvatarWidget(),
          Expanded( child: ProfileTabController())
        ]
      )
    );
  }
}
