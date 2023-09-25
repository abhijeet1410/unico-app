import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template_3/app/core/asset/resources.dart';
import 'package:flutter_template_3/app/core/utils/snakbar_utils/snackbar_helper.dart';
import 'package:flutter_template_3/app/core/widgets/app_buttons/app_circle_button.dart';
import 'package:flutter_template_3/app/core/widgets/app_buttons/app_outline_button.dart';
import 'package:flutter_template_3/app/core/widgets/app_buttons/app_primary_button.dart';
import 'package:widgetbook/widgetbook.dart';

///
/// Created by Sunil Kumar
/// On 03-08-2022 02:44 PM
///
WidgetbookComponent buttonsBook() {
  GlobalKey<AppPrimaryButtonState> _primaryButtonKey = GlobalKey();
  GlobalKey<AppOutlineButtonState> _outlinedButtonKey = GlobalKey();
  return WidgetbookComponent(
    name: 'APP BUTTON',
    useCases: [
      // WidgetbookUseCase(
      //   name: 'Primary Button',
      //   builder: (context) {
      //     return Padding(
      //       padding: const EdgeInsets.all(16),
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //           IconButton(
      //               onPressed: () {
      //                 _primaryButtonKey.currentState?.showLoader();
      //               },
      //               icon: const Icon(Icons.play_circle)),
      //           const SizedBox(width: 22),
      //           AppPrimaryButton(
      //             onPressed: () {
      //               AppSnackBarUtil.show("Helu");
      //             },
      //             color: Color(int.parse(context.knobs.text(
      //                 label: "Button color",
      //                 description: "Color of the button",
      //                 initialValue: "0xff909090"))),
      //             key: _primaryButtonKey,
      //             height: context.knobs
      //                 .number(
      //                     label: "Button height",
      //                     initialValue: 20,
      //                     description: "Height of button")
      //                 .toDouble(),
      //             width: context.knobs
      //                 .number(
      //                     label: "Button width",
      //                     initialValue: 80,
      //                     description: "Width of button")
      //                 .toDouble(),
      //             shape: RoundedRectangleBorder(
      //                 borderRadius: BorderRadius.circular(context.knobs
      //                     .number(
      //                         label: "Button radius",
      //                         description: "Radius of button",
      //                         initialValue: 15)
      //                     .toDouble())),
      //             child: Text(context.knobs.text(
      //                 label: "Button name",
      //                 description: "Name of the button",
      //                 initialValue: "Login")),
      //           ),
      //           const SizedBox(width: 22),
      //           IconButton(
      //               onPressed: () {
      //                 _primaryButtonKey.currentState?.hideLoader();
      //               },
      //               icon: const Icon(Icons.stop_circle)),
      //         ],
      //       ),
      //     );
      //   },
      // ),
      // WidgetbookUseCase(
      //   name: 'Circle Button',
      //   builder: (context) {
      //     return Padding(
      //       padding: const EdgeInsets.all(16),
      //       child: AppCircleButton(
      //         onPressed: () {
      //           AppSnackBarUtil.show("Helu");
      //         },
      //         color: Color(int.parse(context.knobs.text(
      //             label: "Circle color",
      //             description: "Circle of the button",
      //             initialValue: "0xff909090"))),
      //         size: Size.square(context.knobs
      //             .number(
      //                 label: "Button Size",
      //                 description: "Size of the button",
      //                 initialValue: 80)
      //             .toDouble()),
      //         child: SvgPicture.asset(AppAssets.userPlaceholder),
      //       ),
      //     );
      //   },
      // ),
      // WidgetbookUseCase(
      //   name: 'Outlined Button',
      //   builder: (context) {
      //     return Padding(
      //       padding: const EdgeInsets.all(16),
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //           IconButton(
      //               onPressed: () {
      //                 _outlinedButtonKey.currentState?.showLoader();
      //               },
      //               icon: const Icon(Icons.play_circle)),
      //           const SizedBox(width: 22),
      //           AppOutlineButton(
      //             onPressed: () {
      //               AppSnackBarUtil.show("Helu");
      //             },
      //             // FF9800FF
      //             borderSide: BorderSide(
      //               width: 2,
      //               color: Color(
      //                 int.parse(context.knobs.text(
      //                     label: "color",
      //                     description: "Circle of the button",
      //                     initialValue: "0xffFF9800")),
      //               ),
      //             ),
      //             color: Color(
      //               int.parse(context.knobs.text(
      //                   label: "color",
      //                   description: "Circle of the button",
      //                   initialValue: "0xffFF9800")),
      //             ),
      //             key: _outlinedButtonKey,
      //             child: const Text("Profile"),
      //           ),
      //           const SizedBox(width: 22),
      //           IconButton(
      //               onPressed: () {
      //                 _outlinedButtonKey.currentState?.hideLoader();
      //               },
      //               icon: const Icon(Icons.stop_circle)),
      //         ],
      //       ),
      //     );
      //   },
      // ),
    ],
  );
}
