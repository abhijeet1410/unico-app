import 'package:flutter/material.dart';

///
/// Created by Sunil Kumar
/// On 13-08-2022 10:40 AM
///

abstract class BasePage extends StatefulWidget {
  const BasePage({Key? key}) : super(key: key);
}

abstract class BasePageState<T extends BasePage> extends State<T> {
  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) => getChildBlocWidget(context);

  Widget getChildBlocWidget(BuildContext context);
}
