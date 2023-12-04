import 'package:flutter_template_3/app/modules/orders/data/models/get_all_orders_request.dart';
import 'package:flutter_template_3/app/modules/orders/data/models/get_all_orders_response.dart';
import 'package:flutter_template_3/app/modules/orders/data/data_source/orders_data_source.dart';
import 'package:flutter_template_3/app/modules/orders/domain/repositories/orders_repo.dart';
import 'package:get/get_connect/http/src/response/response.dart';

class OrdersRepositoryImpl implements OrdersRepository {
  final OrdersDataSource _remoteSource;
  OrdersRepositoryImpl(this._remoteSource);
  //TODO: Add Your Functions here
  @override
  Future<GetAllOrdersResponse> getAllOrders(GetAllOrdersRequest requestData) async {
    final Response<dynamic> response = await _remoteSource.getAllOrders(requestData);
    final GetAllOrdersResponse res = GetAllOrdersResponse.fromJson(response.body);
    return res;
  }
}
