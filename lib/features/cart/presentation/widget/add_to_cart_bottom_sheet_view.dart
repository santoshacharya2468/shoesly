import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shoesly/core/constant/app_colors.dart';
import 'package:shoesly/core/widget/app_outlined_text_button.dart';
import 'package:shoesly/core/widget/colum_with_padding.dart';
import 'package:shoesly/features/cart/presentation/widget/cart_quantity_button.dart';
import 'package:shoesly/features/product/data/model/product.dart';

class AddToCartBottomSheetView extends StatefulWidget {
  final Product product;
  const AddToCartBottomSheetView({super.key, required this.product});

  @override
  State<AddToCartBottomSheetView> createState() =>
      _AddToCartBottomSheetViewState();
}

class _AddToCartBottomSheetViewState extends State<AddToCartBottomSheetView> {
  int qunatity = 1;
  final TextEditingController _quantityController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _quantityController.text = qunatity.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(10), topLeft: Radius.circular(10))),
      child: ColumnEachChildPadding(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        padding: const EdgeInsets.only(bottom: 10),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Add to cart",
                  style: Theme.of(context).textTheme.titleMedium),
              IconButton(
                  onPressed: () {
                    context.maybePop();
                  },
                  icon: const Icon(Icons.close, color: AppColors.blackColor))
            ],
          ),
          const Text("Quantity"),
          TextField(
            controller: _quantityController,
            maxLength: 2,
            onChanged: (value) {
              final q = int.tryParse(value);
              if (q != null) {
                setState(() {
                  qunatity = q;
                });
              }
            },
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              suffixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CartQuantityButton(
                      action: CartQuantityAction.remove,
                      quantity: qunatity,
                      onUpdate: (q) {
                        setState(() {
                          qunatity = q;
                          _quantityController.text = q.toString();
                        });
                      }),
                  CartQuantityButton(
                      action: CartQuantityAction.add,
                      quantity: qunatity,
                      onUpdate: (q) {
                        setState(() {
                          qunatity = q;
                          _quantityController.text = q.toString();
                        });
                      }),
                ],
              ),
              border: const UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.blackColor),
              ),
            ),
          ),
          Container(
            height: 60,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.white.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(0, 3)), // changes position of shadow
            ]),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              children: [
                Column(
                  children: [
                    Text(
                      "Total Price",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Text(
                      "\$${widget.product.price * qunatity}",
                      style: Theme.of(context).textTheme.bodyMedium,
                    )
                  ],
                ),
                const Spacer(),
                AppOutlinedTextButton(
                    text: "Add To Cart",
                    onPressed: () {
                      context.router.maybePop(qunatity);
                    })
              ],
            ),
          )
        ],
      ),
    );
  }
}
