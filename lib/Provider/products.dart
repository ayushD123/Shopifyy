import 'package:flutter/material.dart';
import '../Models/product.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class Products with ChangeNotifier{
  List<Product> _item=[

    Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 299,
      imageUrl:
      'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 599,
      imageUrl:
      'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 190,
      imageUrl:
      'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    Product(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 499,
      imageUrl:
      'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    ),
  ];
  List<Product> get items{
    return [..._item];
  }
  List<Product> get favourites{
    return items.where((item)=>item.isFavourite).toList();
  }

  void add_products(Product p){
    const url='https://shopify-12519-default-rtdb.firebaseio.com/products.json';
    http.post(Uri.parse(url),body: json.encode({
      'title':p.title,
      'description':p.description,
      'price':p.price,
      'image_url':p.imageUrl,
      'isFavourite':p.isFavourite
    }));
    final newprod=Product(id: DateTime.now().toString(), title: p.title, description: p.description, price: p.price, imageUrl: p.imageUrl);
    _item.add(newprod);
    notifyListeners();
  }
  void delete_prod(String id){
    var index=_item.indexWhere((element) => element.id==id);
    _item.removeAt(index);
    notifyListeners();
  }
  void updateprod(String id,Product np){
    var index=_item.indexWhere((element) => element.id==id);
    _item[index]=np;
    notifyListeners();
  }

  Product findById(String id){
    return _item.firstWhere((element) => element.id==id);
  }
}