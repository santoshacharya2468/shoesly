import 'package:flutter/material.dart';
import 'package:shoesly/core/enum/product_color.dart';
import 'package:shoesly/core/widget/colum_with_padding.dart';
import 'package:shoesly/features/cart/data/model/cart_item.dart';

class OrderSummaryCartItemView extends StatelessWidget {
  final List<CartItem> items;
  const OrderSummaryCartItemView({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ColumnEachChildPadding(
      crossAxisAlignment: CrossAxisAlignment.start,
      padding: const EdgeInsets.only(bottom: 10),
      children: [
        Text(
          "Order Detail",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Column(
          children: items
              .map((cart) => ColumnEachChildPadding(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    padding: const EdgeInsets.only(bottom: 0),
                    children: [
                      Text(cart.product.name),
                      const SizedBox(
                        height: 06,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${cart.product.brand.name}. ${cart.productColor?.text}. ${cart.size} Qty ${cart.quantity}",
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          Text(
                            "\$${cart.product.price * cart.quantity}",
                          ),
                        ],
                      ),
                    ],
                  ))
              .toList(),
        ),
      ],
    );
  }
}
