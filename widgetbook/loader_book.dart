import 'package:flutter/material.dart';
import 'package:flutter_template_3/app/core/widget/app_loader.dart';
import 'package:widgetbook/widgetbook.dart';

///
/// Created by Sisira Sahoo
/// On 15/08/22 11:33 AM
///

WidgetbookComponent loaderBook() {
  return WidgetbookComponent(
    name: 'APP loader widget'.toUpperCase(),
    useCases: [
      WidgetbookUseCase(
        name: 'App Loader Widget',
        builder: (context) {
          return const Center(child: AppProgress());
        },
      ),
    ],
  );
}
