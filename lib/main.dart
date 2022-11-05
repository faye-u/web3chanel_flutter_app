import 'package:flutter/material.dart';
import 'navigation/bottom_navigation.dart';
import 'navigation/main_route.dart';
import 'pages/login_page.dart';

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
      initialRoute: MainRoutes.loginRoute,
      routes: {
        MainRoutes.loginRoute: (context) => const LoginPage(),
        MainRoutes.homeRoute: (context) => const BottomNavigation(),
      },
    );
  }
}
