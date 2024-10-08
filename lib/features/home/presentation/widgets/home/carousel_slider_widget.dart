


import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../cubits/home_lists_cubit/home_lists_cubit.dart';
import 'carousel_container_item.dart';


class CarouselSliderWidget extends StatelessWidget {
  const CarouselSliderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(
          horizontal: 15.w),
      child: CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          scrollDirection: Axis.horizontal,
          aspectRatio: 327 / 295,
          enableInfiniteScroll: true,
          clipBehavior: Clip.none,
          viewportFraction: 1,
          initialPage: 0,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayCurve: Curves.easeIn,
        ),
        items: [1, 2].map((i) {
          return Builder(
            builder: (BuildContext context) {
              return CarouselContainerItem(
                index: i,
                carouselSliderModel:  HomeListsCubit.get(context).carouselSliderList[i - 1],
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
