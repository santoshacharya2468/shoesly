import 'package:flutter/material.dart';
import 'package:shoesly/core/constant/app_assets.dart';
import 'package:shoesly/core/widget/app_svg.dart';

class StarView extends StatelessWidget {
  const StarView({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppAssetImage(
      asset: AppAssets.starIcon,
      color: Colors.yellow,
      height: 15,
      width: 15,
    );
  }
}

class StarAndAvgScoreView extends StatelessWidget {
  final num avgScore;
  const StarAndAvgScoreView({super.key, required this.avgScore});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const StarView(),
        const SizedBox(width: 2),
        Text(avgScore.toString(),
            style: Theme.of(context).textTheme.bodyMedium?.copyWith()),
        const SizedBox(width: 5),
      ],
    );
  }
}
