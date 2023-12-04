import 'package:flutter_template_3/app/network/get_network_provider/api_configs/api_provider.dart';
import 'package:flutter_template_3/app/modules/slots/data/models/get_all_slots_request.dart';
import 'package:get/get.dart';

abstract class SlotsDataSource extends BaseProvider {
  //TODO: Add Your Function Signatures here
  Future<Response> getAllSlots(GetAllSlotsRequest requestData);
}
