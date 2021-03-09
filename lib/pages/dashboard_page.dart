import 'package:FoodAp/widgets/widget_home_categories.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:FoodAp/widgets/widget_home_products.dart';
import 'package:FoodAp/config.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.white,
          child: ListView(
            children: [
              imageCarousel(context),
              WidgetCategories(),
              WidgetHomeProducts(
                labelName: "Top Savers Today!",
                tagId: Config.todayOffersTagId,
              ),
            ],
          )),
    );
  }

  Widget imageCarousel(BuildContext context) {
    return new Container(
      width: MediaQuery.of(context).size.width,
      height: 200,
      child: new Carousel(
        overlayShadow: false,
        borderRadius: true,
        boxFit: BoxFit.none,
        autoplay: true,
        dotSize: 4.0,
        images: [
          FittedBox(
            fit: BoxFit.fill,
            child: Image.network("URL1"),
          ),
          FittedBox(
            fit: BoxFit.fill,
            child: Image.network("URL2"),
          ),
          FittedBox(
            fit: BoxFit.fill,
            child: Image.network("URL3"),
          ),
          FittedBox(
            fit: BoxFit.fill,
            child: Image.network("URL4"),
          ),
        ],
      ),
    );
  }
}
