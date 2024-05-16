import 'package:shoesly/core/model/base_response.dart';
import 'package:shoesly/features/brand/data/model/brand.dart';

abstract class IBrandRepository {
  Future<ApiResponseList<Brand>> getBrands();
}
