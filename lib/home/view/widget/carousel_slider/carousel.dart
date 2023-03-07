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
                      : Stack(children: [
                          Image.network('${carousalC.carouselList[index].url}'),
                          Center(
                              child: Text(
                            carousalC.carouselList[index].title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          )),
                          Positioned(bottom: 0,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: carousalC.carouselList.map((url) {
                                  int index = carousalC.carouselList.indexOf(url);
                                  return Container(
                                    width: 8.0,
                                    height: 8.0,
                                    margin: EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 2.0),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: carousalC.position == index
                                          ? Color.fromRGBO(0, 0, 0, 0.9)
                                          : Color.fromRGBO(0, 0, 0, 0.4),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          )
                        ]),
              options: CarouselOptions(
                onPageChanged: (index, reason) {
                  carousalC.positionChange(index);
                },
                height: 190.0,
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
