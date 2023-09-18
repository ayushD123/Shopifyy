import 'package:flutter/cupertino.dart';
import 'package:shopify/consts/consts.dart';
import 'package:velocity_x/velocity_x.dart';

Widget FeaturedButton(title, icon) {
  return Row(
    children: [
      Image.asset(icon, width: 60, fit: BoxFit.fill),
      10.widthBox,
      title.toString().text.fontFamily(semibold).color(darkFontGrey).make(),
    ],
  )
      .box
      .width(200)
      .margin(EdgeInsets.symmetric(horizontal: 4))
      .white
      .padding(EdgeInsets.all(5))
      .make();
}
