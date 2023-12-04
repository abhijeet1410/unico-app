import 'package:flutter_template_3/app/core/domain/usercases/usecase.dart';
import 'package:flutter_template_3/app/modules/slots/data/models/get_all_slots_response.dart';
import 'package:flutter_template_3/app/modules/slots/data/models/get_all_slots_request.dart';
import 'package:flutter_template_3/app/modules/slots/domain/repositories/slots_repo.dart';


class GetAllSlotsUseCase extends UseCase<GetAllSlotsResponse , GetAllSlotsRequest> {
  late final SlotsRepository repository;

  GetAllSlotsUseCase(this.repository);

  @override
  Future<GetAllSlotsResponse> call(GetAllSlotsRequest params) => repository.getAllSlots(params);
}
