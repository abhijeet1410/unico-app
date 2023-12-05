import 'package:unico_app/app/modules/notification/data/models/notification_request.dart';
import 'package:unico_app/app/network/get_network_provider/api_configs/api_provider.dart';
import 'package:get/get.dart';

///
/// Created by Sunil Kumar
/// On 12-08-2022 02:11 PM
///
abstract class NotificationDataSource extends BaseProvider {
  Future<Response> getAllNotifications(NotificationRequest request,
      {String? mockPath});
}
