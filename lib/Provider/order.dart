import 'package:flutter/material.dart';

import 'cart.dart';

class OrderItems{
  final String id;
  List<CartItems> products;
  int amount;
  DateTime dateTime;

  OrderItems({
    required this.id,
    required this.products,
    required this.amount,
    required this.dateTime
  });

}

class Orders with ChangeNotifier{
List<OrderItems> orders=[];

List<OrderItems> get order{
  return [...orders];
}

void addOrders(List<CartItems> cartProd,int price){
  orders.insert(0, OrderItems(id:DateTime.now().toString(),products:cartProd ,amount: price,dateTime: DateTime.now()));
  notifyListeners();
}
  
}