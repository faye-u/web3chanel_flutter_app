import 'package:avatars/avatars.dart';
import 'package:flutter/material.dart';

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
        children: <Widget>[
          const SizedBox(width: 16),
          Avatar(
            placeholderColors: [Colors.pink],
            shape: AvatarShape.circle(16),
            name:
              'Undefyned', // Fallback if no image source is available
          ),
          const SizedBox(width: 12),
          const Text("Undefyned",  style: TextStyle(fontSize: 12, color: Colors.white))
        ]
      );
  }
}
