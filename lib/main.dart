import 'package:flutter/material.dart';

import 'navigation/BottomNavigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.black,
        backgroundColor: Colors.black,
      ),
      home: const BottomNavigation(),
    );
  }
}
