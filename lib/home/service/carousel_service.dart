import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ebizzousel/common/base_url/base_url.dart';
import 'package:ebizzousel/common/end_url/end_url.dart';
import 'package:ebizzousel/home/model/carousel_model.dart';
import 'package:ebizzousel/util/dio_exception/exception.dart';


class CarouselService {
  final dio = Dio();
  final abaseUrl = BaseUrl();
  final aendUrl = EndUrl();

  Future<List<Carousel>?> getCarosel() async {
    // Dio dio = await ApiInterceptor().getApiUser();
    try {
      Response response = await dio.get(abaseUrl.baseurl + aendUrl.photos);
      log('response geted');
      log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        log('entered to if condition in statuscode');
        log(response.data.toString(), name: 'carousal resposnce');
        final List<Carousel> carouselListe = (response.data as List)
            .map(
              (e) => Carousel.fromJson(e),
            )
            .toList();
        log(carouselListe.length.toString());
        return carouselListe;
      } else {
        log('entered in else case');
        return null;
      }
    } on DioError catch (e) {
      log(e.message.toString());
      DioException().dioError(
        e,
      );
    }
    return null;
  }
}
