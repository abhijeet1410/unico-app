import 'package:unico_app/app/core/theme/app_colors.dart';
import 'package:unico_app/app/core/utils/date_utils/date_utils.dart';
import 'package:unico_app/app/modules/notification/data/models/notification_response.dart';
import 'package:flutter/material.dart';

class NotificationTile extends StatelessWidget {
  const NotificationTile(this.data, {Key? key}) : super(key: key);
  final NotificationDatum data;

  @override
  Widget build(BuildContext context) {
    const TextStyle textStyle = TextStyle(
      fontSize: 14,
    );
    return GestureDetector(
      onTap: () {
        switch (data.entityType) {
          case 'order':
            // if(data.action=="service") {
            //   NavigationHelper.toNamed(OrderDetailsPage.getPath(data.entityId));
            // }else{
            // }
            break;
          // case 'store':
          //   NavigationHelper.toNamed(Storedeta.getPath(data.entityId));
          //   break;
          default:
        }
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Text(
                            data.title,
                            maxLines: 2,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        Text(
                          AppDateUtils.formatTimeAgo(data.createdAt),
                          style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                    const SizedBox(height: 6),
                    if (data.description.isNotEmpty)
                      Text(
                        data.description,
                        style: textStyle.copyWith(
                            overflow: TextOverflow.visible,
                            fontWeight: FontWeight.w500,
                            fontSize: 12),
                      ),
                  ],
                ),
              )
            ],
          )

          //   ],
          // ),
          ),
    );
  }
}
