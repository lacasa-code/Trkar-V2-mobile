import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeCarouselCard extends StatelessWidget {
  const HomeCarouselCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: CarouselSlider(
        items: List.generate(
            3,
            (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.asset(
                      'assets/images/car-offers${index + 1}.jpg',
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                )),
        options: CarouselOptions(
          height: ScreenUtil().setHeight(150),
          enableInfiniteScroll: false,
          initialPage: 0,
        ),
      ),
    );
  }
}
