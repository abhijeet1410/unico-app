import 'package:flutter/material.dart';
import 'package:get/get.dart';
///
/// Created by Sunil Kumar
/// On 01-09-2022 02:32 PM
///

class AppEmptyWidget extends StatelessWidget {
  final String? title, subtitle, buttonText, assetPath;
  final VoidCallback? onReload;
  final Color? textColor;

  const AppEmptyWidget(
      {this.title,
        this.subtitle,
        this.buttonText,
        this.assetPath,
        this.onReload,
        this.textColor,
        Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // SvgPicture.asset(assetPath ?? 'assets/icons/no_videos.svg'),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Text(title ?? 'Empty',
                style: TextStyle(color: textColor, fontSize: 16)),
          ),
        ),
        if (onReload != null)
          MaterialButton(
            textColor: Colors.white,
            color: Get.theme.primaryColor,
            onPressed: onReload,
            child: Text(buttonText ?? 'Reload'),
          )
      ],
    );
  }
}
