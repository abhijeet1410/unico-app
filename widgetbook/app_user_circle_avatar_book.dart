import 'package:flutter/material.dart';
import 'package:flutter_template_3/app/core/widgets/user_circle_avatar.dart';
import 'package:widgetbook/widgetbook.dart';

///
/// Created by Sisira Sahoo
/// On 15/08/22 11:54 AM
///

WidgetbookComponent userCircleAvatarBook() {
  return WidgetbookComponent(
    name: 'app user circle avatar'.toUpperCase(),
    useCases: [
      WidgetbookUseCase(
        name: 'App user circle avatar',
        builder: (context) {
          return Center(
              child: UserCircleAvatar(
            context.knobs.text(
                label: "Image url",
                description: "Image to load in user circle avatar",
                initialValue:
                    "https://lh3.googleusercontent.com/a-/AFdZucqUa5o7aX0KwgyPsPxkxDM8ldtyQQKLQrXouFI3=s288-p-rw-no"),
            name: context.knobs.text(
                label: "Placeholder name",
                description: "Place holder name only first char",
                initialValue: "Sisira"),
            radius: context.knobs
                .number(
                    label: "Radius",
                    description: "Radius of circle avatar",
                    initialValue: 20)
                .toDouble(),
          ));
        },
      ),
    ],
  );
}
