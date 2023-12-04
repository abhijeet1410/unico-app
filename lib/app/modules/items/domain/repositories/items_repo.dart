import 'package:flutter_template_3/app/modules/items/data/models/get_all_items_request.dart';
import 'package:flutter_template_3/app/modules/items/data/models/get_all_items_response.dart';
abstract class ItemsRepository {
  //TODO: Add Your Function Signatures here
    Future<GetAllItemsResponse> getAllItems(GetAllItemsRequest requestData);
}
