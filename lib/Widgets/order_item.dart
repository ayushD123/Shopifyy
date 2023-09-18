import 'package:flutter/material.dart';
import '../Provider/order.dart' as ord;//used OrderItems(not to be confused with OrderItem here)
import 'package:intl/intl.dart';

class OrderItem extends StatelessWidget {
 // const OrderItem({Key? key}) : super(key: key);
  final ord.OrderItems order;
  OrderItem(this.order);
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(title: Text('₹${order.amount}'),
          subtitle: Text(DateFormat('dd/MM/yyyy').format(order.dateTime)),
          trailing:
              Wrap(
                spacing: 10,
                children:[Text(
                  'Estimated Delivery:',style: TextStyle(fontWeight: FontWeight.bold),
                ),
        Text(

            DateFormat.MMMEd().format(order.dateTime.add(Duration(days: 7))),
          style: TextStyle(color: Colors.green),
        ),]
              ),


          )
        ],
      ),
    );
  }
}
