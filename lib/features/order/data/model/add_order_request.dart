import 'package:shoesly/core/decorator/json_decorator.dart';
import 'package:shoesly/features/cart/data/model/cart_item.dart';
part "add_order_request.g.dart";

enum PaymentMethod { cash, online }

@requestModel
class AddOrderRequest {
  final List<CartItem> items;
  final double subTotal;
  final double shippingFee;
  final double total;
  final PaymentMethod paymentMethod;
  final ShippingAddress? shippingAddress;

  AddOrderRequest(
      {required this.paymentMethod,
      required this.items,
      required this.subTotal,
      required this.shippingFee,
      required this.total,
      required this.shippingAddress});
  Map<String, dynamic> toJson() => _$AddOrderRequestToJson(this);
}

@requestModel
class ShippingAddress {
  final String address;

  ShippingAddress({required this.address});

  Map<String, dynamic> toJson() => _$ShippingAddressToJson(this);
}
