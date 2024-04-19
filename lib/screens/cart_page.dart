// ignore_for_file: use_key_in_widget_constructors

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
          buildProductItem('iPhone 13 & 14', 'M', Icons.delete, Icons.edit),
          Divider(),
          buildProductItem(
              'Product Name', 'Price \nLocation', Icons.delete, Icons.edit),
          Divider(),
          buildProductItem(
              'Product Name', 'Price \nLocation', Icons.delete, Icons.edit),
        ],
      ),
    );
  }

  Widget buildProductItem(
      String title, String subtitle, IconData deleteIcon, IconData editIcon) {
    return ListTile(
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
    );
  }
}
