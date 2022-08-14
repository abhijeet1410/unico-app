// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_template_3/app/core/utils/snackbar_helper.dart';
// import 'package:flutter_template_3/generated/l10n.dart';
// import 'package:get/get.dart';
// import 'package:logger/logger.dart';
//
// import '/app/core/base/base_controller.dart';
// import '/flavors/build_config.dart';
//
// abstract class BaseView<Controller extends BaseController>
//     extends GetView<Controller> {
//   S get appLocalization => S.of(Get.context!);
//
//   final Logger logger = BuildConfig.instance.config.logger;
//
//   BaseView({Key? key}) : super(key: key);
//
//   Widget body(BuildContext context);
//
//   PreferredSizeWidget? appBar(BuildContext context);
//   Widget? errorWidget(BuildContext context, String error);
//   Widget? emptyWidget(BuildContext context);
//   Widget? loadingWidget(BuildContext context);
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//         onTap: FocusScope.of(context).unfocus, child: annotatedRegion(context));
//   }
//
//   Widget annotatedRegion(BuildContext context) {
//     return AnnotatedRegion(
//       value: const SystemUiOverlayStyle(
//         statusBarIconBrightness: Brightness.dark,
//       ),
//       child: Material(
//         color: Colors.transparent,
//         child: pageScaffold(context),
//       ),
//     );
//   }
//
//   Widget pageScaffold(BuildContext context) {
//     return Scaffold(
//       appBar: appBar(context),
//       floatingActionButton: floatingActionButton(),
//       body: controller.obx(
//         (state) => pageContent(context),
//         onError: (e) =>
//             errorWidget(context, e ?? "Some error occurred") ??
//             const SizedBox(),
//         onEmpty: emptyWidget(context),
//         onLoading: loadingWidget(context),
//       ),
//       bottomNavigationBar: bottomNavigationBar(),
//       drawer: drawer(),
//     );
//   }
//
//   Widget pageContent(BuildContext context) {
//     return SafeArea(
//       child: body(context),
//     );
//   }
//
//   void showToast(String message) {
//     SnackBarHelper.show(message);
//   }
//
//   Widget? floatingActionButton() {
//     return null;
//   }
//
//   Widget? bottomNavigationBar() {
//     return null;
//   }
//
//   Widget? drawer() {
//     return null;
//   }
// }
