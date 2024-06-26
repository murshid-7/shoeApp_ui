// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sneaker_store/main.dart';
import 'package:sneaker_store/screens/home_page.dart';
import 'package:sneaker_store/widgets/bottom_nav.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void loginFunction(BuildContext ctx) async {
    final userName = usernameController.text.trim();
    final passWord = passwordController.text.trim();

    if (userName == 'hello' && passWord == '123') {
      log('UserName passowrd match');

      final sharedprefer = await SharedPreferences.getInstance();
      await sharedprefer.setBool(SAVE_KEY_NAME, true);

      Navigator.of(ctx)
          .pushReplacement(MaterialPageRoute(builder: (ctx) => BottomNav()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Incorrect username or password'),
        backgroundColor: Colors.red,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                Column(
                  children: [
                    SizedBox(height: 100),
                    Icon(Icons.lock, size: 100),
                    SizedBox(height: 30),
                    Text('Welcome Back',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600)),
                    Text('Enter your email and password'),
                    SizedBox(height: 25),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        controller: usernameController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12)),
                            hintText: 'Username'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Username is required';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12)),
                            hintText: 'Password'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password is required';
                          }
                          return null;
                        },
                      ),
                    ),
                    ElevatedButton.icon(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.black)),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          loginFunction(context);
                        } else {
                          log('Data Is Empty');
                        }
                        loginFunction(context);
                      },
                      icon: Icon(Icons.check),
                      label: Text(
                        'Sign In',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
