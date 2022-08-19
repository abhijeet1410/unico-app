import 'package:flutter/material.dart';
import 'package:flutter_template_3/app/core/widget/alert_dialog.dart';
import 'package:flutter_template_3/app/core/widget/app_buttons/app_primary_button.dart';
import 'package:widgetbook/widgetbook.dart';

///
/// Created by Sisira Sahoo
/// On 15/08/22 10:58 AM
///

WidgetbookComponent alertDialogBook() {
  GlobalKey<AppPrimaryButtonState> _buttonKey = GlobalKey();
  return WidgetbookComponent(
    name: 'APP ALERT DIALOG',
    useCases: [
      WidgetbookUseCase(
        name: 'Alert dialog',
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      _buttonKey.currentState?.showLoader();
                    },
                    icon: const Icon(Icons.play_circle)),
                const SizedBox(width: 22),
                AppPrimaryButton(
                  onPressed: () {
                    showAppAlertDialog();
                  },
                  color: Colors.red,
                  key: _buttonKey,
                  child: const Text("Open Dialog"),
                ),
                const SizedBox(width: 22),
                IconButton(
                    onPressed: () {
                      _buttonKey.currentState?.hideLoader();
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
