import 'package:carousel_slider/carousel_slider.dart';

import 'package:ebizzousel/home/controller/home_controller.dart';
import 'package:ebizzousel/home/view/widget/shimmer.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CarouselHome extends StatelessWidget {
  const CarouselHome({super.key});

  @override
  Widget build(BuildContext context) {
    final carousalC = Get.put(HomeController());

    return GetBuilder<HomeController>(
      builder: (controller) => carousalC.isLoding == true
          ? const CarouselShimmer()
          : CarouselSlider.builder(
              carouselController: carousalC.carousecontroller,
              itemCount: carousalC.carouselList.length,
              itemBuilder: (BuildContext context, int index, int realIndex) =>
                  carousalC.carouselList.isEmpty
                      ? const CarouselShimmer()
                      : Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Stack(children: [
                                Row(children: [
                                  Expanded(
                                    child: Image.network(
                                        fit: BoxFit.fill,
                                        carousalC.carouselList[index].url),
                                  ),
                                ]),
                                Positioned(
                                  top: 0,
                                  left: 10,
                                  child: Center(
                                      child: Text(
                                    carousalC.carouselList[index].title,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  )),
                                ),
                              ]),
                            ),
                          ],
                        ),
              options: CarouselOptions(
                onPageChanged: (index, reason) {
                  carousalC.positionChange(index);

                  index == 3
                      ? carousalC.scrollToIndex(index)
                      : const Text('data');
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
