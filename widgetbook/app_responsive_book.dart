import 'package:flutter/material.dart';
import 'package:unico_app/app/core/widgets/responsive.dart';
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
          return Center(
            child: Responsive(
              mobile: Container(
                  color: Colors.red,
                  alignment: Alignment.center,
                  child: const Text("Mobile screen")),
              desktop: Container(
                  color: Colors.blue,
                  alignment: Alignment.center,
                  child: const Text("Desktop screen")),
              tablet: Container(
                  color: Colors.yellow,
                  alignment: Alignment.center,
                  child: const Text("Tablet screen")),
            ),
          );
        },
      ),
    ],
  );
}
