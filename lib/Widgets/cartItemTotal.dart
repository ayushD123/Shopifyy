import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Provider/cart.dart';

class TotalCartItem extends StatelessWidget {
  TotalCartItem(this.url, this.price, this.quantity, this.title, this.id);
  final String url;
  final num price;
  final num quantity;
  final String title;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) {
        return showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            actions: [
              InkWell(
                  onTap: () {
                    Navigator.of(context).pop(false);
                  },
                  child: const Text(
                    "No",
                    style: TextStyle(color: Colors.deepOrange),
                  )),
              InkWell(
                  onTap: () {
                    Navigator.of(context).pop(true);
                  },
                  child: const Text(
                    "Yes",
                    style: TextStyle(color: Colors.deepOrange),
                  )),
            ],
            title: const Text('Are You Sure'),
            content: const Text("Do you want to remove this item from cart?"),
          ),
        );
      },
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).DeleteItem(id);
      },
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 10),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 30,
        ),
      ),
      key: UniqueKey(),
      child: Card(
        margin: const EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: ListTile(
            leading: CircleAvatar(
              //backgroundImage: NetworkImage(url),
              radius: 60,
              backgroundColor: Colors.white,
              child: Image.network(url, fit: BoxFit.cover),
            ),
            title: Text(title),
            subtitle: Text('x$quantity'),
            trailing: Text(
              '₹${price * quantity}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
