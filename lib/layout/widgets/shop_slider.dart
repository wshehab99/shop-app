import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ShopSlider extends StatelessWidget {
  const ShopSlider({Key? key, required this.items}) : super(key: key);
  final List<Widget>? items;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: items,
        options: CarouselOptions(
          viewportFraction: 1.0,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 5),
          autoPlayAnimationDuration:
              const Duration(seconds: 1, milliseconds: 500),
          autoPlayCurve: Curves.fastLinearToSlowEaseIn,
          height: 250,
          enableInfiniteScroll: true,
          initialPage: 0,
          reverse: false,
          scrollDirection: Axis.horizontal,
        ));
  }
}
