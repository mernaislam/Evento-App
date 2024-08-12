import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({
    super.key,
    required this.images,
  });
  final List<dynamic> images;

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  late List<Widget> _items;
  int _currIdx = 0;
  
  @override
  void initState() {
    super.initState();
    _items = widget.images
        .map((img) => Image.network(
              img,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 400,
            ))
        .toList();
  }
  
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CarouselSlider(
          items: _items,
          options: CarouselOptions(
            height: 400.spMin,
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
                dotWidth: 11, dotHeight: 11, dotColor: Colors.white),
          ),
        ),
      ],
    );
  }
}
