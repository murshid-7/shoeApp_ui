// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, library_private_types_in_public_api, use_build_context_synchronously

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sneaker_store/main.dart';
import 'package:sneaker_store/screens/home_page.dart';
import 'package:sneaker_store/screens/login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    checkLogin();
    super.initState();
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
          Text(
            'SHOEZO',
            style: TextStyle(color: Colors.white, fontSize: 20),
          )
        ],
      ),
    );
  }

  Future<void> loginfn() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
      return LoginScreen();
    }));
  }

  Future<void> checkLogin() async {
    final sharedperfer = await SharedPreferences.getInstance();
    final UserLogin = sharedperfer.getBool(SAVE_KEY_NAME);
    if (UserLogin == null || UserLogin == false) {
      loginfn();
    } else {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomeScreen()));
    }
  }
}
