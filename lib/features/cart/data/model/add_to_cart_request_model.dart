import 'package:shoesly/core/decorator/json_decorator.dart';
part "add_to_cart_request_model.g.dart";

@requestModel
class AddToCartRequestModel {
  final String productId;
  final String userId;
  final int quantity;
  AddToCartRequestModel({
    required this.productId,
    required this.userId,
    required this.quantity,
  });

//convert the model to json(map in dart)
  Map<String, dynamic> toJson() => _$AddToCartRequestModelToJson(this);
}
