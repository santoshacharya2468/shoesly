import 'package:flutter/material.dart';
import 'package:shoesly/core/constant/app_colors.dart';

class AppOutlinedBox extends StatelessWidget {
  final Widget child;
  final Color? color;
  const AppOutlinedBox({super.key, required this.child, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 1, color: AppColors.borderColor)),
      child: child,
    );
  }
}
