import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shoesly/core/constant/app_assets.dart';
import 'package:shoesly/core/constant/app_colors.dart';
import 'package:shoesly/core/enum/product_color.dart';
import 'package:shoesly/core/widget/app_card.dart';
import 'package:shoesly/core/widget/app_netork_image.dart';
import 'package:shoesly/core/widget/colum_with_padding.dart';
import 'package:shoesly/features/cart/data/model/cart_item.dart';
import 'package:shoesly/features/cart/presentation/widget/cart_quantity_button.dart';

class SingleCartItemView extends StatelessWidget {
  final CartItem cartItem;

  ///onDelete will be call when user swipe to delete
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
                // ignore: deprecated_member_use
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
                  url: cartItem.product.thumbnail,
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
    return CartQuantityButton(
        action:
            isAddAction ? CartQuantityAction.add : CartQuantityAction.remove,
        quantity: cartItem.quantity,
        onUpdate: onUpdate);
  }
}
