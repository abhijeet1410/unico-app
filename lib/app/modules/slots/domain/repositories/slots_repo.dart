import 'package:flutter_template_3/app/modules/slots/data/models/get_all_slots_request.dart';
import 'package:flutter_template_3/app/modules/slots/data/models/get_all_slots_response.dart';
abstract class SlotsRepository {
  //TODO: Add Your Function Signatures here
    Future<GetAllSlotsResponse> getAllSlots(GetAllSlotsRequest requestData);
}
