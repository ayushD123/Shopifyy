import 'package:flutter/material.dart';
import 'package:shopify/Screens/order_screen.dart';
import '../Screens/cartTotal.dart';
import '../Screens/manage_products.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            backgroundColor: Colors.black,
            leading: const Padding(
              padding: EdgeInsets.all(8.0),
              child: const CircleAvatar(
                child: Icon(Icons.person),
              ),
            ),
            title: const Text('Hey There'),
            automaticallyImplyLeading: false,
          ),
          //Divider(),
          ListTile(
            leading: const Icon(Icons.shop),
            title: const Text('Shop'),
            onTap: () {
              Navigator.of(context).pushNamed('/');
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.shopping_cart),
            title: const Text('Cart'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(CartTotal.routeName);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.payment),
            title: const Text('My Orders'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(OrderScreen.routeName);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('Manage Products'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(ManageProducts.routeName);
            },
          ),
        ],
      ),
    );
  }
}
