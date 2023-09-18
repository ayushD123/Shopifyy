import 'package:flutter/material.dart';
import 'package:shopify/Screens/Prod_Overview.dart';
import 'package:provider/provider.dart';
import 'package:shopify/Provider/products.dart';
import 'package:shopify/Screens/product_detail.dart';
import 'Provider/cart.dart';
import 'Provider/order.dart';
import 'package:shopify/Screens/cartTotal.dart';
import 'package:shopify/Screens/manage_products.dart';
import 'package:shopify/Screens/edit_product.dart';
import 'package:shopify/Screens/order_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
        ChangeNotifierProvider(
        create:(ctx)=>Products()
        ),
      ChangeNotifierProvider(
          create:(ctx)=>Cart()
      ),
      ChangeNotifierProvider(
          create: (ctx)=>Orders()
      ),
    ],//use this when instantiating first time else use .value if used recycled one
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shopify',
        theme: ThemeData(

          primarySwatch: Colors.pink,
        //  accentColor: Colors.deepOrange
        ),
        home: ProductOverviewScreen(),
        routes: {
          ProductDetail.routeName: (ctx)=> ProductDetail(),
          CartTotal.routeName:(ctx)=>CartTotal(),
          OrderScreen.routeName:(ctx)=>OrderScreen(),
          ManageProducts.routeName:(ctx)=>ManageProducts(),
          EditProduct.routeName:(ctx)=>EditProduct(),

        },
      ),
    );
  }
}
