import 'dart:developer';

import 'package:ebizzousel/home/model/carousel_model.dart';
import 'package:ebizzousel/home/service/carousel_service.dart';
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
}