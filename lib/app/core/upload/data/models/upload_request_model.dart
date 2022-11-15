import 'dart:io';

import 'package:dio/dio.dart';

///
/// Created by Sunil Kumar
/// On 05-09-2022 11:31 AM
///
class UploadRequestModel {
  UploadRequestModel({
    required this.purpose,
    required this.fileType,
    this.uploadProgress,
    required this.files,
  });

  List<File> files;
  ProgressCallback? uploadProgress;
  String fileType;
  String purpose;

  // FormData toFormData() => FormData({
  //       for (int i = 0; i < files.length; i++)
  //         "file${i + 1}":
  //             MultipartFile(files[i], filename: files[i].path.split("/").last),
  //       "purpose": purpose,
  //       "fileType": fileType,
  //     });
}
