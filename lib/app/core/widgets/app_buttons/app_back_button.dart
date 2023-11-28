import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template_3/app/core/asset/resources.dart';
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
    return IconButton(
        icon: const Icon(Icons.arrow_back_ios_new_rounded),
        color: color ?? const Color(0xff1F1F1F),
        onPressed: onPressed ?? NavigationHelper.back);
  }
}
