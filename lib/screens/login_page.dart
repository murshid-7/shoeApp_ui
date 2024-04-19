// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sneaker_store/components/login_field.dart';
import 'package:sneaker_store/screens/home_page.dart';



class LoginPage extends StatelessWidget {
  LoginPage({Key? key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  signIn(BuildContext context) {
    if (usernameController.text == 'username' &&
        passwordController.text == 'user123') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Incorrect username or password'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                Icon(
                  Icons.lock,
                  size: 100,
                ),
                SizedBox(height: 20),
                Text(
                  'Welcome back!',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                Text('Enter your email and password'),
                SizedBox(height: 25),
                LoginField(
                  controller: usernameController,
                  hintText: 'Username',
                  obsecure: false,
                ),
                SizedBox(height: 12),
                LoginField(
                  controller: passwordController,
                  hintText: 'Password',
                  obsecure: true,
                ),
                SizedBox(height: 5.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forgot password?',
                          style: TextStyle(color: Colors.grey[800]),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () => signIn(context),
                  child: Text('Sign In'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
