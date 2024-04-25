import 'package:flutter/material.dart';
import 'package:sneaker_store/screens/all_products_screen.dart';
import 'package:sneaker_store/service/product_function.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => AllProductScreen()));
            },
            child: Text('View Products'),
          ),
          ElevatedButton(
            onPressed: () {
              deleteAllDataShoes();
            },
            child: Text('Delete All Products'),
          )
        ],
      ),
    );
  }
}
