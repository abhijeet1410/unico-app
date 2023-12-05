import 'package:flutter/material.dart';
import 'package:unico_app/app/core/widgets/collapsable_text.dart';
import 'package:widgetbook/widgetbook.dart';

///
/// Created by Sisira Sahoo
/// On 15/08/22 11:40 AM
///

WidgetbookComponent collapsableTextBook() {
  return WidgetbookComponent(
    name: 'app collapsable text'.toUpperCase(),
    useCases: [
      WidgetbookUseCase(
        name: 'App Collapsable Text',
        builder: (context) {
          String text =
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.";
          return Center(child: CollapsableText(text));
        },
      ),
    ],
  );
}
