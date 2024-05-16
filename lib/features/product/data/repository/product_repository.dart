import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:shoesly/core/constant/firestore_collection.dart';
import 'package:shoesly/core/enum/product_sort.dart';
import 'package:shoesly/core/extension/firestore_extension.dart';
import 'package:shoesly/core/model/base_response.dart';
import 'package:shoesly/features/product/data/model/product.dart';
import 'package:shoesly/features/product/data/model/product_filter.dart';
import 'package:shoesly/features/product/data/repository/i_product_repository.dart';

@Injectable(as: IProductRepository)
class ProductRepository implements IProductRepository {
  final FirebaseFirestore db;

  ProductRepository({required this.db});

  @override
  Future<ApiResponseList<Product>> getProducts(
      {required ProductFilter filter}) async {
    Query<Map<String, dynamic>> query =
        db.collection(FirestoreCollection.products);
    // .orderBy("createdAt", descending: true);
    if (filter.brand != null) {
      query = query.where("brand.id", isEqualTo: filter.brand!.id);
    }
    if (filter.color != null) {
      query = query.where("colors", arrayContains: filter.color!.name);
    }
    if (filter.gender != null) {
      query = query.where("gender", isEqualTo: filter.gender!.name);
    }
    if (filter.sortBy != null) {
      switch (filter.sortBy!) {
        case ProductSort.lowPrice:
          query = query.orderBy("price", descending: false);
          break;
        case ProductSort.highPrice:
          query = query.orderBy("price", descending: true);
          break;
        case ProductSort.recent:
          query = query.orderBy("createdAt", descending: true);
          break;
        default:
          break;
      }
    }

    if (filter.range != null) {
      query = query
          .where("price", isGreaterThanOrEqualTo: filter.range!.min)
          .where("price", isLessThanOrEqualTo: filter.range!.max);
    }
    final response = await query.get();
    return response.toApiResponseList(fromDoc: Product.fromFirestore);
  }
}
