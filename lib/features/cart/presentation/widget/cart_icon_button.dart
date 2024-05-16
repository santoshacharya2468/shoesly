import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shoesly/core/constant/app_assets.dart';

class CartIconButton extends StatelessWidget {
  final VoidCallback onpressed;
  const CartIconButton({super.key, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onpressed, icon: SvgPicture.asset(AppAssets.cartIcon));
  }
}
