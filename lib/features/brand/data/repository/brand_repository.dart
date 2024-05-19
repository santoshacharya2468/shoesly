import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:shoesly/core/constant/firestore_collection.dart';
import 'package:shoesly/core/extension/firestore_extension.dart';
import 'package:shoesly/core/model/base_response.dart';
import 'package:shoesly/features/brand/data/model/brand.dart';
import 'package:shoesly/features/brand/data/repository/i_brand_repository.dart';

@Injectable(as: IBrandRepository)
class BrandRepository implements IBrandRepository {
  final FirebaseFirestore db;
  BrandRepository({required this.db});

  ///get all brands from firestore database
  @override
  Future<ApiResponseList<Brand>> getBrands() async {
    final response = await db.collection(FirestoreCollection.bands).get();
    return response.toApiResponseList(fromDoc: Brand.fromFirestore);
  }
}
