import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sneaker_store/screens/cart_page.dart';

class DetailScreen extends StatefulWidget {
  final String name;
  final String price;
  final String disciption;
  const DetailScreen(
      {super.key,
      required this.name,
      required this.price,
      required this.disciption});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  static const List<Color> colors = [
    Colors.black,
    Colors.yellow,
    Colors.greenAccent,
    Colors.red,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Product Details',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      backgroundColor: const Color.fromARGB(248, 255, 255, 255),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            headerContainer(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    widget.disciption,
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      RatingBar.builder(
                        itemCount: 5,
                        itemSize: 30,
                        allowHalfRating: true,
                        initialRating: 4,
                        onRatingUpdate: (rating) {},
                        itemBuilder: (context, _) {
                          return const Icon(Icons.star, color: Colors.amber);
                        },
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        "4",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Sneaker Size",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 45,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 50,
                          width: 50,
                          margin: const EdgeInsets.only(right: 20),
                          child: TextButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              overlayColor:
                                  MaterialStateProperty.all(Colors.black),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                            child: const Text(
                              "3",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Colors Available: ",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                        width: 160,
                        child: Row(
                          children: [
                            for (final colors in colors)
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: CircleAvatar(
                                  radius: 10,
                                  backgroundColor: colors,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 90,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Colors.lightBlue,
                              Colors.deepPurple,
                            ],
                          ),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.shopping_bag_outlined,
                              color: Colors.white,
                            ),
                            Text(
                              "120",
                              style: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "A pair of black running shoes, has regular styling, lace-up detail Breathable Support :Lightweight knit material wraps your foot in breathable comfort.",
                              style: TextStyle(
                                fontSize: 15,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                            SizedBox(height: 5),
                            Text(
                              "More Details",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CartPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
                child: const Text(
                  'Add to Cart',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget headerContainer() => Container(
        height: 320,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Container(
            height: 200,
            width: 300,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/nike1.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      );
}
