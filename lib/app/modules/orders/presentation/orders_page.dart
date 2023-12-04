import 'package:flutter_template_3/app/modules/orders/presentation/screen/orders_screen.dart';
import 'package:flutter/material.dart';


class OrdersPage extends StatelessWidget {
  static const String routeName = '/orders';
  const OrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const OrdersScreen();
  }
}
