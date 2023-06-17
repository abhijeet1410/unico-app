import 'dart:async';
import 'dart:developer';

 import 'package:flutter_template_3/app/core/base/base_controller.dart';
import 'package:flutter_template_3/app/core/utils/snakbar_utils/snackbar_helper.dart';
import 'package:flutter_template_3/app/modules/login/presentation/controller/user_controller.dart';
import 'package:flutter_template_3/app/modules/notification/data/models/notification_request.dart';
import 'package:flutter_template_3/app/modules/notification/data/models/notification_response.dart';
import 'package:flutter_template_3/app/modules/notification/domain/usecases/get_notification_usercase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

///
/// Created by Sunil Kumar from Boiler plate
///
class NotificationController extends BaseController<List<NotificationDatum>> {
  int skip = 0, limit = 20;
  bool shouldLoadMore = true;
  late ScrollController scrollController;
  final GetNotificationUseCase getNotificationUseCase =
      Get.find<GetNotificationUseCase>();
  late String categoryId;

  final userController = Get.find<UserController>();

  @override
  void onInit() {
    super.onInit();
    scrollController = ScrollController()..addListener(_scrollListener);
    loadData();
  }

  void _scrollListener() {
    final current = scrollController.position.pixels;
    final max = scrollController.position.maxScrollExtent;
    if (max - current < 200) {
      loadMoreData();
    }
  }

  @override
  void dispose() {
    scrollController
      ..removeListener(_scrollListener)
      ..dispose();
    super.dispose();
  }

  @override
  Future loadData() async {
    skip = 0;
    shouldLoadMore = true;
    try {
      change(null, status: RxStatus.loading());
      final res = await getNotificationUseCase
          .call(NotificationRequest(skip: skip, limit: limit));

      if (res.length < limit) {
        shouldLoadMore = false;
      }
      change(res, status: res.isEmpty ? RxStatus.empty() : RxStatus.success());
    } catch (e, s) {
      log("loadServiceCategoriesStores", error: e, stackTrace: s);
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  @override
  Future loadMoreData() async {
    if (shouldLoadMore && !status.isLoadingMore) {
      skip = state?.length ?? 0;
      try {
        change(state, status: RxStatus.loadingMore());
        final res = await getNotificationUseCase
            .call(NotificationRequest(skip: skip, limit: limit));
        if (res.length < limit) {
          shouldLoadMore = false;
        }
        change(state! + res, status: RxStatus.success());
      } catch (e) {
        AppSnackBarUtil.show(e.toString());
        change(state, status: RxStatus.success());
      }
    }
  }

  @override
  void onDetached() {
   }

  @override
  void onInactive() {
  }

  @override
  void onPaused() {
  }

  @override
  void onResumed() {
  }
}
