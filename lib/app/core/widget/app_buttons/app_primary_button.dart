import 'package:flutter/material.dart';
import 'package:flutter_template_3/app/core/theme/app_theme.dart';
import 'package:flutter_template_3/flavors/environment.dart';

import '../app_loader.dart';

///
/// Created by Sunil Kumar from Boiler plate
///
class AppPrimaryButton extends StatefulWidget {
  const AppPrimaryButton(
      {required this.child,
      Key? key,
      this.onPressed,
      this.height,
      this.width,
      this.color,
      this.shape,
      this.padding,
      this.textStyle})
      : super(key: key);

  final ShapeBorder? shape;
  final Widget child;
  final VoidCallback? onPressed;
  final double? height, width;
  final Color? color;
  final EdgeInsets? padding;
  final TextStyle? textStyle;

  @override
  AppPrimaryButtonState createState() => AppPrimaryButtonState();
}

class AppPrimaryButtonState extends State<AppPrimaryButton> {
  bool _isLoading = false;

  void showLoader() {
    setState(() {
      _isLoading = true;
    });
  }

  void hideLoader() {
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return _isLoading
        ? AppProgress(color: widget.color ?? theme.primaryColor)
        : ElevatedButton(
            // style: ButtonStyle(
            //   padding: MaterialStateProperty.all(
            //     widget.padding ??
            //         const EdgeInsets.symmetric(vertical: 14, horizontal: 48),
            //   ),
            //   textStyle: MaterialStateProperty.resolveWith(
            //       (Set<MaterialState> states) {
            //     if (states.contains(MaterialState.disabled))
            //       return TextStyle(color: Colors.grey.shade500);

            //     return TextStyle(color: AppColors.brightPrimary);
            //   }),
            //   foregroundColor: MaterialStateProperty.resolveWith<Color?>(
            //     (Set<MaterialState> states) {
            //       if (states.contains(MaterialState.pressed))
            //         return AppColors.brightPrimary.shade800;
            //       else if (states.contains(MaterialState.disabled))
            //         return Colors.grey.shade500;
            //         return AppColors.brightPrimary;
            //     },
            //   )
            // ),
            style: ElevatedButton.styleFrom(
              primary: theme.primaryColor,
              padding: widget.padding ??
                  const EdgeInsets.symmetric(vertical: 20, horizontal: 48),
              textStyle: widget.textStyle ??
                  TextStyle(
                      fontSize: 18,
                      fontFamily: AppThemes.fontFamily,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
            ),
            onPressed: widget.onPressed,
            child: widget.child,
          );
  }
}
