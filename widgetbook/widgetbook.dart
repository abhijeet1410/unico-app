import 'package:flutter/material.dart';
import 'package:flutter_template_3/app/core/theme/app_theme.dart';
import 'package:widgetbook/widgetbook.dart';

import 'alert_dialog_book.dart';
import 'app_collapsable_text_book.dart';
import 'app_photo_chooser_book.dart';
import 'app_responsive_book.dart';
import 'app_user_circle_avatar_book.dart';
import 'buttons.dart';
import 'error_widget_book.dart';
import 'loader_book.dart';
import 'network_image_book.dart';
import 'sheet_book.dart';

class WidgetbookHotReload extends StatelessWidget {
  const WidgetbookHotReload({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // home: Builder(
        //   builder: (context) => Widgetbook(
        //     categories: [
        //       WidgetbookCategory(
        //         name: 'material',
        //         widgets: [
        //           WidgetbookComponent(
        //             name: 'FAB',
        //             useCases: [
        //               WidgetbookUseCase(
        //                 name: 'Icon',
        //                 builder: (context) {
        //                   return FloatingActionButton(
        //                     onPressed: () {},
        //                     child: const Icon(Icons.add),
        //                   );
        //                 },
        //               ),
        //             ],
        //           ),
        //           buttonsBook(),
        //           alertDialogBook(),
        //           collapsableTextBook(),
        //           photoChooserBook(),
        //           responsiveBook(),
        //           userCircleAvatarBook(),
        //           errorWidgetBook(),
        //           loaderBook(),
        //           networkImageBook(),
        //           sheetBook()
        //         ],
        //       ),
        //     ],
        //     appInfo: AppInfo(
        //       name: 'Flutter Template',
        //     ),
        //     themes: [
        //       WidgetbookTheme(
        //         name: 'Light',
        //         data: AppThemes.lightTheme,
        //       ),
        //       WidgetbookTheme(
        //         name: 'Dark',
        //         data: AppThemes.darkTheme,
        //       ),
        //     ],
        //   ),
        // ),
        );
  }
}
