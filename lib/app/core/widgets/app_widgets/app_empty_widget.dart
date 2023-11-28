import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template_3/app/core/widgets/app_buttons/app_primary_button.dart';
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
        if (assetPath != null)
          SvgPicture.asset(assetPath ?? 'assets/icons/no_videos.svg'),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Text(title ?? 'Empty',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                )),
          ),
        ),
        if (subtitle != null)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 22),
            child: Text(subtitle ?? 'Empty',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xff919191),
                )),
          ),
        if (onReload != null)
          Padding(
            padding: const EdgeInsets.all(15),
            child: AppPrimaryButton(
              color: Get.theme.primaryColor,
              onPressed: onReload,
              child: Text(buttonText ?? 'Reload'),
            ),
          )
      ],
    );
  }
}
