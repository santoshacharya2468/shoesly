import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shoesly/core/constant/app_colors.dart';
import 'package:shoesly/features/brand/data/model/brand.dart';

enum ViewType { textType, circularType }

class SingleBrandView extends StatelessWidget {
  final Brand brand;
  final bool selected;
  final VoidCallback onPressed;
  final ViewType type;
  const SingleBrandView(
      {super.key,
      required this.brand,
      required this.selected,
      required this.onPressed,
      this.type = ViewType.textType});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: type == ViewType.circularType
            ? _circularView(context)
            : Text(
                brand.name,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: selected ? Colors.black : Colors.grey,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
      ),
    );
  }

  Widget _circularView(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.borderColor,
                    width: 1,
                  )),
              child: Center(
                child: SvgPicture.network(
                  brand.logo,
                  color: Colors.grey,
                ),
              ),
            ),
            if (selected)
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  height: 16,
                  width: 16,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: AppColors.blackColor),
                  child: const Center(
                    child: Icon(
                      Icons.check,
                      size: 10,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
          ],
        ),
        Text(
          brand.name,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Text(
          "10 Items",
          style: Theme.of(context).textTheme.titleSmall,
        )
      ],
    );
  }
}
