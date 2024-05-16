import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:shoesly/core/constant/firestore_collection.dart';
import 'package:shoesly/core/extension/firestore_extension.dart';
import 'package:shoesly/core/model/base_response.dart';
import 'package:shoesly/features/review/data/model/review.dart';
import 'package:shoesly/features/review/data/repository/i_review_repository.dart';

@Injectable(as: IReviewRepository)
class ReviewRepository implements IReviewRepository {
  final FirebaseFirestore db;
  ReviewRepository(this.db);

  @override
  Future<ApiResponseList<Review>> getProductReviews(String pId) async {
    final response = await db
        .collection(FirestoreCollection.productReviews)
        .where("productId", isEqualTo: pId)
        .get();
    return response.toApiResponseList(fromDoc: Review.fromFirestore);
  }
}
