import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoesly/core/extension/cart_extension.dart';
import 'package:shoesly/core/route/app_router.dart';
import 'package:shoesly/core/widget/base_view.dart';
import 'package:shoesly/core/widget/error_view.dart';
import 'package:shoesly/core/widget/loading_place_holder.dart';
import 'package:shoesly/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:shoesly/features/cart/presentation/widget/price_total_and_action_button_view.dart';
import 'package:shoesly/features/cart/presentation/widget/single_cart_item_view.dart';

@RoutePage()
class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return BaseView(
        title: "Cart",
        bottomNavigationBar: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            return state.whenOrNull(getCartSuccess: (carts) {
                  return PriceTotalAndActionButtonView(
                    buttonText: "CHECK OUT",
                    title: "Grand Total",
                    subTitle: "\$ ${carts.total.toStringAsFixed(2)}",
                    onButtonPressed: () {
                      context.router.push(const OrderSummaryRoute());
                    },
                  );
                }) ??
                const SizedBox();
          },
        ),
        body: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            return state.when(
                cartInitial: loadingView,
                loading: loadingView,
                addToCartSuccess: loadingView,
                addToCartState: loadingView,
                failure: errorView,
                getCartSuccess: (carts) {
                  return ListView.builder(
                    itemCount: carts.length,
                    itemBuilder: (context, index) {
                      final cart = carts[index];
                      return SingleCartItemView(
                        cartItem: cart,
                        onDelete: () {
                          context
                              .read<CartBloc>()
                              .add(CartEvent.deleteCartItem(cart.id!));
                        },
                        onUpdate: (quantity) {
                          context.read<CartBloc>().add(
                              CartEvent.updateCartItem(cart.id!, quantity));
                        },
                      );
                    },
                  );
                });
          },
        ));
  }
}
