import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shoesly/core/route/app_router.dart';
import 'package:shoesly/features/product/data/model/product_filter.dart';

class FilterButton extends StatelessWidget {
  final ProductFilter appliedFilter;
  const FilterButton({super.key, required this.appliedFilter});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.router.push(ProductFilterRoute(
          filter: appliedFilter,
        ));
      },
      child: Container(
        height: 40,
        width: 100,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 7,
                offset: const Offset(0, 1), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.circular(20)),
        child: const Center(
          child: Icon(
            Icons.filter_1_outlined,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
