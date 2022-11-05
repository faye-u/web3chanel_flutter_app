import 'package:flutter/material.dart';
import 'package:avatars/avatars.dart';


class AvatarWidget extends StatefulWidget {
  const AvatarWidget({super.key});

  @override
  State<AvatarWidget> createState() => _AvatarWidgetState();
}

class _AvatarWidgetState extends State<AvatarWidget> {

  @override
  Widget build(BuildContext context) {
    return 
      Avatar(
        placeholderColors: [Colors.pink],
        shape: AvatarShape.circle(36),
        name:
            'Undefyned', // Fallback if no image source is available
        );
  }
}
