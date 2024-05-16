part of "cart_bloc.dart";

@freezed
class CartState with _$CartState {
  const factory CartState.getCartSuccess({
    required List<CartItem> cartItems,
  }) = _CartState;

  const factory CartState.failure(String message) = _CartStateFailure;

  const factory CartState.loading() = _CartStateLoading;

  const factory CartState.cartInitial() = _CartStateInitial;
}
