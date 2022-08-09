import 'package:flutter/material.dart';
import 'package:flutter_template_3/app/core/values/app_theme.dart';
import '../app_loader.dart';

///
/// Created by Sunil Kumar from Boiler plate
///
class AppOutlineButton extends StatefulWidget {
  const AppOutlineButton({
    required this.child,
    Key? key,
    this.onPressed,
    this.height,
    this.width,
    this.color,
    this.shape,
    this.padding,
    this.textStyle,
    this.borderSide,
  }) : super(key: key);

  final OutlinedBorder? shape;
  final BorderSide? borderSide;
  final Widget child;
  final VoidCallback? onPressed;
  final double? height, width;
  final Color? color;
  final EdgeInsets? padding;
  final TextStyle? textStyle;
  @override
  AppOutlineButtonState createState() => AppOutlineButtonState();
}

class AppOutlineButtonState extends State<AppOutlineButton> {
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
        : OutlinedButton(
            onPressed: widget.onPressed,
            style: OutlinedButton.styleFrom(
              primary: widget.color ?? theme.primaryColor,
              shape: widget.shape,
              side: widget.borderSide,
              padding: widget.padding ??
                  const EdgeInsets.symmetric(vertical: 14, horizontal: 48),
              textStyle: widget.textStyle ??
                  const TextStyle(
                      fontSize: 18,
                      fontFamily: AppThemes.fontFamily,
                      fontWeight: FontWeight.w500),
            ),
            child: widget.child);
  }
}
