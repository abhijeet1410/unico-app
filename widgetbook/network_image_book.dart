import 'package:flutter/material.dart';
import 'package:unico_app/app/core/widgets/app_network_image.dart';
import 'package:widgetbook/widgetbook.dart';

///
/// Created by Sisira Sahoo
/// On 15/08/22 11:36 AM
///

WidgetbookComponent networkImageBook() {
  return WidgetbookComponent(
    name: 'App network image'.toUpperCase(),
    useCases: [
      // WidgetbookUseCase(
      //   name: 'App network image',
      //   builder: (context) {
      //     return Center(
      //         child: AppNetworkImage(
      //       context.knobs.text(
      //           label: "Image url",
      //           description: "Remote image url",
      //           initialValue: "https://i.imgur.com/HfMgPY0.jpg"),
      //       height: context.knobs
      //           .number(
      //               label: "Height",
      //               initialValue: 20,
      //               description: "Height of image")
      //           .toDouble(),
      //       width: context.knobs
      //           .number(
      //               label: "Width",
      //               initialValue: 80,
      //               description: "Width of image")
      //           .toDouble(),
      //       fit: context.knobs.options(label: "BoxFit", options: [
      //         const Option(label: "Cover", value: BoxFit.cover),
      //         const Option(label: "fitWidth", value: BoxFit.fitWidth),
      //         const Option(label: "fitHeight", value: BoxFit.fitHeight),
      //         const Option(label: "fill", value: BoxFit.fill),
      //       ]),
      //     ));
      //   },
      // ),
    ],
  );
}
