import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppAssetImage extends StatelessWidget {
  final String asset;
  final Color? color;
  final double? height;
  final double? width;

  const AppAssetImage(
      {super.key, required this.asset, this.color, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return SvgPicture.asset(asset, color: color, height: height, width: width);
  }
}
