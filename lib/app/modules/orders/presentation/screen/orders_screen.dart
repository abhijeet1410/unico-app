import 'package:flutter_template_3/app/core/base/base_view.dart';
import 'package:flutter_template_3/app/modules/orders/presentation/controller/orders_controller.dart';
import 'package:flutter/material.dart';


class OrdersScreen extends BaseView<OrdersController> {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget body(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Orders Page')),
    );
  }
}
