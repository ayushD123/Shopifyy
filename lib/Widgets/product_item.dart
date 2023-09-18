import 'package:flutter/material.dart';
import '../Screens/product_detail.dart';
import 'package:provider/provider.dart';
import '../Models/product.dart';
import '../Provider/cart.dart';
class ProductItem extends StatelessWidget {

  // final String id;
  // final String title;
  // final String imageUrl;
  // final int Price;
  // ProductItem( this.id,this.title,this.imageUrl,this.Price);

  @override
  Widget build(BuildContext context) {
    final product=Provider.of<Product>(context);
    final cart=Provider.of<Cart>(context);
    return GridTile(child: GestureDetector(
        onTap: (){
          Navigator.of(context).pushNamed(ProductDetail.routeName,arguments: product.id);
        },
        child: Image.network(product.imageUrl,fit: BoxFit.cover,
        )),
    footer: GridTileBar(
      backgroundColor: Colors.black45,
      trailing: IconButton(
        //color: Colors.black,

        onPressed: (){
          cart.AddItem(product.id, product.title, product.price,product.imageUrl);
          // Scaffold.of(context).closeDrawer();
          // Scaffold.of(context).openDrawer()SnackBar(content: const Text('Item Added To Cart'),
          // duration: const Duration(seconds: 2),
          // action: SnackBarAction(label: 'Undo',onPressed: (){
          // cart.deleteSingleItem(product.id);
          // },),));

        },
        icon: const Icon(Icons.shopping_cart),
      ) ,
      title: Text(product.title),
      subtitle: Text("₹${product.price}"),
    ),
    header: GridTileBar(
      //backgroundColor: Colors.black54,
      title: const Text("     "),
      trailing: IconButton(
        //color: Colors.black,

      onPressed: (){
      product.toggleFavour();
      },
      icon: Icon(product.isFavourite?Icons.favorite:Icons.favorite_border_rounded,color: Colors.red,),
    ),)
    );
  }
}
