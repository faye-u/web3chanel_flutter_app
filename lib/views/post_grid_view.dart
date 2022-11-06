
import 'package:flutter/material.dart';


class PostGridView extends StatefulWidget {
  const PostGridView({super.key});

  @override
  State<PostGridView> createState() => _PostGridViewState();
}

class _PostGridViewState extends State<PostGridView> {

  @override
  Widget build(BuildContext context) {
    return Container( 
      color: Colors.black,
      child: GridView.count(
            crossAxisSpacing: 5,
            mainAxisSpacing: 10,
            crossAxisCount: 3,
            children: <Widget>[
              Image.asset('assets/images/post_1.jpeg'),
              Image.asset('assets/images/post_2.jpeg'),
            ],
          ),
    );
  }

}


