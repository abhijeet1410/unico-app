import 'package:flutter_template_3/app/modules/slots/data/models/get_all_slots_request.dart';
import 'package:flutter_template_3/app/modules/slots/data/models/get_all_slots_response.dart';
import 'package:flutter_template_3/app/modules/slots/data/data_source/slots_data_source.dart';
import 'package:flutter_template_3/app/modules/slots/domain/repositories/slots_repo.dart';
import 'package:get/get_connect/http/src/response/response.dart';

class SlotsRepositoryImpl implements SlotsRepository {
  final SlotsDataSource _remoteSource;
  SlotsRepositoryImpl(this._remoteSource);
  //TODO: Add Your Functions here
  @override
  Future<GetAllSlotsResponse> getAllSlots(GetAllSlotsRequest requestData) async {
    final Response<dynamic> response = await _remoteSource.getAllSlots(requestData);
    final GetAllSlotsResponse res = GetAllSlotsResponse.fromJson(response.body);
    return res;
  }
}
