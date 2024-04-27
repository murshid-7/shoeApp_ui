import 'package:flutter/material.dart';
import 'package:sneaker_store/models/shoe_model.dart';

class PumaStore extends StatelessWidget {
  const PumaStore({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [Expanded(child: ValueListenableBuilder<List<ShoeModel>>(valueListenable: , builder: builder))],
      ),
    );
  }
}