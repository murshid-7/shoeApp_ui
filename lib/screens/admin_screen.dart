// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sneaker_store/screens/all_products_screen.dart';
import 'package:sneaker_store/service/product_function.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.black)),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AllProductScreen()));
              },
              child: Text('View Products',style: TextStyle(color: Colors.white),),
            ),
            SizedBox(height: 15,),
            ElevatedButton(
              style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.black)),
              onPressed: () {
                deleteAllDataShoes();
              },
              child: Text('Delete All Products',style: TextStyle(color: Colors.red),),
            )
          ],
        ),
      ),
    );
  }
}
