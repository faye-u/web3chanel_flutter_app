import 'dart:math';

import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

import '../widgets/user.dart';

class PostScrollView extends StatefulWidget {
  const PostScrollView({super.key});

  @override
  State<PostScrollView> createState() => _PostScrollViewState();
}

class _PostScrollViewState extends State<PostScrollView> {

  @override
  Widget build(BuildContext context) {
    return Container( 
      color: Colors.black,
      child: Column(children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column( 
              children: [
                getImageView('assets/images/post_1.jpeg'),
                getImageView('assets/images/post_2.jpeg')
              ]
        )
    ))]));
  }

  Column getImageView(String imagePath) {
      return Column(
          children:[
            const SizedBox(height: 16),
            const User(),
            const SizedBox(height: 8),
            Image(image: AssetImage(imagePath), fit: BoxFit.fitWidth),
            const SizedBox(height: 16),
            LikeButton(likeCount: Random().nextInt(10000))
          ]
        );
  }

}


