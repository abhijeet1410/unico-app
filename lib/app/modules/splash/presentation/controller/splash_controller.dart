import 'package:flutter_template_3/app/core/base/base_controller.dart';
import 'package:flutter_template_3/app/core/device/device_info_data_source.dart';
import 'package:flutter_template_3/app/data/local/preference/preference_manager.dart';
import 'package:flutter_template_3/app/modules/dashboard/dashboard_page.dart';
import 'package:flutter_template_3/app/modules/login/presentation/controller/user_controller.dart';
import 'package:flutter_template_3/app/modules/login/presentation/login_page.dart';
import 'package:flutter_template_3/app/modules/splash/data/models/splash_refresh_token_request_model.dart';
import 'package:flutter_template_3/app/modules/splash/domain/usecases/splash_refresh_token_usecase.dart';
import 'package:get/get.dart';

///
/// Created by Sisira Sahoo
/// On 04/08/22 12:29 PM
///

class SplashController extends BaseController {
  final deviceInfoSource = Get.find<DeviceInfoDataSource>();
  final refreshTokenUseCase = Get.find<SplashRefreshTokenUseCase>();

  void checkUserLoggedIn() async {
    final token = preference.accessToken;
    if (token == null) {
      Get.offAndToNamed(LoginPage.routeName);
    } else {
      final deviceInfo = await deviceInfoSource.getDeviceInfo();
      late RefreshTokenRequestModel loginData = RefreshTokenRequestModel();
      loginData.deviceType = deviceInfo?.deviceType;
      loginData.deviceId = deviceInfo?.deviceId;
      refreshTokenUseCase.call(loginData).then((user) {
        userController.updateUser(user.user);
        preference.storeAccessToken(user.accessToken!);
      }).whenComplete(() {
        Get.offAndToNamed(DashboardPage.routeName);
      }).catchError((e, s) {
        logger.e("Refresh token Error", e, s);
      });
    }
  }

  @override
  Future loadData() async {}

  @override
  Future loadMoreData() async {}

  @override
  void onDetached() {}

  @override
  void onInactive() {}

  @override
  void onPaused() {}

  @override
  void onResumed() {}
}
