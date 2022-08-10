import 'package:flutter_template_3/app/data/local/preference/preference_manager.dart';
import 'package:flutter_template_3/app/data/local/preference/preference_manager_impl.dart';
import 'package:get/get.dart';

mixin AppDependencies {
  void init() {
    /// Preference helper init
    Get.lazyPut<PreferenceManager>(
      () => PreferenceManagerImpl(),
      fenix: true,
    );
  }
}
