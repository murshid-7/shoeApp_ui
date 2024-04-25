// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class PumaStore extends StatelessWidget {
  const PumaStore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // elevation: 8, 
        toolbarHeight: 80, 
        title: Text(
          'Puma Store',
          style: TextStyle(fontSize: 24), 
        ),
      ),
      body: ListView.builder(
        itemCount: brands.length,
        itemBuilder: (context, index) {
          final brand = brands[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => BrandDetails(brand: brand)),
              );
            },
            child: Container(
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey[200],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: AssetImage(brand.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        brand.name,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '\$${brand.price.toString()}',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[800],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class BrandDetails extends StatelessWidget {
  final Brand brand;

  const BrandDetails({Key? key, required this.brand}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(brand.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Brand Name: ${brand.name}"),
            Text("Price: \$${brand.price}"),
            Image.network(brand.image),
          ],
        ),
      ),
    );
  }
}

class Brand {
  final String name;
  final double price;
  final String image;

  Brand({required this.name, required this.price, required this.image});
}

final List<Brand> brands = [
  Brand(
    name: "Nike Air Force 1",
    price: 150.0,
    image: "https://images.puma.com/image/upload/f_auto,q_auto,b_rgb:fafafa,w_600,h_600/global/397166/01/sv01/fnd/IND/fmt/png/RBD-Game-x-HARRDY-SANDHU-Men's-Sneakers",
  ),
  Brand(
    name: "Puma fro",
    price: 100.0,
    image: "assets/adidas.webp",
  ),
  Brand(
    name: "Puma Suede",
    price: 90.0,
    image: "assets/puma.webp",
  ),
  Brand(
    name: "Reebok Max 2",
    price: 110.0,
    image: "assets/reebok_max_2.png",
  ),
  Brand(
    name: "Flip Flop max",
    price: 50.0,
    image: "",
  ),




];

class gDart {
  
}