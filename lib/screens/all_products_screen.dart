import 'package:flutter/material.dart';
import 'package:sneaker_store/models/shoe_model.dart';
import 'package:sneaker_store/screens/edit_product.dart';
import 'package:sneaker_store/service/product_function.dart';

class AllProductScreen extends StatefulWidget {
  const AllProductScreen({super.key});

  @override
  State<AllProductScreen> createState() => _AllProductScreenState();
}

class _AllProductScreenState extends State<AllProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ValueListenableBuilder(
        valueListenable: shoeListNotifier,
        builder: (context, List<ShoeModel> cart, Widget? child) {
          return ListView.builder(
            itemCount: cart.length,
            itemBuilder: (context, index) {
              final data = cart[index];
              return ProductItem(
                title: data.name,
                subtitle: data.price.toString(),
                index: index,
                discription: '',
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
    required String discription,
  }) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Card(
          elevation: 6,
          color: Color.fromARGB(255, 255, 255, 255),
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: ListTile(
            title: Text(title),
            subtitle: Text(subtitle),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    deleteShoe(index);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => EditShoeScreen(
                          name: title,
                          price: subtitle,
                          discription: discription,
                          index: index,
                          imagePath: '',
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
