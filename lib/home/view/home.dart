import 'package:ebizzousel/home/controller/home_controller.dart';
import 'package:ebizzousel/home/view/widget/carousel_slider/carousel.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final carousalC = Get.put(HomeController());

    return Scaffold(
        backgroundColor: Colors.blueGrey[500],
        body: Column(
          children: [
            Center(
              child: GetBuilder<HomeController>(
                builder: (controller) {
                  return Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: Get.height * 0.3),
                        child: const CarouselHome(),
                      ),
                      Positioned(
                        bottom: 0,
                        left: Get.width * 0.4,
                        child: SizedBox(
                          height: 70,
                          width: 77,
                          child: Card(
                            elevation: 0,
                            color: Colors.transparent,
                            child: ListView.builder(
                              itemCount: carousalC.carouselList.length,
                              shrinkWrap: true,
                              controller: carousalC.scrollController,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => GestureDetector(
                                onTap: () => carousalC.goto(index),
                                child: Container(
                                  width: 10.0,
                                  height: 8.0,
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 2.0),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color:
                                        // carousalC.position > 3
                                        //     ? index == 3
                                        //         ? Color.fromRGBO(0, 0, 0, 0.9)
                                        //         : Color.fromRGBO(0, 0, 0, 0.4)
                                        //     :
                                        carousalC.position == index
                                            ? const Color.fromRGBO(0, 0, 0, 0.9)
                                            : const Color.fromRGBO(
                                                0, 0, 0, 0.4),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
          ],
        ));
  }
}
