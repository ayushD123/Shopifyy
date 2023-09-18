import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Provider/cart.dart';
import '../Screens/edit_product.dart';
import '../Provider/products.dart';
class ManageItems extends StatelessWidget {
  ManageItems(this.url,this.title,this.id);
  final String url;
 // final int price;
  //final int quantity;
  final String title;
  final String id;


  @override
  Widget build(BuildContext context) {
  return ListTile(
    title: Text(title),
  leading: CircleAvatar(
  //backgroundImage: NetworkImage(url),
  radius: 60,
  backgroundColor: Colors.white,
  child: Image.network(url,fit: BoxFit.cover),
  ),
  contentPadding: EdgeInsets.all(0),


  trailing:Container(
    width: 100,
    child: Row(
      children: [
        IconButton(icon:Icon(Icons.edit),color: Colors.purple,
        onPressed:(){ Navigator.of(context).pushNamed(EditProduct.routeName,arguments: id);},),
        SizedBox(width: 15,),
        IconButton(icon:Icon(Icons.delete),color: Colors.red,
          onPressed:(){Provider.of<Products>(context,listen: false).delete_prod(id);},),
      ],
    ),
  ),
  );
  }
}
