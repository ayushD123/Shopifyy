import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Provider/products.dart';
import '../Widgets/manage_items.dart';
import '../Widgets/app_drawer.dart';
import '../Screens/edit_product.dart';

class ManageProducts extends StatelessWidget {
  const ManageProducts({Key? key}) : super(key: key);
  //static const routeName='/manageScreen';
  static const routeName='/manage';

  @override
  Widget build(BuildContext context) {

    final productdata=Provider.of<Products>(context);
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text("Manage Your Products"),
        actions: [
          IconButton(
            onPressed: (){
              Navigator.of(context).pushNamed(EditProduct.routeName);
            },
            icon: Icon(
              Icons.add
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(itemCount: productdata.items.length,itemBuilder:(_,i)=>
          Column(
            children: [
              ManageItems(productdata.items[i].imageUrl,
                productdata.items[i].title,
                productdata.items[i].id
                  ),
              Divider(),
            ],
          )
        ),
      ),
    );
  }
}
