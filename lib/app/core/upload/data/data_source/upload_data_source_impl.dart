import 'package:flutter_template_3/app/core/upload/data/data_source/upload_data_source.dart';
import 'package:flutter_template_3/app/core/upload/data/models/upload_request_model.dart';
import 'package:flutter_template_3/app/network/dio_network_provider/dio_provider.dart';
import 'package:flutter_template_3/app/route/api_routes.dart';
import 'package:dio/dio.dart';
import 'dart:io';

///
/// Created by Sunil Kumar
/// On 12-08-2022 02:12 PM
///
class UploadDataSourceImpl extends UploadDataSource {
  UploadDataSourceImpl.setContentType(super.version) : super.setContentType();

  @override
  Future<Response<dynamic>> uploadFiles(UploadRequestModel request,
      {String? mockPath}) async {
    return DioProvider.dioWithHeaderToken.post(AppApiRoutes.upload,
        data: FormData.fromMap(<String, dynamic>{
          for (int i = 0; i < request.files.length; i++)
            "files": await MultipartFile.fromFile(request.files[i].path,
                filename: request.files[i].path.split("/").last),
          "purpose": request.purpose,
          "fileType": request.fileType,
        }),
        options: Options(
          contentType: "multipart/form-data",
        ),
        onSendProgress: (int a, int b) => request.uploadProgress?.call(a, b));
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
