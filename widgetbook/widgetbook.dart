import 'package:flutter/material.dart';
import 'package:flutter_template_3/configs/theme_configs/theme_config.dart';
import 'package:flutter_template_3/widgets/app_buttons/app_circle_button.dart';
import 'package:flutter_template_3/widgets/app_buttons/app_outline_button.dart';
import 'package:flutter_template_3/widgets/app_buttons/app_primary_button.dart';
import 'package:widgetbook/widgetbook.dart';

import 'buttons.dart';

class WidgetbookHotReload extends StatelessWidget {
  const WidgetbookHotReload({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Widgetbook(
      categories: [
        WidgetbookCategory(
          name: 'material',
          widgets: [
            WidgetbookComponent(
              name: 'FAB',
              useCases: [
                WidgetbookUseCase(
                  name: 'Icon',
                  builder: (context) {
                    return FloatingActionButton(
                      onPressed: () {},
                      child: const Icon(Icons.add),
                    );
                  },
                ),
              ],
            ),
            buttonsBook(),
          ],
        ),
      ],
      appInfo: AppInfo(name: 'Flutter Template'),
      themes: [
        WidgetbookTheme(
          name: 'Light',
          data: AppThemes.lightTheme,
        ),
        WidgetbookTheme(
          name: 'Dark',
          data: AppThemes.darkTheme,
        ),
      ],
    );
  }
}
