import 'package:flutter/material.dart';
import 'package:shoesly/core/constant/app_colors.dart';

class AppOutlinedTextButton extends StatelessWidget {
  final String text;
  final Color? color;
  final Color? textColor;
  final VoidCallback onPressed;
  const AppOutlinedTextButton(
      {super.key,
      required this.text,
      this.color,
      this.textColor,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 40,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color ?? AppColors.blackColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            text,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: textColor ?? Colors.white),
          ),
        ),
      ),
    );
  }
}
