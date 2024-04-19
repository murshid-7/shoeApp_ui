// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sneaker_store/screens/home_page.dart'; // Import your home page here

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5),navigateToHomeScreen);
  }

  void navigateToHomeScreen() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Lottie.asset(
              'assets/Animation - 1712560704770 (4).json',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Loading, please wait...',
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
