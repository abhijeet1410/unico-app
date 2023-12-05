import 'package:flutter/material.dart';
import 'package:unico_app/app/core/widgets/app_widgets/app_widgets.dart';
import 'package:widgetbook/widgetbook.dart';

///
/// Created by Sisira Sahoo
/// On 15/08/22 11:29 AM
///

WidgetbookComponent errorWidgetBook() {
  return WidgetbookComponent(
    name: 'APP error widget'.toUpperCase(),
    useCases: [
      WidgetbookUseCase(
        name: 'App Error Widget',
        builder: (context) {
          return const Center(child: AppErrorWidget());
        },
      ),
    ],
  );
}
