import 'package:flutter_template_3/app/network/get_network_provider/api_configs/api_provider.dart';
import 'package:flutter_template_3/app/modules/items/data/models/get_all_items_request.dart';
import 'package:get/get.dart';

abstract class ItemsDataSource extends BaseProvider {
  //TODO: Add Your Function Signatures here
  Future<Response> getAllItems(GetAllItemsRequest requestData);
}
