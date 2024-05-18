import 'package:flutter/material.dart';
import 'package:shoesly/core/widget/app_outline_box.dart';

class AppOutlinedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget? child;
  final Color? backGroundColor;
  final String? title;

  const AppOutlinedButton(
      {super.key,
      this.backGroundColor,
      this.child,
      required this.onPressed,
      this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: AppOutlinedBox(
        color: backGroundColor,
        child: title != null
            ? Center(
                child: Text(
                title!,
                style: Theme.of(context).textTheme.titleMedium,
              ))
            : child ?? const SizedBox(),
      ),
    );
  }
}
