import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:ebizzousel/common/base_url/base_url.dart';
import 'package:ebizzousel/common/end_url/end_url.dart';
import 'package:ebizzousel/home/controller/home_controller.dart';
import 'package:ebizzousel/home/view/widget/shimmer.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CarouselHome extends StatelessWidget {
  const CarouselHome({super.key});

  @override
  Widget build(BuildContext context) {
    final carousalC = Get.put(HomeController());
    // log(carousalC.carouselList.length.toString(), name: 'carouselCaheck');
    return GetBuilder<HomeController>(
      builder: (controller) => carousalC.isLoding == true
          ? const CarouselShimmer()
          : CarouselSlider.builder(
              itemCount: carousalC.carouselList.length,
              itemBuilder: (BuildContext context, int index, int realIndex) =>
                  carousalC.carouselList.isEmpty
                      ? const CarouselShimmer()
                      : Image.network(
                          '${carousalC.carouselList[index].url}'),
              options: CarouselOptions(
                height: 180.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                viewportFraction: 1,
              )),
    );
  }
}
