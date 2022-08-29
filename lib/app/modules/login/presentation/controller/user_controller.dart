import 'package:flutter_template_3/app/modules/login/data/models/user.dart';
import 'package:get/get.dart';

///
/// Created by Sunil Kumar from Boiler plate
///

class UserController extends SuperController<User> {
  void updateUser(User? user) {
    change(null, status: RxStatus.loading());
    change(user, status: RxStatus.success());
  }
  //
  // Future refreshUser() async {
  //    try {
  //     change(null, status: RxStatus.loading());
  //     // print(SharedPreferenceHelper.user!.user!.id);
  //     final result = await ApiCall.get(ApiRoutes.user,
  //         id: SharedPreferenceHelper.user!.user!.id,
  //         query: {"\$populate": "community"});
  //     final updatedData = User.fromJson(result.data);
  //     // updateUser(updatedData);
  //     change(updatedData, status: RxStatus.success());
  //   } catch (e, s) {
  //     SnackBarHelper.show(e.toString());
  //     log("refreshUser", error: e, stackTrace: s);
  //   }
  // }
  //
  // updateUserApi(User? user) async {
  //   if (user == null) return;
  //   try {
  //     final u = SharedPreferenceHelper.user;
  //     if (u != null) {
  //       u.user = user;
  //       SharedPreferenceHelper.storeUser(user: u);
  //     }
  //     change(null, status: RxStatus.loading());
  //     await AuthHelper.updateUser(user.toJson());
  //     change(user, status: RxStatus.success());
  //   } catch (e) {
  //     SnackBarHelper.show(e.toString());
  //   }
  // }

  @override
  void onDetached() {}

  @override
  void onInactive() {}

  @override
  void onPaused() {}

  @override
  void onResumed() {}
}
