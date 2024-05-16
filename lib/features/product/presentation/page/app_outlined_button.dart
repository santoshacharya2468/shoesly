import 'package:flutter/material.dart';
import 'package:shoesly/core/widget/app_outline_box.dart';

class AppOutlinedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final Color? backGroundColor;

  const AppOutlinedButton(
      {super.key,
      this.backGroundColor,
      required this.child,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: AppOutlinedBox(
        color: backGroundColor,
        child: child,
      ),
    );
  }
}
