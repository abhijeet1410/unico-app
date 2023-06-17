import 'package:flutter_template_3/app/core/domain/usercases/usecase.dart';
import 'package:flutter_template_3/app/modules/notification/data/models/notification_request.dart';
import 'package:flutter_template_3/app/modules/notification/data/models/notification_response.dart';
import 'package:flutter_template_3/app/modules/notification/domain/repositories/notification_repo.dart';

///
/// Created by Sunil Kumar
/// On 13-08-2022 10:03 AM
///
class GetNotificationUseCase
    extends UseCase<List<NotificationDatum>, NotificationRequest> {
  late final NotificationRepository repository;

  GetNotificationUseCase(this.repository);

  @override
  Future<List<NotificationDatum>> call(NotificationRequest params) =>
      repository.getAllNotifications(params);
}
