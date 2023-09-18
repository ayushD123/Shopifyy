import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Models/product.dart';
import '../Provider/products.dart';

class EditProduct extends StatefulWidget {
  static const routeName = 'edit_prod';

  @override
  State<EditProduct> createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  final price_focus = FocusNode();
  String uurl = '';
  final desc_focus = FocusNode();
  final imageController = TextEditingController();
  final form = GlobalKey<FormState>();
  var editedprod = Product(
      id: null.toString(), title: "", description: "", price: 0, imageUrl: "");
  var isinit = true;
  var initvalue = {'title': '', 'descp': '', 'price': '', 'imageurl': ''};
  @override
  void didChangeDependencies() {
    if (isinit) {
      final prodId = ModalRoute.of(context)!.settings.arguments == null
          ? "NULL"
          : ModalRoute.of(context)!.settings.arguments as String;
      if (prodId != 'NULL') {
        editedprod =
            Provider.of<Products>(context, listen: false).findById(prodId);
        initvalue = {
          'title': editedprod.title,
          'descp': editedprod.description,
          'price': editedprod.price.toString(),
          'imageurl': '',
        };
        imageController.text = editedprod.imageUrl;
      }
    }
    isinit = false;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    price_focus.dispose();
    desc_focus.dispose();
    imageController.dispose();
    super.dispose();
  }

  void saveform() {
    print('hello');
    final isvalid = form.currentState?.validate();

    if (!isvalid!) {
      return;
    }
    form.currentState?.save();
    if (editedprod.id != null.toString()) {
      Provider.of<Products>(context, listen: false)
          .updateprod(editedprod.id, editedprod);
    } else {
      Provider.of<Products>(context, listen: false).add_products(editedprod);
    }

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Your Product'),
        actions: [IconButton(onPressed: saveform, icon: Icon(Icons.save))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
            key: form,
            child: ListView(
              children: [
                TextFormField(
                  initialValue: initvalue['title'],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This Field Cant Be Empty';
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'Title'),
                  textInputAction: TextInputAction.next,
                  onSaved: (value) {
                    editedprod = Product(
                        id: editedprod.id,
                        title: value.toString(),
                        description: editedprod.description,
                        price: editedprod.price,
                        imageUrl: editedprod.imageUrl);
                  },
                  onFieldSubmitted: (_) => {
                    FocusScope.of(context).requestFocus(price_focus),
                  },
                ),
                TextFormField(
                  initialValue: initvalue['price'],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This Field Cant Be Empty';
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'Price'),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  focusNode: price_focus,
                  onSaved: (value) {
                    editedprod = Product(
                        id: editedprod.id,
                        title: editedprod.title,
                        description: editedprod.description,
                        price: int.parse(value.toString()),
                        imageUrl: editedprod.imageUrl);
                  },
                  onFieldSubmitted: (_) =>
                      {FocusScope.of(context).requestFocus(desc_focus)},
                ),
                TextFormField(
                  initialValue: initvalue['descp'],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This Field Cant Be Empty';
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'Description'),
                  // textInputAction: TextInputAction.next,
                  maxLines: 3,
                  onSaved: (value) {
                    editedprod = Product(
                        id: editedprod.id,
                        title: editedprod.title,
                        description: value.toString(),
                        price: editedprod.price,
                        imageUrl: editedprod.imageUrl);
                  },
                  keyboardType: TextInputType.multiline,
                  focusNode: desc_focus,
                ),
                Row(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          //image:  DecorationImage(image:NetworkImage(uurl),fit: BoxFit.cover ),
                          border: Border.all(width: 1, color: Colors.grey)),
                      margin: EdgeInsets.only(
                        top: 18,
                        right: 16,
                      ),
                      child: imageController.text.isEmpty
                          ? Text('Enter URL')
                          : FittedBox(
                              child: Image.network(uurl, key: ValueKey(uurl)),
                              //sfit: BoxFit.fill,
                            ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            // initialValue: initvalue['imageurl'],
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'This Field Cant Be Empty';
                              }
                              return null;
                            },
                            decoration: InputDecoration(labelText: 'Image URL'),
                            keyboardType: TextInputType.url,
                            onSaved: (value) {
                              editedprod = Product(
                                  id: editedprod.id,
                                  title: editedprod.title,
                                  description: editedprod.description,
                                  price: editedprod.price,
                                  imageUrl: value.toString());
                            },
                            textInputAction: TextInputAction.done,
                            controller: imageController,
                            onFieldSubmitted: (_) => {
                              setState(() {
                                uurl = imageController.text;
                              }),
                              print(uurl)
                            },
                          ),
                          Card(
                            margin: EdgeInsets.only(top: 10),
                            child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    uurl = imageController.text;
                                  });
                                  print(uurl);
                                  imageCache.clear();
                                },
                                child: Text("Upload")),
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            )),
      ),
    );
  }
}
