//Slider some products
//like a advertisement

import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class ImageCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.0,
      child: Carousel(
        boxFit: BoxFit.fill,
        images: [
          //Resimlerin sırası önemli
          AssetImage("assets/images/TelefonTablet.jpg"),
          AssetImage("assets/images/tv.jpg"),
          AssetImage("assets/images/Mercedes G Class.jpg"),
          AssetImage("assets/images/Amasra.jpg"),
        ],
        autoplay: true,
        animationCurve: Curves.decelerate,
        animationDuration: Duration(seconds: 1),
//Slider altındaki noktaların tasarımı
        dotSize: 3.0,
        dotColor: Colors.white,
        dotIncreasedColor: Colors.deepOrange,
        dotBgColor: Colors.transparent,
        indicatorBgPadding: 15.0,
        dotSpacing: 15.0,
        dotIncreaseSize: 3.0,
      ),
    );
  }
}
