// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:sneaker_store/components/appdawer.dart';
import 'package:sneaker_store/screens/brands_page.dart';
import 'package:sneaker_store/screens/cart_page.dart';
import 'package:sneaker_store/screens/catagory_page.dart';
import 'package:sneaker_store/screens/detail_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            userProfileBar(),
            SizedBox(height: 5),
            
            roundedCarousel(),
            SizedBox(height: 5),
            Text('Shop Your Favourite Brands From Here ',style: TextStyle(fontWeight: FontWeight.bold,)),
            brandsLogo(),
            popularBrands(),
            
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
              BottomNavWidget(onTap: () {}, icon: Icons.home),
              BottomNavWidget(onTap: () {}, icon: Icons.article),
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



Widget userProfileBar() => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        Icon(
          Icons.notifications_outlined,
          size: 25,
        ),
      ],
    );

Widget roundedCarousel() {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.all(10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: CarouselSlider(
            items: [
              Image.network(
                'https://img.freepik.com/free-vector/sale-banner-with-product-description_1361-1333.jpg?size=626&ext=jpg&ga=GA1.1.1009751488.1699960562&semt=ais',
                fit: BoxFit.fill,
              ),
              Image.network(
                  'https://img.freepik.com/premium-psd/black-friday-super-sale-web-banner-template_106176-1661.jpg?size=626&ext=jpg&uid=R64928966&ga=GA1.1.1009751488.1699960562&semt=ais',
                  fit: BoxFit.fill),
              Image.network(
                'https://img.freepik.com/free-vector/promotion-fashion-banner_1188-142.jpg?size=626&ext=jpg&ga=GA1.1.1009751488.1699960562&semt=ais',
                fit: BoxFit.fill,
              ),
              Image.network(
                'https://img.freepik.com/free-psd/black-friday-banner-with-discounts-3d-rendering_1419-2424.jpg?size=626&ext=jpg&uid=R64928966&ga=GA1.1.1009751488.1699960562&semt=ais',
                fit: BoxFit.fill,
              ),
            ],
            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 2,
              height: 300,
              viewportFraction: 1,
            ),
          ),
        ),
      ),
    ],
  );
}

Widget brandLogos(String imagePath, Function() onPressed) {
  return Expanded(
    child: TextButton(
      onPressed: onPressed,
      child: Image.network(
        imagePath,
        width: 50,
        height: 40,
        fit: BoxFit.contain,
      ),
    ),
  );
}

Widget popularBrands() => Expanded(
      child: ListView.builder(
        itemCount: brands.length,
        itemBuilder: (context, index) {
          final brand = brands[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => DetailScreen()),
              );
            },
            child: Container(
              height: 220,
              padding: const EdgeInsets.only(left: 18, right: 18),
              margin: const EdgeInsets.only(bottom: 10),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          height: 170,
                          width: 170,
                          decoration: BoxDecoration(
                            color: Colors.deepPurple.shade700,
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "New Arrival",
                              style: TextStyle(
                                fontSize: 10,
                                color: Color.fromARGB(255, 43, 42, 42),
                              ),
                            ),
                            Text(
                              brand.name,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              "\$${brand.price}",
                              style: const TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 100,
                    left: -40,
                    child: Transform(
                      transform: Matrix4.rotationZ(-0.5),
                      child: Container(
                        height: 160,
                        width: 260,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              "assets/${brand.image}",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 30,
                    left: 18,
                    child: Container(
                      height: 42,
                      width: 42,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.shopping_bag_outlined,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );

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
            Image.asset("assets/${brand.image}"),
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
    image: "assets/3.png",
  ),
  Brand(
    name: "Adidas Superstar",
    price: 100.0,
    image: "assets/3.png",
  ),
  Brand(
    name: "Puma Suede",
    price: 90.0,
    image: "",
  ),
  Brand(
    name: "Reebok Max 2",
    price: 110.0,
    image: "",
  ),
];

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
        color: Colors.white,
        size: 28,
      ),
    );
  }
}
