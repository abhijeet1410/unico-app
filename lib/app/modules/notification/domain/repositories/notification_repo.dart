import 'package:unico_app/app/modules/notification/data/models/notification_request.dart';
import 'package:unico_app/app/modules/notification/data/models/notification_response.dart';

///
/// Created by Sunil Kumar
/// On 12-08-2022 06:51 PM
///
abstract class NotificationRepository {
  Future<List<NotificationDatum>> getAllNotifications(
      NotificationRequest param);
}
