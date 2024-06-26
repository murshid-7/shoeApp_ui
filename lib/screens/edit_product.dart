import 'dart:io';

import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:sneaker_store/models/shoe_model.dart';
import 'package:sneaker_store/service/product_function.dart';

// ignore: must_be_immutable
class EditShoeScreen extends StatefulWidget {
  String name;
  String price;
  String discription;
  int index;
  dynamic imagePath;
  EditShoeScreen({
    super.key,
    required this.name,
    required this.price,
    required this.discription,
    required this.index,
    required this.imagePath,
  });

  @override
  State<EditShoeScreen> createState() => _EditStudentState();
}

class _EditStudentState extends State<EditShoeScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _priceController = TextEditingController();

  File? selectedImage;
  @override
  void initState() {
    _nameController = TextEditingController(text: widget.name);
    _priceController = TextEditingController(text: widget.price);
    selectedImage = widget.imagePath != '' ? File(widget.imagePath) : null;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Shoe Name'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const SizedBox(height: 10),
              CircleAvatar(
                radius: 80,
                backgroundImage: selectedImage != null
                    ? FileImage(selectedImage!)
                    : FileImage(File(widget.imagePath!)),
              ),
              const SizedBox(height: 10),
              ElevatedButton.icon(
                onPressed: () {
                  pickImageGallery();
                },
                label: const Text('Gallery'),
                icon: const Icon(Icons.image),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  hintText: 'Enter the Name',
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _priceController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  hintText: 'Enter the Price',
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  editAll();
                  Navigator.pop(context);
                },
                child: const Text('Edit'),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> editAll() async {
    final name = _nameController.text.trim();
    final price = _priceController.text.trim();
    final image = selectedImage!.path;
    if (name.isNotEmpty || price.isNotEmpty) {
      final update = ShoeModel(
        id: 1,
        name: name,
        image: image,
        price: price,
        quantity: 1,
        catagory: '',
      );
      editShoes(widget.index, update);
    } else {
      return;
    }
  }

  Future pickImageGallery() async {
    final returntheImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returntheImage != null) {
      setState(() {
        selectedImage = File(returntheImage.path);
      });
    }
  }
}
