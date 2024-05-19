import 'package:shoesly/core/model/base_response.dart';
import 'package:shoesly/features/brand/data/model/brand.dart';

abstract class IBrandRepository {
  ///Get all brands
  Future<ApiResponseList<Brand>> getBrands();
}
