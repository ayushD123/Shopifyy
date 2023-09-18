import 'package:flutter/material.dart';
import '../Widgets/product_item.dart';
import '../Models/product.dart';
import '../Provider/products.dart';
import 'package:provider/provider.dart';

class ProductsGrid extends StatelessWidget {
  final bool ShowFav;
  ProductsGrid(this.ShowFav);

  @override
  Widget build(BuildContext context) {
    final productdata = Provider.of<Products>(context);
    final loadedproducts = ShowFav ? productdata.favourites : productdata.items;
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
      itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
          value: loadedproducts[index], child: ProductItem()),
      itemCount: loadedproducts.length,
      padding: const EdgeInsets.only(top: 10),
    );
  }
}
