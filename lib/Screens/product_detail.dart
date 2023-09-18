import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Provider/products.dart';

class ProductDetail extends StatelessWidget {
  static const routeName='/productDetail';

  @override
  Widget build(BuildContext context) {
    final productID=ModalRoute.of(context)!.settings.arguments as String;
    final loadedProduct=Provider.of<Products>(context,listen: false).findById(productID);
    return Scaffold(
      appBar: AppBar(title: Text(loadedProduct.title),),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 400,
              width: double.infinity,
              margin: EdgeInsets.all(10),
              child: Image.network(loadedProduct.imageUrl),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Chip(label: Text(loadedProduct.title)),
                  Text('₹${loadedProduct.price}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),

                ],
              ),

            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('Product Description',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 10),textAlign: TextAlign.start,),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(loadedProduct.description),
            )

          ],
        ),
      ),
    );
  }
}
