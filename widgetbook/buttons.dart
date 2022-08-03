import 'package:flutter/material.dart';
import 'package:flutter_template_3/utils/snackbar_helper.dart';
import 'package:flutter_template_3/widgets/app_buttons/app_circle_button.dart';
import 'package:flutter_template_3/widgets/app_buttons/app_outline_button.dart';
import 'package:flutter_template_3/widgets/app_buttons/app_primary_button.dart';
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
      WidgetbookUseCase(
        name: 'Primary Button',
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      _primaryButtonKey.currentState?.showLoader();
                    },
                    icon: const Icon(Icons.play_circle)),
                const SizedBox(width: 22),
                AppPrimaryButton(
                  onPressed: () {
                    SnackBarHelper.show("Helu");
                  },
                  color: Colors.red,
                  key: _primaryButtonKey,
                  child: const Text("Login"),
                ),
                const SizedBox(width: 22),
                IconButton(
                    onPressed: () {
                      _primaryButtonKey.currentState?.hideLoader();
                    },
                    icon: const Icon(Icons.stop_circle)),
              ],
            ),
          );
        },
      ),
      WidgetbookUseCase(
        name: 'Circle Button',
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: AppCircleButton(
              onPressed: () {
                SnackBarHelper.show("Helu");
              },
              color: Colors.red,
              size: const Size.square(80),
              child: Image.network(
                  "https://gitlab.com/uploads/-/system/user/avatar/8964701/avatar.png?width=96"),
            ),
          );
        },
      ),
      WidgetbookUseCase(
        name: 'Outlined Button',
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      _outlinedButtonKey.currentState?.showLoader();
                    },
                    icon: const Icon(Icons.play_circle)),
                const SizedBox(width: 22),
                AppOutlineButton(
                  onPressed: () {
                    SnackBarHelper.show("Helu");
                  },
                  borderSide: const BorderSide(
                    width: 2,
                    color: Colors.orange,
                  ),
                  color: Colors.orange,
                  key: _outlinedButtonKey,
                  child: const Text("Profile"),
                ),
                const SizedBox(width: 22),
                IconButton(
                    onPressed: () {
                      _outlinedButtonKey.currentState?.hideLoader();
                    },
                    icon: const Icon(Icons.stop_circle)),
              ],
            ),
          );
        },
      ),
    ],
  );
}
