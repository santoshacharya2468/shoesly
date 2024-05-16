import 'package:flutter/material.dart';
import 'package:shoesly/features/brand/data/model/brand.dart';

class SingleBrandView extends StatelessWidget {
  final Brand brand;
  final bool selected;
  final VoidCallback onPressed;
  const SingleBrandView(
      {super.key,
      required this.brand,
      required this.selected,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Text(
          brand.name,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: selected ? Colors.black : Colors.grey,
              fontSize: 17,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
