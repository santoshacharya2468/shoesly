import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoesly/core/di/di_config.dart';
import 'package:shoesly/core/widget/base_view.dart';
import 'package:shoesly/core/widget/error_view.dart';
import 'package:shoesly/core/widget/loading_place_holder.dart';
import 'package:shoesly/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:shoesly/features/cart/presentation/widget/single_cart_item_view.dart';

@RoutePage()
class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final CartBloc _cartBloc = getIt<CartBloc>();
  @override
  Widget build(BuildContext context) {
    return BaseView(
        title: "Cart",
        body: BlocProvider(
          create: (context) => _cartBloc..add(const CartEvent.getCart()),
          child: BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              return state.when(
                  cartInitial: loadingView,
                  loading: loadingView,
                  addToCartSuccess: loadingView,
                  failure: errorView,
                  getCartSuccess: (carts) {
                    return ListView.builder(
                      itemCount: carts.length,
                      itemBuilder: (context, index) {
                        final cart = carts[index];
                        return SingleCartItemView(
                          cartItem: cart,
                          onDelete: () {
                            _cartBloc.add(CartEvent.deleteCartItem(cart.id!));
                          },
                          onUpdate: (quantity) {
                            _cartBloc.add(
                                CartEvent.updateCartItem(cart.id!, quantity));
                          },
                        );
                      },
                    );
                  });
            },
          ),
        ));
  }
}
