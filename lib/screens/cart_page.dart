// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:sneaker_store/models/cart_model/cart_model.dart';
import 'package:sneaker_store/service/cart_functions.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    getAllShoesCart();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        title: Text(
          'Your Cart',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: ValueListenableBuilder(
        valueListenable: cartListNotifier,
        builder: (context, List<CartModel> cart, Widget? child) {
          return ListView.builder(
            itemCount: cart.length,
            itemBuilder: (context, index) {
              final data = cart[index];
              return ProductItem(
                title: data.name,
                subtitle: data.price,
                index: index,
              );
            },
          );
        },
      ),
    );
  }

  Widget ProductItem({
    required int index,
    required String title,
    required String subtitle,
  }) {
    return Column(
      children: [
        SizedBox(
          height: 30,
        ),
        Card(
          elevation: 6,
          color: Colors.amber,
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: ListTile(
            leading: Image.asset('assets/images/shoesz industries (1).png',
                width: 50, height: 50),
            title: Text(title),
            subtitle: Text(subtitle),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    deleteShoesCart(index);
                    getAllShoesCart();
                  },
                ),
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
