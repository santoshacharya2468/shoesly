import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shoesly/core/constant/app_assets.dart';
import 'package:shoesly/core/constant/app_colors.dart';
import 'package:shoesly/core/enum/product_color.dart';
import 'package:shoesly/core/widget/app_card.dart';
import 'package:shoesly/core/widget/app_netork_image.dart';
import 'package:shoesly/core/widget/colum_with_padding.dart';
import 'package:shoesly/features/cart/data/model/cart_item.dart';

class SingleCartItemView extends StatelessWidget {
  final CartItem cartItem;
  final VoidCallback onDelete;
  final void Function(int quantity) onUpdate;
  const SingleCartItemView(
      {super.key,
      required this.cartItem,
      required this.onDelete,
      required this.onUpdate});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.endToStart,
      key: ObjectKey(cartItem.id),
      onDismissed: (details) {
        onDelete();
      },
      background: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.waringColor),
        child: Row(
          children: [
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 30.0),
              child: SvgPicture.asset(
                AppAssets.trashIcon,
                height: 20,
                width: 20,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 80,
              height: 80,
              child: AppCard(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: AppCachedNetworkImageView(
                  url: cartItem.product.image,
                ),
              )),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
                child: ColumnEachChildPadding(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              padding: const EdgeInsets.only(bottom: 06),
              children: [
                Text(
                  cartItem.product.name,
                ),
                Text(
                  "${cartItem.product.brand.name}. ${cartItem.productColor?.text}. ${cartItem.size}",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("\$${cartItem.product.price * cartItem.quantity}",
                        style: Theme.of(context).textTheme.titleMedium),
                    Row(
                      children: [
                        _buildQuantityButton(isAddAction: false),
                        Text(
                          "${cartItem.quantity}",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        _buildQuantityButton(isAddAction: true)
                      ],
                    ),
                  ],
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }

  Widget _buildQuantityButton({required bool isAddAction}) {
    bool enabled = true;
    if (!isAddAction && cartItem.quantity == 1) {
      enabled = false;
    }
    final color = !enabled ? AppColors.borderColor : AppColors.blackColor;
    return InkWell(
      onTap: enabled
          ? () {
              onUpdate(
                  isAddAction ? cartItem.quantity + 1 : cartItem.quantity - 1);
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
            isAddAction ? Icons.add : Icons.remove,
            size: 10,
            color: color,
          ),
        ),
      ),
    );
  }
}
