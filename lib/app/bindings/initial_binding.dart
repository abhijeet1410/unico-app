import 'package:get/get.dart';
import 'package:flutter_template_3/app/bindings/local_source_bindings.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    LocalSourceBindings().dependencies();
  }
}
