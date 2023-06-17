import 'package:flutter_template_3/app/core/widgets/app_buttons/app_back_button.dart';
import 'package:flutter_template_3/app/core/widgets/app_widgets/app_widgets.dart';
import 'package:flutter_template_3/app/modules/notification/presentation/controller/notification_controller.dart';
import 'package:flutter_template_3/app/modules/notification/presentation/widgets/notification_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationScreen extends GetView<NotificationController> {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0.0,
        titleSpacing: 0,
        leading: const AppBackButton(),
        title: const Text("Notifications"),
        centerTitle: false,
      ),
      body: controller.obx(
        (state) => RefreshIndicator(
          onRefresh: controller.loadData,
          child: ListView.separated(
            controller: controller.scrollController,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: controller.status.isLoadingMore
                ? state!.length + 1
                : state!.length,
            itemBuilder: (context, index) {
              if (index >= state.length) {
                return const Center(child: AppProgress());
              }
              return NotificationTile(state[index]);
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 15.0,
              );
            },
          ),
        ),
        onError: (e) => AppErrorWidget(
          title: e ?? 'Some error occurred',
          onRetry: () {
            controller.loadData();
          },
        ),
        onEmpty: AppEmptyWidget(
          title: 'No New Notifications.',
          onReload: () {
            controller.loadData();
          },
        ),
        onLoading: const Center(child: AppProgress()),
      ),
    );
  }
}
