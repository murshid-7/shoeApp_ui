// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sneaker_store/models/cart_model/cart_model.dart';
import 'package:sneaker_store/models/shoe_model.dart';
import 'package:sneaker_store/screens/detail_page.dart';
import 'package:sneaker_store/service/cart_functions.dart';
import 'package:sneaker_store/service/product_function.dart';
import 'package:sneaker_store/widgets/appdawer.dart';
import 'package:sneaker_store/screens/brands_page.dart';
import 'package:sneaker_store/screens/cart_page.dart';
import 'package:sneaker_store/widgets/carousal_ad.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    getAllShoes();
    return Scaffold(
      // appBar: AppBar(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            DrawerBarTop(),
            SizedBox(height: 5),
            roundedCarousel(),
            SizedBox(height: 5),
            Text(
              'Shop Your Favourite Brands From Here ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            BrandsLogo(),
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: shoeListNotifier,
                builder: (context, List<ShoeModel> shoeList, Widget? child) {
                  return buildShoeList(shoeList);
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(8),
        child: Container(
          padding: EdgeInsets.all(12),
          margin: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BottomNavWidget(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                  icon: Icons.home),
              BottomNavWidget(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CartPage()),
                    );
                  },
                  icon: Icons.shopping_basket),
              BottomNavWidget(onTap: () {}, icon: Icons.person),
            ],
          ),
        ),
      ),
      drawer: Drawer1(),
    );
  }
}

Widget buildShoeList(List<ShoeModel> shoe) {
  return shoe.isEmpty
      ? const Center(
          child: Text('EMPTY'),
        )
      : GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 4, mainAxisSpacing: 4),
          itemCount: shoe.length,
          itemBuilder: (context, index) {
            final data = shoe[index];
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(
                      name: data.name,
                      price: data.price.toString(),
                      disciption: '',
                    ),
                  ),
                );
              },
              child: Container(
                color: Colors.redAccent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.file(File(data.image)),
                    Text(data.name),
                    Text(data.price.toString()),
                    ElevatedButton(
                        onPressed: () {
                          final cartitem = CartModel(
                            id: 1,
                            name: data.name,
                            image: '',
                            price: data.price.toString(),
                            quantity: 1,
                          );
                          addShoesCart(cartitem);
                        },
                        child: Text('Add to Cart'))
                  ],
                ),
              ),
            );
          },
        );
}

class BottomNavWidget extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const BottomNavWidget({Key? key, required this.icon, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(
        icon,
        color: Color.fromARGB(255, 253, 253, 253),
        size: 28,
      ),
    );
  }
}
