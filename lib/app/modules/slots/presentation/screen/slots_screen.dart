import 'package:flutter_template_3/app/core/base/base_view.dart';
import 'package:flutter_template_3/app/modules/slots/presentation/controller/slots_controller.dart';
import 'package:flutter/material.dart';


class SlotsScreen extends BaseView<SlotsController> {
  const SlotsScreen({Key? key}) : super(key: key);

  @override
  Widget body(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Slots Page')),
    );
  }
}
