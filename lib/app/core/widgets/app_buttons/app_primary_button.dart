import 'package:flutter/material.dart';
import 'package:unico_app/app/core/theme/app_theme.dart';

import 'package:unico_app/app/core/widgets/app_widgets/app_loader.dart';
import 'package:get/get.dart';

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
      this.textStyle,
      this.textColor})
      : super(key: key);

  final ShapeBorder? shape;
  final Widget child;
  final VoidCallback? onPressed;
  final double? height, width;
  final Color? color;
  final Color? textColor;
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
    final ThemeData theme = Theme.of(context);

    return _isLoading
        ? Center(child: AppProgress(color: widget.color ?? theme.primaryColor))
        : ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: widget.color ?? theme.primaryColor,
              foregroundColor: widget.textColor,
              fixedSize: Size(widget.width ?? Get.width, widget.height ?? 52),
              padding: widget.padding ?? EdgeInsets.zero,
              textStyle: widget.textStyle ??
                  const TextStyle(
                      fontSize: 16,
                      fontFamily: AppThemes.fontFamily,
                      fontWeight: FontWeight.w500),
            ),
            onPressed: widget.onPressed,
            child: widget.child,
          );
  }
}
