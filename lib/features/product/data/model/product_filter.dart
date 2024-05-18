import 'package:shoesly/core/enum/product_color.dart';
import 'package:shoesly/core/enum/product_gender.dart';
import 'package:shoesly/core/enum/product_sort.dart';
import 'package:shoesly/features/brand/data/model/brand.dart';
import 'package:shoesly/features/product/data/model/price_range.dart';

class ProductFilter {
  Brand? brand;
  PriceRange? range;
  ProductSort? sortBy;
  Gender? gender;
  ProductColor? color;
  int limit;

  ProductFilter(
      {this.brand,
      this.range,
      this.sortBy,
      this.gender,
      this.color,
      required this.limit});

  int get appliedCount {
    int count = 0;
    for (var field in [brand, range, sortBy, gender, color]) {
      if (field != null) {
        count++;
      }
    }
    return count;
  }

  static int perPag = 10;
}
