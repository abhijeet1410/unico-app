import 'package:unico_app/app/core/upload/data/models/upload_request_model.dart';
import 'package:unico_app/app/core/upload/data/models/upload_response_model.dart';

///
/// Created by Sunil Kumar
/// On 12-08-2022 06:51 PM
///
abstract class UploadRepository {
  Future<List<UploadResponse>> uploadFiles(UploadRequestModel request);
}
