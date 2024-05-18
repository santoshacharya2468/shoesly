import 'package:flutter/material.dart';
import 'package:shoesly/core/constant/app_colors.dart';
import 'package:shoesly/core/enum/product_color.dart';
import 'package:shoesly/core/widget/app_outline_box.dart';

class ProductColorFilterView extends StatelessWidget {
  final ProductColor? color;
  final void Function(ProductColor gender) onSelected;
  const ProductColorFilterView(
      {super.key, required this.onSelected, this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Color",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
          height: 40,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: ProductColor.values.map((e) {
              final selected = color == e;
              return Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: InkWell(
                  onTap: () {
                    onSelected(e);
                  },
                  child: AppOutlinedBox(
                      color: selected ? AppColors.blackColor : null,
                      child: Row(
                        children: [
                          Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                                color: e.value,
                                shape: BoxShape.circle,
                                border: Border.all(
                                    width: 1, color: AppColors.borderColor)),
                          ),
                          const SizedBox(
                            width: 03,
                          ),
                          Text(
                            e.text,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                    color: selected ? Colors.white : null),
                          ),
                        ],
                      )),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
