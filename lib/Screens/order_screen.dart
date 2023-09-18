import 'package:flutter/material.dart';
import '../Widgets/app_drawer.dart';
import 'package:provider/provider.dart';

import '../Widgets/order_item.dart';
import '../Provider/order.dart' show Orders;

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);
  static const routeName='/orders';

  @override
  Widget build(BuildContext context) {
    final orderData=Provider.of<Orders>(context);
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(title: Text("Your Orders"),),
      body: ListView.builder(itemCount:orderData.orders.length,itemBuilder: (ctx,i)=>OrderItem(orderData.order[i])),
    );
  }
}
