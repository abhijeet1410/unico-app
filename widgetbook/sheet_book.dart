import 'package:flutter/material.dart';
import 'package:unico_app/app/core/widgets/app_buttons/app_primary_button.dart';
import 'package:widgetbook/widgetbook.dart';

///
/// Created by Sisira Sahoo
/// On 15/08/22 11:25 AM
///

WidgetbookComponent sheetBook() {
  GlobalKey<AppPrimaryButtonState> _buttonKey = GlobalKey();
  return WidgetbookComponent(
    name: 'APP SHEET',
    useCases: [
      WidgetbookUseCase(
        name: 'Sheet dialog',
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
                    // showAppAlertSheet();
                  },
                  color: Colors.red,
                  key: _buttonKey,
                  child: const Text("Open Sheet"),
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
