import 'package:flutter_template_3/app/core/upload/data/models/upload_request_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_template_3/app/network/dio_network_provider/dio_provider.dart';

///
/// Created by Sunil Kumar
/// On 12-08-2022 02:11 PM
///
abstract class UploadDataSource extends DioProvider {
  UploadDataSource.setContentType(super.version) : super.setContentType();

  Future<Response> uploadFiles(UploadRequestModel request, {String? mockPath});
}
