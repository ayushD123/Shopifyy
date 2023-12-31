import 'package:flutter/material.dart';
class Product with ChangeNotifier{
  final String id;
  final String title;
  final String description;
  final int price;
  final String imageUrl;
  bool isFavourite;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.isFavourite=false,
});

  void toggleFavour(){
    isFavourite=!isFavourite;
    notifyListeners();
  }
}