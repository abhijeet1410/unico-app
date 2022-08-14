// import 'dart:async';
//
// import 'package:flutter_template_3/app/core/utils/snackbar_helper.dart';
// import 'package:flutter_template_3/app/network/exceptions/api_exception.dart';
// import 'package:flutter_template_3/app/network/exceptions/app_exception.dart';
// import 'package:flutter_template_3/app/network/exceptions/json_format_exception.dart';
// import 'package:flutter_template_3/app/network/exceptions/network_exception.dart';
// import 'package:flutter_template_3/app/network/exceptions/not_found_exception.dart';
// import 'package:flutter_template_3/app/network/exceptions/service_unavailable_exception.dart';
// import 'package:flutter_template_3/app/network/exceptions/unauthorize_exception.dart';
// import 'package:flutter_template_3/generated/l10n.dart';
// import 'package:get/get.dart';
// import 'package:logger/logger.dart';
//
// import 'package:flutter_template_3/flavors/build_config.dart';
//
// abstract class BaseController<T> extends SuperController<T> {
//   int _skip = 0;
//   int _limit = 20;
//   bool _shouldLoadMore = true;
//
//   final Logger logger = BuildConfig.instance.config.logger;
//
//   S get appLocalization => S.of(Get.context!);
//
//   RxnString errorMessage = RxnString();
//
//   void showError(String message) {
//     change(null, status: RxStatus.error(message));
//   }
//
//   void showLoading() {
//     change(null, status: RxStatus.loading());
//   }
//
//   void showErrorMessage(String message) {
//     SnackBarHelper.show(message);
//   }
//
//   dynamic callDataService(
//     Future<T?> future, {
//     Function(Exception exception)? onError,
//     Function(T response)? onSuccess,
//     Function? onStart,
//     Function? onComplete,
//   }) async {
//     Exception? _exception;
//
//     onStart == null ? change(null, status: RxStatus.loading()) : onStart();
//
//     try {
//       final T? response = await future;
//
//       if (onSuccess != null && response != null) onSuccess(response);
//
//       onComplete == null
//           ? change(response, status: RxStatus.success())
//           : onComplete();
//
//       return response;
//     } on ServiceUnavailableException catch (exception) {
//       _exception = exception;
//       showErrorMessage(exception.message);
//     } on UnauthorizedException catch (exception) {
//       _exception = exception;
//       showErrorMessage(exception.message);
//     } on TimeoutException catch (exception) {
//       _exception = exception;
//       showErrorMessage(exception.message ?? 'Timeout exception');
//     } on NetworkException catch (exception) {
//       _exception = exception;
//       showErrorMessage(exception.message);
//     } on JsonFormatException catch (exception) {
//       _exception = exception;
//       showErrorMessage(exception.message);
//     } on NotFoundException catch (exception) {
//       _exception = exception;
//       showErrorMessage(exception.message);
//     } on ApiException catch (exception) {
//       _exception = exception;
//     } on AppException catch (exception) {
//       _exception = exception;
//       showErrorMessage(exception.message);
//     } catch (error) {
//       _exception = AppException(message: "$error");
//       logger.e("Controller>>>>>> error $error");
//     }
//
//     onError?.call(_exception);
//     onComplete?.call();
//   }
//
//   @override
//   void onClose() {
//     super.onClose();
//   }
// }
