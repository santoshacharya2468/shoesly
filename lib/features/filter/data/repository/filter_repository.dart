import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:shoesly/features/filter/data/repository/i_filter_repository.dart';

@Injectable(as: IFilterRepository)
class FilterRepository implements IFilterRepository {
  final FirebaseFirestore db;
  FilterRepository({required this.db});
}
