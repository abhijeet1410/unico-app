import 'package:flutter_template_3/app/core/upload/data/models/upload_request_model.dart';
import 'package:flutter_template_3/app/core/upload/data/models/upload_response_model.dart';

///
/// Created by Sunil Kumar
/// On 12-08-2022 06:51 PM
///
abstract class UploadRepository {
  Future<List<UploadResponse>> uploadFiles(UploadRequestModel request);
}
