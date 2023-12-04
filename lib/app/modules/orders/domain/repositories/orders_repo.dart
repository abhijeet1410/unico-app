import 'package:flutter_template_3/app/modules/orders/data/models/get_all_orders_request.dart';
import 'package:flutter_template_3/app/modules/orders/data/models/get_all_orders_response.dart';
abstract class OrdersRepository {
  //TODO: Add Your Function Signatures here
    Future<GetAllOrdersResponse> getAllOrders(GetAllOrdersRequest requestData);
}
