import 'package:flutter_template_3/app/core/domain/usercases/usecase.dart';
import 'package:flutter_template_3/app/core/upload/data/models/upload_request_model.dart';
import 'package:flutter_template_3/app/core/upload/data/models/upload_response_model.dart';
import 'package:flutter_template_3/app/core/upload/domain/repositories/upload_repo.dart';

///
/// Created by Sunil Kumar
/// On 13-08-2022 10:03 AM
///
class UploadUseCase extends UseCase<List<UploadResponse>, UploadRequestModel> {
  late final UploadRepository repository;

  UploadUseCase(this.repository);

  @override
  Future<List<UploadResponse>> call(UploadRequestModel params) =>
      repository.uploadFiles(params);
}
