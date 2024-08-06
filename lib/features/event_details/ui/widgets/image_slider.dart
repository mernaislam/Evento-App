import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({super.key});

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
   // static items just for testing
  final _items = [
    Image.network(
      'https://cdn.pixabay.com/photo/2022/08/31/20/47/concert-7424190_640.jpg',
      fit: BoxFit.cover,
      width: double.infinity,
      height: 400,
    ),
    Image.network(
      fit: BoxFit.cover,
      width: double.infinity,
      height: 400,
      'https://cdn.pixabay.com/photo/2015/11/22/19/04/crowd-1056764_640.jpg',
    ),
    Image.network(
      fit: BoxFit.cover,
      width: double.infinity,
      height: 400,
      'https://cdn.pixabay.com/photo/2020/01/15/17/38/fireworks-4768501_640.jpg',
    ),
    Image.network(
      fit: BoxFit.cover,
      width: double.infinity,
      height: 400,
      'https://cdn0.weddingwire.in/vendor/3007/3_2/960/jpg/rock-music-event1_15_163007-163973098155561.jpeg',
    ),
  ];
  int _currIdx = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
              alignment: Alignment.bottomCenter,
              children: [
                CarouselSlider(
                  items: _items,
                  options: CarouselOptions(
                    height: 400,
                    initialPage: 0,
                    autoPlay: true,
                    viewportFraction: 1,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currIdx = index;
                      });
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: AnimatedSmoothIndicator(
                    activeIndex: _currIdx,
                    count: _items.length,
                    effect: const WormEffect(
                      dotWidth: 11,
                      dotHeight: 11,
                      dotColor: Colors.white
                    ),
                  ),
                ),
              ],
            );
  }
}