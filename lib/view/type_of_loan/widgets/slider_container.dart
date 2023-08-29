import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SliderContainer extends StatelessWidget {
  const SliderContainer({super.key, required this.color});
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Adaptive.w(21),
      height: Adaptive.h(0.45),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: color,
      ),
    );
  }
}
