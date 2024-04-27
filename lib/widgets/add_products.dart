import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sneaker_store/models/shoe_model.dart';
import 'package:sneaker_store/service/product_function.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  File? _imageFile;
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController discriptionController = TextEditingController();
  String dropdown = 'Adidas';
  var items = ['Adidas', 'Puma', 'Nike', 'Reebok'];

  Future<void> _getImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _imageFile = File(image.path); // Convert XFile to File
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: _getImage,
                child: Container(
                  padding: const EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    color: Colors.black
                        .withOpacity(0.1), // Transparent black background
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.add_a_photo,
                        color: Colors.black
                            .withOpacity(0.6), // Light black icon color
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'Add Image',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black
                              .withOpacity(0.6), // Light black text color
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              if (_imageFile != null)
                Image.file(
                  _imageFile!,
                  height: 200,
                  width: 200,
                  fit: BoxFit.cover,
                ),
              const SizedBox(height: 20.0),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Product Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Price',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              TextField(
                maxLines: null,
                decoration: InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              DropdownButton(
                  value: dropdown,
                  items: items.map((String items) {
                    return DropdownMenuItem(value: items, child: Text(items));
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdown = newValue!;
                    });
                  }),
              ElevatedButton(
                onPressed: () {
                  onAddShoe();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
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
            ],
          ),
        ),
      ),
    );
  }

  Future<void> onAddShoe() async {
    final name = nameController.text.trim();
    final price = priceController.text.trim();
    final discription = discriptionController.text.trim();
    if (name.isNotEmpty || price.isNotEmpty || discription.isNotEmpty) {
      final shoe =
          ShoeModel(id: 1, name: name, image: '', price: price, quantity: 1);
      addShoes(shoe);
      print('added');
    } else {
      return;
    }
  }
}
