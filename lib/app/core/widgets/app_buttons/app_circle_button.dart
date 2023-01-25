import 'package:flutter/material.dart';

///
/// Created by Sunil Kumar from Boiler plate
///
class AppCircleButton extends StatelessWidget {
  final Color? color;
  final EdgeInsets? padding;
  final VoidCallback? onPressed;
  final Widget? child;
  final Size? size;
  final double elevation;
  const AppCircleButton(
      {this.child,
      this.size,
      this.color,
      this.onPressed,
      this.padding,
      this.elevation = 2.0,
      Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints.tight(size ?? const Size(54, 54)),
      onPressed: onPressed,
      clipBehavior: Clip.antiAlias,
      padding: padding ?? EdgeInsets.zero,
      shape: const CircleBorder(),
      fillColor: color ?? Colors.white,
      elevation: elevation,
      child: child,
    );
  }
}
