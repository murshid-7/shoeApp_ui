// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          ProductItem('Product Name', 'M', Icons.delete, Icons.edit),
          SizedBox(height: 20),
          ProductItem(
              'Product Name', 'Price \nLocation', Icons.delete, Icons.edit),
          SizedBox(height: 20),
          ProductItem(
              'Product Name', 'Price \nLocation', Icons.delete, Icons.edit),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget ProductItem(
      String title, String subtitle, IconData deleteIcon, IconData editIcon,) {
    return Card(
      elevation: 6,
      color: Colors.amber,
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: ListTile(
        leading: Image.asset('assets/images/shoesz industries (1).png', width: 50, height: 50), // Add the image here
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(deleteIcon, color: Colors.red),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(editIcon),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}


