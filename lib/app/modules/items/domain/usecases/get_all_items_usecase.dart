import 'package:flutter_template_3/app/core/domain/usercases/usecase.dart';
import 'package:flutter_template_3/app/modules/items/data/models/get_all_items_response.dart';
import 'package:flutter_template_3/app/modules/items/data/models/get_all_items_request.dart';
import 'package:flutter_template_3/app/modules/items/domain/repositories/items_repo.dart';


class GetAllItemsUseCase extends UseCase<GetAllItemsResponse , GetAllItemsRequest> {
  late final ItemsRepository repository;

  GetAllItemsUseCase(this.repository);

  @override
  Future<GetAllItemsResponse> call(GetAllItemsRequest params) => repository.getAllItems(params);
}
