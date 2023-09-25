import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_template_3/app/core/base/base_page.dart';
import 'package:flutter_template_3/app/core/pages/splash/models/splash_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_template_3/app/core/widgets/app_widgets/app_error_widget.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

///
/// Created by Sunil Kumar from Boiler plate
///

class AppSplashPage extends BasePage {
  final Widget? logo;
  final String? logoAnimationPath;
  final Color? backgroundColor;
  final Widget? backgroundAsset;
  final Gradient? backgroundGradient;
  final Widget? loaderWidget;
  final Widget? retryActionWidget;
  final String? retryActionLabel;
  final VoidCallback? onRetryAction;
  final AppSplashController controller;

  const AppSplashPage(
      {required this.controller,
      this.logo,
      this.logoAnimationPath,
      this.backgroundColor,
      this.backgroundAsset,
      this.backgroundGradient,
      this.loaderWidget,
      this.retryActionWidget,
      this.retryActionLabel,
      this.onRetryAction,
      super.key});

  @override
  State<AppSplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends BasePageState<AppSplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ValueListenableBuilder<AppSplashStates>(
        valueListenable: widget.controller,
        builder: (BuildContext context, AppSplashStates value, Widget? child) =>
            Stack(
          children: <Widget>[
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: widget.backgroundGradient,
                  color: widget.backgroundColor,
                ),
              ),
            ),
            if (widget.backgroundAsset != null)
              Positioned.fill(child: widget.backgroundAsset!),
            Positioned.fill(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (widget.logo != null)
                    widget.logo!
                  else if (widget.controller.logoAnimationPath != null)
                    Expanded(
                      child: widget.controller.riveArtboard == null
                          ? const SizedBox()
                          : Center(
                              child: SizedBox(
                                width: Get.width / 1.3,
                                height: Get.width / 1.3,
                                child: Rive(
                                  artboard: widget.controller.riveArtboard!,
                                  alignment: Alignment.center,
                                ),
                              ),
                            ),
                    ),
                  if (widget.loaderWidget != null)
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 22),
                      child: widget.loaderWidget!,
                    ),
                  if (value == AppSplashStates.error) ...[
                    if (widget.retryActionWidget != null)
                      widget.retryActionWidget!
                    else
                      ListTile(
                        title: Text(
                            widget.controller.errorMessage ?? "Some error"),
                        trailing: TextButton(
                          onPressed: widget.onRetryAction,
                          child: Text(widget.retryActionLabel ?? "Retry"),
                        ),
                      ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
