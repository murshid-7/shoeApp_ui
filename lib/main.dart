import 'package:flutter/material.dart';
import 'package:sneaker_store/screens/get_start_page.dart';
import 'package:sneaker_store/screens/home_page.dart';
import 'package:sneaker_store/screens/login_page.dart';
import 'package:sneaker_store/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, superKey, Key? customKey});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // home:LoginPage(),
      // home: SplashScreen(),
      home: GetStart(),
      // home: HomeScreen(),
    );
  }
}
