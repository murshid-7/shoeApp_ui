import 'package:flutter/material.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton.icon(
                  onPressed: () => print('hello'),
                  icon: const Icon(Icons.add_a_photo),
                  label: const Text('Add Image'),
                ),
              ],
            ),
            const SizedBox(height: 20.0),

            const TextField(
              decoration: InputDecoration(
                labelText: 'Product Name',
              ),
            ),
            const SizedBox(height: 10.0),

            // Price field
            const TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Price',
              ),
            ),
            const SizedBox(height: 10.0),

            const TextField(
              maxLines: null,
              decoration: InputDecoration(
                labelText: 'Description',
              ),
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
            ),
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Add Product',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
