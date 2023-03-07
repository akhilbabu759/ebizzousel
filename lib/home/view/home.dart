import 'package:ebizzousel/home/view/widget/carousel_slider/carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.blueGrey[500],
        body: Center(
      child: CarouselHome(),
    ));
  }
}
