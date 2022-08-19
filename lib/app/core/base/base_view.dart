import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_template_3/app/core/utils/snackbar_helper.dart';
import 'package:flutter_template_3/generated/l10n.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '/app/core/base/base_controller.dart';
import '/flavors/build_config.dart';

abstract class BaseView<Controller extends BaseController>
    extends GetView<Controller> {
  S get appLocalization => S.of(Get.context!);

  final Logger logger = BuildConfig.instance.config.logger;

  BaseView({Key? key}) : super(key: key);

  Widget body(BuildContext context);

  PreferredSizeWidget? appBar(BuildContext context);

  ThemeData get theme => Get.theme;
  Size get size => Get.size;
  double get height => Get.height;
  double get width => Get.width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: FocusScope.of(context).unfocus, child: annotatedRegion(context));
  }

  Widget annotatedRegion(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Material(
        color: Colors.transparent,
        child: pageScaffold(context),
      ),
    );
  }

  Widget pageScaffold(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      floatingActionButton: floatingActionButton(context),
      body: SafeArea(child: body(context)),
      bottomNavigationBar: bottomNavigationBar(context),
      drawer: drawer(context),
      resizeToAvoidBottomInset: false,
    );
  }

  void showToast(String message) {
    SnackBarHelper.show(message);
  }

  Widget? floatingActionButton(BuildContext context) {
    return null;
  }

  Widget? bottomNavigationBar(BuildContext context) {
    return null;
  }

  Widget? drawer(BuildContext context) {
    return null;
  }
}
