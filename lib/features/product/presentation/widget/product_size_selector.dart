import 'package:flutter/material.dart';
import 'package:shoesly/core/constant/app_colors.dart';

class ProductSizeSelector extends StatelessWidget {
  final List<num> options;
  final num? selectedSize;
  final void Function(num) onSizeSelected;
  const ProductSizeSelector(
      {super.key,
      required this.options,
      required this.selectedSize,
      required this.onSizeSelected});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Size",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(
          height: 04,
        ),
        Row(
          children: options
              .map((e) => Container(
                    height: 30,
                    width: 30,
                    margin: const EdgeInsets.only(right: 08),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.borderColor,
                        width: 1,
                      ),
                      color: selectedSize == e
                          ? AppColors.blackColor
                          : Colors.transparent,
                    ),
                    child: InkWell(
                      onTap: () {
                        onSizeSelected(e);
                      },
                      child: Center(
                        child: Text(
                          "$e",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(
                                  fontSize: 12,
                                  color:
                                      selectedSize == e ? Colors.white : null),
                        ),
                      ),
                    ),
                  ))
              .toList(),
        ),
      ],
    );
  }
}
