import 'package:shoesly/core/model/base_response.dart';
import 'package:shoesly/features/order/data/model/order.dart';

abstract class IOrderRepository {
  Future<ApiReponse<Order>> addOrder({required Order order});
}
