import 'package:flutter/material.dart';
import 'package:flutter_template_3/app/core/theme/app_theme.dart';
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
