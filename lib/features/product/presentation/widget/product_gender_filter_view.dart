import 'package:flutter/material.dart';
import 'package:shoesly/core/constant/app_colors.dart';
import 'package:shoesly/core/enum/product_gender.dart';
import 'package:shoesly/core/widget/app_outline_box.dart';

class ProductGenderFilterView extends StatelessWidget {
  final Gender? gender;
  final void Function(Gender gender) onSelected;
  const ProductGenderFilterView(
      {super.key, required this.onSelected, this.gender});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Gender",
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
            children: Gender.values.map((e) {
              final selected = gender == e;
              return Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: InkWell(
                  onTap: () {
                    onSelected(e);
                  },
                  child: AppOutlinedBox(
                      color: selected ? AppColors.blackColor : null,
                      child: Center(
                          child: Text(
                        e.text,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: selected ? Colors.white : null),
                      ))),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
