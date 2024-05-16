import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shoesly/features/cart/data/model/add_to_cart_request_model.dart';
import 'package:shoesly/features/cart/data/model/cart_item.dart';
import 'package:shoesly/features/cart/data/repository/i_cart_repository.dart';

part "cart_bloc.freezed.dart";

part "cart_event.dart";

part "cart_state.dart";

@injectable
class CartBloc extends Bloc<CartEvent, CartState> {
  final ICartRepository cartRepository;
  final FirebaseAuth auth;
  CartBloc(this.cartRepository, this.auth)
      : super(const CartState.cartInitial()) {
    on<CartEvent>((event, emit) async {
      String? userId = auth.currentUser?.uid;
      if (userId == null) {
        final newUser = await auth.signInAnonymously();
        userId = newUser.user?.uid;
      }
      if (userId == null) {
        emit(const CartState.failure("Unable to create user"));
        return;
      }
      await event.when(getCart: () async {
        emit(const CartState.loading());
        final response = await cartRepository.getCartItems(userId!);
        if (response.success) {
          emit(CartState.getCartSuccess(cartItems: response.data!));
        } else {
          emit(CartState.failure(response.message));
        }
      }, deleteCartItem: (id) async {
        await cartRepository.deleteCartItem(id);

        add(const CartEvent.getCart());
      }, updateCartItem: (id, quantity) {
        cartRepository.updateCartItem(id, quantity);
        add(const CartEvent.getCart());
      }, addToCart: (request) async {
        request.userId = userId;
        emit(const CartState.loading());
        final response = await cartRepository.addToCart(request);
        final getCartResponse = await cartRepository.getCartItems(userId!);
        if (response) {
          emit(const CartState.addToCartSuccess());
          await Future.delayed(const Duration(milliseconds: 200));
          emit(CartState.getCartSuccess(cartItems: getCartResponse.data!));
        }
      });
    });
  }
}
