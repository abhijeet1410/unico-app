import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Created by Sunil Kumar
/// On 01-09-2022 02:32 PM
///

class AppNoInternetWidget extends StatelessWidget {
  final String? title, subtitle, buttonText, assetPath;
  final Color? textColor;
  final VoidCallback? onRetry;

  const AppNoInternetWidget(
      {this.title,
      this.subtitle,
      this.textColor,
      this.buttonText,
      this.assetPath,
      this.onRetry,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // SvgPicture.asset(assetPath ?? 'assets/icons/no_network.svg'),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 22),
            child: Text(title ?? 'Connection lost',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: textColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 22),
          child: Text(subtitle ?? 'No internet connection',
              textAlign: TextAlign.center,
              style: TextStyle(color: textColor, fontSize: 16)),
        ),
        if (onRetry != null)
          MaterialButton(
            textColor: Colors.white,
            color: Get.theme.primaryColor,
            onPressed: onRetry,
            child: Text(buttonText ?? 'Retry'),
          )
      ],
    );
  }
}
