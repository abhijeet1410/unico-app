import 'package:unico_app/app/modules/notification/data/data_source/notification_data_source.dart';
import 'package:unico_app/app/modules/notification/data/models/notification_request.dart';
import 'package:unico_app/app/modules/notification/data/models/notification_response.dart';
import 'package:unico_app/app/modules/notification/domain/repositories/notification_repo.dart';

///
/// Created by Sunil Kumar
/// On 12-08-2022 02:13 PM
///
class NotificationRepositoryImpl implements NotificationRepository {
  final NotificationDataSource _remoteSource;

  NotificationRepositoryImpl(this._remoteSource);

  @override
  Future<List<NotificationDatum>> getAllNotifications(
      NotificationRequest request) async {
    final response = await _remoteSource.getAllNotifications(request);
    return NotificationNetworkResponse.fromJson(response.body).data;
  }
}
