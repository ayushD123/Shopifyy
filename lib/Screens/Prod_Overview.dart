import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopify/Widgets/featuredButton.dart';
import 'package:shopify/Widgets/home_buttons.dart';
import 'package:shopify/Widgets/product_grid.dart';
import 'package:shopify/consts/colors.dart';
import 'package:shopify/consts/consts.dart';
import 'package:shopify/consts/images.dart';
import 'package:shopify/consts/strings.dart';
import 'package:shopify/consts/lists.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:velocity_x/velocity_x.dart';
import '../Widgets/badge.dart';
import '../Provider/cart.dart';
import '../Screens/cartTotal.dart';
import 'package:shopify/consts/lists.dart';
import 'package:velocity_x/velocity_x.dart';
import '../Widgets/app_drawer.dart';

enum filterOption { Favourites, All }

class ProductOverviewScreen extends StatefulWidget {
  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  List saleTitles = [
    "Laptops",
    "Cosmetics",
    "Macbooks",
    "Sandals",
    "Purses",
    "Sneakers",
    "Glasses"
  ];
  List saleOffers = [
    "10% Off",
    "30% Off",
    "30% Off",
    "25% Off",
    "20% Off",
    "10% Off",
    "15% Off"
  ];
  List discountsico = [imgFc1, imgFc2, imgPi5, imgFc5, imgFc9, imgFc6];
  List discountstitle = [
    "Men Suits",
    "Macbook Air",
    "Iphone 11",
    "Toys And Games",
    "Sofa Sets",
    "Iphone(Refurbished)"
  ];
  List discountPrice = [
    "Starting From",
    "EMI From",
    "Starting From",
    "Starting From",
    "Starting From",
    "Exchange Offer",
  ];
  List discountCost = [
    "₹999",
    "₹2999/Month",
    "₹34999",
    "₹499",
    "₹9999",
    "₹15000",
  ];
  var ShowOnlyFav = false;
  var navbaritem = [
    BottomNavigationBarItem(
        icon: Image.asset(
          icHome,
          width: 26,
        ),
        label: home),
    BottomNavigationBarItem(
        icon: Image.asset(
          icCategories,
          width: 26,
        ),
        label: categories),
    BottomNavigationBarItem(
        icon: Image.asset(
          icCart,
          width: 26,
        ),
        label: cart),
    BottomNavigationBarItem(
        icon: Image.asset(
          icProfile,
          width: 26,
        ),
        label: account)
  ];
  //const ProductOverviewScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGrey,
      bottomNavigationBar: BottomNavigationBar(
        items: navbaritem,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
      ),
      drawer: AppDrawer(),
      appBar: AppBar(
        title: const Text("Shopify"),
        actions: [
          PopupMenuButton(
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text("Show Only Favourites"),
                value: filterOption.Favourites,
              ),
              PopupMenuItem(
                child: Text("Show All"),
                value: filterOption.All,
              )
            ],
            icon: Icon(Icons.more_vert),
            onSelected: (selectedValue) {
              setState(() {
                if (selectedValue == filterOption.Favourites) {
                  ShowOnlyFav = true;
                } else {
                  ShowOnlyFav = false;
                }
              });
            },
          ),
          // Consumer<Cart>(
          //     builder: (_, cartData, __) => Badge(
          //         child: IconButton(
          //           onPressed: () {
          //             Navigator.of(context).pushNamed(CartTotal.routeName);
          //           },
          //           icon: Icon(Icons.shopping_cart),
          //         ),
          //         value: cartData.itemCount.toString(),
          //         color: Colors.red.shade900))
        ],
      ),
      body: Container(
        // height: MediaQuery.of(context).size.height,
        height: context.screenHeight,
        width: context.screenWidth,
        padding: EdgeInsets.all(12),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                color: lightGrey,
                padding: EdgeInsets.only(bottom: 10),
                child: TextFormField(
                  decoration: InputDecoration(
                      suffixIcon: Icon(Icons.search),
                      filled: true,
                      fillColor: whiteColor,
                      hintText: "Search Anything...",
                      hintStyle: TextStyle(color: textfieldGrey)),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      VxSwiper.builder(
                          viewportFraction: 1.0,
                          autoPlay: true,
                          enlargeCenterPage: true,
                          height: 150.0,
                          itemCount: slidd.length,
                          itemBuilder: (context, index) {
                            return Image.asset(
                              slidd[index],
                              fit: BoxFit.fill,
                            )
                                .box
                                .rounded
                                .clip(Clip.antiAlias)
                                .margin(EdgeInsets.symmetric(horizontal: 5))
                                .shadowSm
                                .make();
                          }),
                      10.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(
                            2,
                            (index) => HomeButton(
                                context.screenHeight * 0.15,
                                context.screenWidth / 2.5,
                                index == 0 ? "Today's deal" : "Flash Sale",
                                index == 0 ? icTodaysDeal : icFlashDeal)),
                      ),
                      10.heightBox,
                      VxSwiper.builder(
                          // viewportFraction: 1,
                          autoPlay: true,
                          enlargeCenterPage: true,
                          height: 150,
                          itemCount: slider1.length,
                          itemBuilder: (context, index) {
                            return Image.asset(
                              slider1[index],
                              fit: BoxFit.fill,
                            )
                                .box
                                .rounded
                                .clip(Clip.antiAlias)
                                .margin(EdgeInsets.symmetric(horizontal: 5))
                                .shadowSm
                                .make();
                          }),
                      10.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(
                            3,
                            (index) => HomeButton(
                                context.screenHeight * 0.10,
                                context.screenWidth / 3.5,
                                index == 0
                                    ? "Top Categories"
                                    : index == 1
                                        ? "Top Brands"
                                        : "Top Seller",
                                index == 0
                                    ? icTopCategories
                                    : index == 1
                                        ? icBrands
                                        : icTopSeller)),
                      ),
                      10.heightBox,
                      Align(
                        alignment: Alignment.centerLeft,
                        child: "Featured Categories"
                            .text
                            .color(darkFontGrey)
                            .size(21)
                            .fontFamily(semibold)
                            .make(),
                      ),
                      10.heightBox,
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                              3,
                              (index) => Column(children: [
                                    FeaturedButton(featuredTitles1[index],
                                        featuredImages1[index]),
                                    10.heightBox,
                                    FeaturedButton(featuredTitles2[index],
                                        featuredImages2[index]),
                                  ])).toList(),
                        ),
                      ),
                      10.heightBox,
                      Container(
                        padding: EdgeInsets.all(10),
                        width: double.infinity,
                        decoration: const BoxDecoration(color: redColor),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            "Discounts Of You"
                                .text
                                .size(18)
                                .fontFamily(bold)
                                .white
                                .make(),
                            10.heightBox,
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: List.generate(
                                    7,
                                    (index) => Column(
                                          children: [
                                            Image.asset(
                                              sale[index],
                                              width: 150,
                                              fit: BoxFit.cover,
                                            ),
                                            10.heightBox,
                                            saleTitles[index]
                                                .toString()
                                                .text
                                                .fontFamily(semibold)
                                                .color(darkFontGrey)
                                                .make(),
                                            10.heightBox,
                                            saleOffers[index]
                                                .toString()
                                                .text
                                                .color(redColor)
                                                .bold
                                                .fontFamily(bold)
                                                .size(10)
                                                .make()
                                          ],
                                        )
                                            .box
                                            .white
                                            .roundedSM
                                            .margin(EdgeInsets.symmetric(
                                                horizontal: 2))
                                            .padding(EdgeInsets.all(8))
                                            .make()),
                              ),
                            )
                          ],
                        ),
                      ),
                      10.heightBox,
                      Align(
                        alignment: Alignment.centerLeft,
                        child: "Handpicked For You"
                            .text
                            .color(darkFontGrey)
                            .size(21)
                            .fontFamily(semibold)
                            .make(),
                      ),
                      Container(
                          // width: context.screenWidth,
                          // height: context.screenHeight,
                          child: ProductsGrid(ShowOnlyFav)),
                      10.heightBox,
                      Align(
                        alignment: Alignment.centerLeft,
                        child: "Discounts"
                            .text
                            .color(darkFontGrey)
                            .size(21)
                            .fontFamily(semibold)
                            .make(),
                      ),
                      Image.asset(
                        imgFd1,
                        width: context.screenWidth,
                        height: 120,
                        fit: BoxFit.fill,
                      ),
                      10.heightBox,
                      GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 6,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 8,
                                  crossAxisSpacing: 8,
                                  mainAxisExtent: 300),
                          itemBuilder: (context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  discountsico[index],
                                  width: 200,
                                  height: 200,
                                  fit: BoxFit.cover,
                                ),
                                //  Spacer(),
                                discountstitle[index]
                                    .toString()
                                    .text
                                    .semiBold
                                    .fontFamily(semibold)
                                    .color(darkFontGrey)
                                    .make(),
                                10.heightBox,
                                discountPrice[index]
                                    .toString()
                                    .text
                                    .bold
                                    .color(Colors.green)
                                    .fontFamily(bold)
                                    .size(16)
                                    .make(),
                                discountCost[index]
                                    .toString()
                                    .text
                                    .semiBold
                                    .color(darkFontGrey)
                                    .fontFamily(semibold)
                                    .size(16)
                                    .make()
                              ],
                            )
                                .box
                                .white
                                .roundedSM
                                .margin(EdgeInsets.symmetric(horizontal: 4))
                                .padding(EdgeInsets.all(8))
                                .make();
                          })
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
