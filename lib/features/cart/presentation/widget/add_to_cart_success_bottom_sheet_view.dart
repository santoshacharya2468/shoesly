import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoesly/core/constant/app_colors.dart';
import 'package:shoesly/core/route/app_router.dart';
import 'package:shoesly/core/widget/app_outlined_text_button.dart';
import 'package:shoesly/core/widget/colum_with_padding.dart';
import 'package:shoesly/features/cart/presentation/bloc/cart_bloc.dart';

///Widget will be shown when user add to cart event is success
class AddToCartSuccessBottomSheet extends StatelessWidget {
  const AddToCartSuccessBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(10), topLeft: Radius.circular(10))),
      child: ColumnEachChildPadding(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 1, color: AppColors.blackColor)),
            child: const Center(
              child: Icon(
                Icons.check,
                color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text("Added to cart"),
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              return state.whenOrNull(getCartSuccess: (carts) {
                    return Text("${carts.length} item total");
                  }) ??
                  const SizedBox();
            },
          ),
          const SizedBox(
            height: 06,
          ),
          Row(
            children: [
              Expanded(
                child: AppOutlinedTextButton(
                    text: "BACK EXPLORE",
                    color: Colors.white,
                    textColor: Colors.black,
                    onPressed: () {
                      context.maybePop();
                    }),
              ),
              const SizedBox(
                width: 50,
              ),
              Expanded(
                child: AppOutlinedTextButton(
                    text: "VIEW CART",
                    onPressed: () {
                      context.router.popAndPush(const CartRoute());
                    }),
              ),
            ],
          )
        ],
      ),
    );
  }
}
