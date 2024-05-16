import 'package:shoesly/core/decorator/json_decorator.dart';
part "cart_item.g.dart";

@responseModel
class CartItem {
  final String productId;
  final String productName;
  final String imageUrl;
  final double price;
  final int quantity;
  final double total;
  CartItem({
    required this.productId,
    required this.productName,
    required this.imageUrl,
    required this.price,
    required this.quantity,
    required this.total,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) =>
      _$CartItemFromJson(json);
}
