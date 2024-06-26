// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:sneaker_store/models/cart_model/cart_model.dart';

ValueNotifier<List<CartModel>> cartListNotifier = ValueNotifier([]);
Future<void> addShoesCart(CartModel value) async {
  final shoeDB = await Hive.openBox<CartModel>('cart');
  await shoeDB.add(value);
  cartListNotifier.value.add(value);
  cartListNotifier.notifyListeners();
}

Future<void> getAllShoesCart() async {
  final shoeDB = await Hive.openBox<CartModel>('cart');
  cartListNotifier.value.clear();
  cartListNotifier.value.addAll(shoeDB.values);
  cartListNotifier.notifyListeners();
}

Future<void> deleteShoesCart(index) async {
  final shoeDB = await Hive.openBox<CartModel>('cart');
  await shoeDB.deleteAt(index);
  cartListNotifier.notifyListeners();
}
