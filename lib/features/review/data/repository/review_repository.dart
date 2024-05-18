import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:shoesly/core/constant/firestore_collection.dart';
import 'package:shoesly/core/enum/review_score_filter.dart';
import 'package:shoesly/core/extension/firestore_extension.dart';
import 'package:shoesly/core/model/base_response.dart';
import 'package:shoesly/features/review/data/model/review.dart';
import 'package:shoesly/features/review/data/model/review_filter.dart';
import 'package:shoesly/features/review/data/repository/i_review_repository.dart';

@Injectable(as: IReviewRepository)
class ReviewRepository implements IReviewRepository {
  final FirebaseFirestore db;
  ReviewRepository(this.db);

  @override
  Future<ApiResponseList<Review>> getProductReviews(
      String pId, ReviewFilter filter) async {
    var query = db
        .collection(FirestoreCollection.productReviews)
        .where("productId", isEqualTo: pId)
        .orderBy("score", descending: true)
        .limit(filter.count);
    if (filter.scoreFilter != null) {
      query = query.where("score", isEqualTo: filter.scoreFilter!.value);
    }
    final response = await query.get();
    return response.toApiResponseList(fromDoc: Review.fromFirestore);
  }
}
