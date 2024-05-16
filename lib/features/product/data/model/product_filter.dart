import 'package:shoesly/features/product/data/model/product.dart';

class ProductFilter {
  final String? brand;
  final num? minPrice;
  final num? maxPrice;
  final List<String>? sizes;
  final List<String>? colors;
  final Gender? gender;

  ProductFilter(
      {this.brand,
      this.minPrice,
      this.maxPrice,
      this.sizes,
      this.colors,
      this.gender});
}
