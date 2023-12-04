import 'package:flutter_template_3/app/core/domain/usercases/usecase.dart';
import 'package:flutter_template_3/app/modules/orders/data/models/get_all_orders_response.dart';
import 'package:flutter_template_3/app/modules/orders/data/models/get_all_orders_request.dart';
import 'package:flutter_template_3/app/modules/orders/domain/repositories/orders_repo.dart';


class GetAllOrdersUseCase extends UseCase<GetAllOrdersResponse , GetAllOrdersRequest> {
  late final OrdersRepository repository;

  GetAllOrdersUseCase(this.repository);

  @override
  Future<GetAllOrdersResponse> call(GetAllOrdersRequest params) => repository.getAllOrders(params);
}
