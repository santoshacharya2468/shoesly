import 'package:shoesly/core/model/base_response.dart';
import 'package:shoesly/features/review/data/model/review.dart';

abstract class IReviewRepository {
  Future<ApiResponseList<Review>> getProductReviews(String pId);
}
