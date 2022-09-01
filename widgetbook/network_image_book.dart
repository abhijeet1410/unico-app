import 'package:flutter/material.dart';
import 'package:flutter_template_3/app/core/widgets/app_network_image.dart';
import 'package:widgetbook/widgetbook.dart';

///
/// Created by Sisira Sahoo
/// On 15/08/22 11:36 AM
///
WidgetbookComponent networkImageBook() {
  return WidgetbookComponent(
    name: 'App network image'.toUpperCase(),
    useCases: [
      WidgetbookUseCase(
        name: 'App network image',
        builder: (context) {
          return const Center(
              child: AppNetworkImage("https://i.imgur.com/HfMgPY0.jpg"));
        },
      ),
    ],
  );
}
