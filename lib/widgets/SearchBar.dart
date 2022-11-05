import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';

class SerchBar extends StatefulWidget {
  const SerchBar({super.key});

  @override
  State<SerchBar> createState() => _SerchBarState();
}

class _SerchBarState extends State<SerchBar> {
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AnimSearchBar(
        width: 400,
        textController: textController,
        onSuffixTap: () {
          setState(() {
            textController.clear();
          });
        },
      );
  }
}