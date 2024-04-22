// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class LoginField extends StatelessWidget {
  final controller;
  final hintText;
  final obsecure;
  const LoginField(
      {super.key, required this.controller, required this.hintText,required this.obsecure,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText: obsecure,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)),
              fillColor: Colors.white,
              filled: true,
              
              hintText: hintText)),
    );
  
  }
}

