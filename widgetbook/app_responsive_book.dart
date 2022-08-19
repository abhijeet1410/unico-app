import 'package:flutter/material.dart';
import 'package:flutter_template_3/app/core/widget/responsive.dart';
import 'package:widgetbook/widgetbook.dart';

///
/// Created by Sisira Sahoo
/// On 15/08/22 11:50 AM
///

WidgetbookComponent responsiveBook() {
  return WidgetbookComponent(
    name: 'app responsive'.toUpperCase(),
    useCases: [
      WidgetbookUseCase(
        name: 'App responsive',
        builder: (context) {
          return const Center(
              child: Responsive(
                  mobile: Text("Mobile screen"),
                  desktop: Text("Desktop screen")));
        },
      ),
    ],
  );
}
