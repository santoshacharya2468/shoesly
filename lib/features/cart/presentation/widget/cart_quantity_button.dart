import 'package:flutter/material.dart';
import 'package:shoesly/core/constant/app_colors.dart';

enum CartQuantityAction {
  add,
  remove,
}

class CartQuantityButton extends StatelessWidget {
  final CartQuantityAction action;
  final int quantity;
  final void Function(int quantity) onUpdate;
  const CartQuantityButton(
      {super.key,
      required this.action,
      required this.quantity,
      required this.onUpdate});

  @override
  Widget build(BuildContext context) {
    bool enabled = true;
    if (action == CartQuantityAction.remove && quantity == 1) {
      enabled = false;
    }
    final color = !enabled ? AppColors.borderColor : AppColors.blackColor;
    return InkWell(
      onTap: enabled
          ? () {
              onUpdate(action == CartQuantityAction.add
                  ? quantity + 1
                  : quantity - 1);
            }
          : null,
      child: Container(
        height: 20,
        width: 20,
        margin: const EdgeInsets.symmetric(horizontal: 05),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              width: 1,
              color: color,
            )),
        child: Center(
          child: Icon(
            action == CartQuantityAction.add ? Icons.add : Icons.remove,
            size: 10,
            color: color,
          ),
        ),
      ),
    );
  }
}
