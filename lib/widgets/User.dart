import 'package:flutter/material.dart';

import 'avatar_widget .dart';


class User extends StatefulWidget {
  const User({super.key});

  @override
  State<User> createState() => _UserState();
}

class _UserState extends State<User> {

  @override
  Widget build(BuildContext context) {
    return 
      Row(
        children: const <Widget>[
          SizedBox(width: 16),
          AvatarWidget(),
          SizedBox(width: 12),
          Text("Undefyned",  style: TextStyle(fontSize: 12, color: Colors.white))
        ]
      );
  }
}
