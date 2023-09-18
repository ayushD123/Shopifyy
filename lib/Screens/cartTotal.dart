import 'package:flutter/material.dart';
import 'package:shopify/Widgets/cartItemTotal.dart';
import '../Provider/cart.dart';
import 'package:provider/provider.dart';
import '../Provider/order.dart';
import 'package:lottie/lottie.dart';
import '../Widgets/app_drawer.dart';

class CartTotal extends StatelessWidget {
  const CartTotal({Key? key}) : super(key: key);
  static const routeName='TotalCartScreen';

  @override
  Widget build(BuildContext context) {
    final Cartvalue=Provider.of<Cart>(context);
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(title: Text("Your Cart"),),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Card(
            margin: EdgeInsets.only(top:15,left: 15,right: 15,bottom: 5),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total",style: TextStyle(fontSize: 20),),
                  SizedBox(width: 10,),
                  Chip(label: Text('₹${Cartvalue.Total}',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),backgroundColor: Colors.pink,)
                ],
              ),
            ),
          ),
          Card(
              margin: EdgeInsets.only(top: 0,left: 0,right: 15),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(onTap: (){
                  Provider.of<Orders>(context,listen: false).addOrders(Cartvalue.item.values.toList(), Cartvalue.Total);
                  Cartvalue.ClearCart();
                  showDialog(context: context, builder: (ctx)=>AlertDialog(
                    //backgroundColor: Color(0x00ffffff),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Lottie.network('https://assets2.lottiefiles.com/packages/lf20_gsigmrhp.json',fit: BoxFit.cover),
                        Text('Order Placed',style: TextStyle(color: Colors.green),)
                      ],
                    ),
                  ));
                }, child: Text('Place Order',style: TextStyle(color: Colors.pink),)),
              )),
          Expanded(child: ListView.builder(itemCount:Cartvalue.itemCount,itemBuilder: (ctx,i)=>TotalCartItem(
              Cartvalue.items.values.toList()[i].imageUrl,
            Cartvalue.items.values.toList()[i].price,
            Cartvalue.items.values.toList()[i].quantity,
            Cartvalue.items.values.toList()[i].title,
            Cartvalue.items.keys.toList()[i],

          ))),

        ],
      ),
    );
  }
}
