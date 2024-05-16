import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shoesly/core/constant/app_assets.dart';
import 'package:shoesly/core/constant/app_colors.dart';
import 'package:shoesly/core/route/app_router.dart';
import 'package:shoesly/features/cart/presentation/bloc/cart_bloc.dart';

class CartIconButton extends StatelessWidget {
  const CartIconButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          context.router.push(const CartRoute());
        },
        icon: Stack(
          children: [
            SvgPicture.asset(AppAssets.cartIcon),
            Positioned(
              right: 02,
              top: 03,
              child:
                  BlocBuilder<CartBloc, CartState>(builder: (context, state) {
                return state.whenOrNull(getCartSuccess: (carts) {
                      return Container(
                        height: 8,
                        width: 8,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.waringColor),
                      );
                    }) ??
                    const SizedBox();
              }),
            )
          ],
        ));
  }
}
