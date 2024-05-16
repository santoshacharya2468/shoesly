import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:shoesly/features/cart/data/repository/i_cart_repository.dart';

@Injectable(as: ICartRepository)
class CartRepository implements ICartRepository {
  final FirebaseFirestore db;
  CartRepository({required this.db});
}
