import 'package:flutter/foundation.dart';


class Cart with ChangeNotifier {
  Map<String, CartItems> item = {};

  Map<String, CartItems> get items {
    return {...item};
  }

  int get itemCount{
    return item.length;
  }
  int get Total{
    int sum=0;
    item.forEach((key, value) {
      sum+=value.price*value.quantity;
    });
    return sum;
  }
  void DeleteItem(String id){
    item.remove(id);
    notifyListeners();
  }
  void ClearCart(){
    item={};
    notifyListeners();
  }

  void deleteSingleItem(String id){
    if(!item.containsKey(id)) return;
    if(item[id]!.quantity>1){
      item.update(id, (value) =>
          CartItems(id: value.id,
              title: value.title,
              price: value.price,
              quantity: value.quantity - 1,
              imageUrl: value.imageUrl));
    }else{
      item.remove(id);
    }

    notifyListeners();
  }

  void AddItem(String id, String title, int price,String url) {
    if (item.containsKey(id)) {
      item.update(id, (value) =>
          CartItems(id: value.id,
              title: value.title,
              price: value.price,
              quantity: value.quantity + 1,
                imageUrl: value.imageUrl));
    }
    else {
      item.putIfAbsent(id, () =>
          CartItems(id: DateTime.now().toString(),
              title: title,
              price: price,
              imageUrl: url,
              quantity: 1));
    }
    notifyListeners();
  }

}

class CartItems{
  final String id;
  final String title;
  final int price;
  final int quantity;
  final String imageUrl;

  CartItems({required this.id,required this.title,required this.price,required this.quantity,required this.imageUrl});
}