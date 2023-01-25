import 'package:flutter/material.dart';
import 'package:flutter_template_3/app/core/theme/app_theme.dart';

import 'package:flutter_template_3/app/core/widgets/app_widgets/app_loader.dart';

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
              primary: widget.color ?? theme.primaryColor,
              onPrimary: widget.textColor,
              padding: widget.padding ??
                  const EdgeInsets.symmetric(vertical: 20, horizontal: 48),
              textStyle: widget.textStyle ??
                  const TextStyle(
                      fontSize: 18,
                      fontFamily: AppThemes.fontFamily,
                      fontWeight: FontWeight.w500),
            ),
            onPressed: widget.onPressed,
            child: widget.child,
          );
  }
}
