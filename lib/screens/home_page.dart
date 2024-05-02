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
                      image: data.image,
                    ),
                  ),
                );
              },
              child: Card(
                margin: EdgeInsets.all(5),
                color: Colors.white10,
                child: Column(
                  children: [
                    Card(
                        child: Image.file(
                      File(data.image),
                      height: 120,
                      width: 120,
                      fit: BoxFit.fill,
                    )),
                    Text(data.name),
                    Text('Price:${data.price}'),
                    Text('Brand: ${data.catagory}'),
                  ],
                ),
              ),
            );
          },
        );
}
