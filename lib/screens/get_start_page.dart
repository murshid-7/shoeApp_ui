// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sneaker_store/screens/home_page.dart';
import 'package:sneaker_store/screens/splash_screen.dart';

class GetStart extends StatelessWidget {
  const GetStart({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Transform.rotate(
            angle: -.4,
            child: Image.asset('assets/images/3.png'),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              'BEST PLACE TO FIND YOUR SHOES',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Text(
                'Visit us here to get the best collection of shoes and buy your favourite shoes',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: Color.fromARGB(255, 53, 52, 52))),
          ),
          SizedBox(height: 80.0),
          GestureDetector(
            onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) {
                return SplashScreen();
              },
            )),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(12)),
              padding: EdgeInsets.all(24.0),
              child: Text(
                'Get Started',
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
