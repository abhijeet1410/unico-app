import 'package:flutter_template_3/app/modules/notification/data/data_source/notification_data_source.dart';
import 'package:flutter_template_3/app/modules/notification/data/models/notification_request.dart';
import 'package:flutter_template_3/app/route/api_routes.dart';
import 'package:get/get.dart';

///
/// Created by Sunil Kumar
/// On 12-08-2022 02:12 PM
///
class NotificationDataSourceImpl extends NotificationDataSource {
  @override
  Future<Response> getAllNotifications(NotificationRequest request,
      {String? mockPath}) {
    return get(AppApiRoutes.notification,
        mockPath: mockPath, query: request.toQuery());
  }
}
