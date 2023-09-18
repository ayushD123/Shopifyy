import 'package:flutter/cupertino.dart';
import 'package:shopify/consts/consts.dart';
import 'package:velocity_x/velocity_x.dart';

Widget HomeButton(height,width,textt,icon){
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
children: [
  Image.asset(icon,width: 26,),
  10.heightBox,
textt.toString().text.fontFamily(semibold).color(darkFontGrey).make()
],
  ).box.rounded.size(width, height).shadowSm.white.make();
}