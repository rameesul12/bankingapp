import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SliderContainer extends StatelessWidget {
   SliderContainer({
    super.key,
    required this.color
  });
 final Color color;

  @override
  Widget build(BuildContext context) {
     return Container(
     width: Adaptive.w(22),
     height: Adaptive.h(0.4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color:color,
      ),
    );
  }
}