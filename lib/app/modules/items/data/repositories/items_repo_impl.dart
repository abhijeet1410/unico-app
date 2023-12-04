import 'package:flutter_template_3/app/modules/items/data/models/get_all_items_request.dart';
import 'package:flutter_template_3/app/modules/items/data/models/get_all_items_response.dart';
import 'package:flutter_template_3/app/modules/items/data/data_source/items_data_source.dart';
import 'package:flutter_template_3/app/modules/items/domain/repositories/items_repo.dart';
import 'package:get/get_connect/http/src/response/response.dart';

class ItemsRepositoryImpl implements ItemsRepository {
  final ItemsDataSource _remoteSource;
  ItemsRepositoryImpl(this._remoteSource);
  //TODO: Add Your Functions here
  @override
  Future<GetAllItemsResponse> getAllItems(GetAllItemsRequest requestData) async {
    final Response<dynamic> response = await _remoteSource.getAllItems(requestData);
    final GetAllItemsResponse res = GetAllItemsResponse.fromJson(response.body);
    return res;
  }
}
