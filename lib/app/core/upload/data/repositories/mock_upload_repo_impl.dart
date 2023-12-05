import 'package:dio/src/response.dart';
import 'package:unico_app/app/core/upload/data/data_source/upload_data_source.dart';
import 'package:unico_app/app/core/upload/data/models/upload_request_model.dart';
import 'package:unico_app/app/core/upload/data/models/upload_response_model.dart';
import 'package:unico_app/app/core/upload/domain/repositories/upload_repo.dart';

///
/// Created by Sunil Kumar
/// On 12-08-2022 02:13 PM
///
class MockUploadRepositoryImpl implements UploadRepository {
  final UploadDataSource _remoteSource;

  MockUploadRepositoryImpl(this._remoteSource);

  @override
  Future<List<UploadResponse>> uploadFiles(UploadRequestModel request) async {
    final Response<dynamic> res =
        await _remoteSource.uploadFiles(request, mockPath: "upload");
    return List<UploadResponse>.from(
        res.data.map((dynamic x) => UploadResponse.fromJson(x)));
  }
}
