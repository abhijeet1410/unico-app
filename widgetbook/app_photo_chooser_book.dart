import 'package:flutter/material.dart';
import 'package:flutter_template_3/app/core/widgets/app_buttons/app_primary_button.dart';
import 'package:flutter_template_3/app/core/widgets/photo_chooser.dart';
import 'package:get/get.dart';
import 'package:widgetbook/widgetbook.dart';

///
/// Created by Sisira Sahoo
/// On 15/08/22 11:44 AM
///

WidgetbookComponent photoChooserBook() {
  return WidgetbookComponent(
    name: 'app photo chooser'.toUpperCase(),
    useCases: [
      WidgetbookUseCase(
        name: 'App photo chooser',
        builder: (context) {
          return const Padding(
            padding: EdgeInsets.all(16),
            child: PhotoChooser(
              title: "Choose your desired photo",
            ),
          );
        },
      ),
    ],
  );
}
