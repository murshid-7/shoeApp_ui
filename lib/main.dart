import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sneaker_store/models/cart_model/cart_model.dart';
import 'package:sneaker_store/models/shoe_model.dart';
import 'package:sneaker_store/screens/splash_screen.dart';

Future<void> main() async {
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(ShoeModelAdapter().typeId)) {
    Hive.registerAdapter(ShoeModelAdapter());
  }
  if (!Hive.isAdapterRegistered(CartModelAdapter().typeId)) {
    Hive.registerAdapter(CartModelAdapter());
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, superKey, Key? customKey});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,

      // home: SplashScreen(),
      home: SplashScreen(),
    );
  }
}
