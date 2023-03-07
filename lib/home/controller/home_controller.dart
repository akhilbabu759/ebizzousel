import 'dart:developer';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:ebizzousel/home/model/carousel_model.dart';
import 'package:ebizzousel/home/service/carousel_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    getCarosel();

    super.onInit();
  }

  List<Carousel> carouselList = [];
  CarouselService carousalS = CarouselService();
  bool isLoding = true;
  int position = 0;
  ScrollController scrollController = ScrollController();
  CarouselController carousecontroller = CarouselController();
  void positionChange(index) {
    position = index;
    update();
  }

  void getCarosel() async {
    isLoding = false;
    log('get call');
    await carousalS.getCarosel().then((value) {
      log(value.toString());
      if (value != null) {
        log('carousel list get');
        carouselList = value;
        update();
        isLoding = false;
        update();
        log(carouselList[0].thumbnailUrl);
      } else {
        isLoding = true;
        update();
        log('value empty');
      }
    });
    isLoding = false;
    update();
  }

  void scrollToIndex(index) {
    scrollController.animateTo(scrollController.position.maxScrollExtent,
        duration: const Duration(minutes: 300), curve: Curves.linear);
    update();
  }

  void goto(indx) {
    carousecontroller.jumpToPage(int.parse(indx.toString()));
  }
}
