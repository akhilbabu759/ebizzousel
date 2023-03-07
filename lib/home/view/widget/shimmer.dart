import 'package:ebizzousel/core/const_sized.dart';
import 'package:ebizzousel/util/shimmer/shimmer.dart';

import 'package:flutter/material.dart';

class CarouselShimmer extends StatelessWidget {
  const CarouselShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const SizedBox(
          width: double.infinity,
          child: ShimmerWidget.rectangle(height: 150, width: double.infinity),
        ),
        ConstSized().kHeight10,
      ],
    );
  }
}
