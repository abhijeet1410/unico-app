import 'package:flutter/material.dart';
import 'package:flutter_template_3/app/core/utils/navigation_utils/navigation_helper.dart';

///
/// Created by Sunil Kumar from Boiler plate
///
class AppBackButton extends StatelessWidget {
  final Color? color;
  final VoidCallback? onPressed;

  const AppBackButton({this.color, this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackButton(
        color: color, onPressed: onPressed ?? NavigationHelper.back);
  }
}
