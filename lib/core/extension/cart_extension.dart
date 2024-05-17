import 'package:shoesly/features/cart/data/model/cart_item.dart';

extension CartExtension on List<CartItem> {
  double get total => fold<double>(
      0.0,
      (previousValue, element) =>
          previousValue + element.product.price * element.quantity);
}
