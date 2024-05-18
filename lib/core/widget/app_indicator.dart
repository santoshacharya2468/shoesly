import 'package:flutter/material.dart';
import 'package:shoesly/core/constant/app_colors.dart';

class AppIndicator extends StatelessWidget {
  final Color? color;
  final double radius;

  const AppIndicator({super.key, this.color, this.radius = 4});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: radius * 2,
      width: radius * 2,
      decoration: BoxDecoration(
          shape: BoxShape.circle, color: color ?? AppColors.waringColor),
    );
  }
}
