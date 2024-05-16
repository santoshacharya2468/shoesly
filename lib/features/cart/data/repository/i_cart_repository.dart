import 'package:shoesly/core/model/base_response.dart';
import 'package:shoesly/features/cart/data/model/add_to_cart_request_model.dart';
import 'package:shoesly/features/cart/data/model/cart_item.dart';

abstract class ICartRepository {
  Future<ApiResponseList<CartItem>> getCartItems(String userId);

  Future<bool> addToCart(AddToCartRequestModel request);

  Future<bool> deleteCartItem(String cartId);

  Future<bool> updateCartItem(String cartId, int quantity);
}
