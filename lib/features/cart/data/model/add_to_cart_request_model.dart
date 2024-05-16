import 'package:shoesly/core/decorator/json_decorator.dart';
import 'package:shoesly/core/enum/product_color.dart';
import 'package:shoesly/features/product/data/model/product.dart';
part "add_to_cart_request_model.g.dart";

@requestModel
class AddToCartRequestModel {
  final Product product;
  final num? size;
  final ProductColor? productColor;
  String? userId;
  final int quantity;
  AddToCartRequestModel(
      {required this.product,
      this.userId,
      required this.quantity,
      required this.productColor,
      required this.size});

//convert the model to json(map in dart)
  Map<String, dynamic> toJson() => _$AddToCartRequestModelToJson(this);
}
